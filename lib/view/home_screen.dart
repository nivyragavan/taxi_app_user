import 'dart:async';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:taxi_user_app/models/direction_model.dart';
import 'package:taxi_user_app/models/place_prediction_model.dart';
import 'package:taxi_user_app/services/service_methods.dart';
import 'package:taxi_user_app/view/home_tab_screens/hatchback_screen.dart';
import 'package:taxi_user_app/view/home_tab_screens/sedan_screen.dart';
import 'package:taxi_user_app/view/home_tab_screens/xuv_screen.dart';
import 'package:taxi_user_app/view/in_progress_screen.dart';
import 'package:taxi_user_app/view/outstation_tab_screens/outstation_drop_off_screen.dart';
import 'package:taxi_user_app/view/outstation_tab_screens/outstation_ride_screen.dart';
import 'package:taxi_user_app/view/rental_tab_screens/select_package_screen.dart';
import 'package:taxi_user_app/view/search_screen.dart';
import 'package:taxi_user_app/view/tour_tab_screens/tour_dropoff_screen.dart';
import 'package:taxi_user_app/view/tour_tab_screens/tour_package_screen.dart';
import '../constants/colors.dart';
import '../data_handler/app_data.dart';
import '../widgets/drawer_widget.dart';
import 'notification_offer_screen.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PlacePredictionModel> placePrediction = [];

  DirectionModel? directionModel;

  ///Map Code

  Completer<GoogleMapController> googleMapCompleter = Completer();
  GoogleMapController? googleMapController;

  Position? currentPosition;
  var geoLocator = Geolocator();

  Future<Position?> locatePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location service disabled.');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission == await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permission');
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latLngPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
        CameraPosition(target: latLngPosition, zoom: 20);
    googleMapController!
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    String address =
        await ServiceMethods().searchCoordinateAddress(context, position);
    print("This is your address " + address);

    return null;
  }

  final CameraPosition currentLocation =
      const CameraPosition(target: LatLng(11.0168, 76.9558), zoom: 15);

  ///polyline
  List<LatLng> polylineCoordinates = [];
  Set<Polyline> polylineSet = {};

  ///markers
  Set<Marker> markers = {};
  Set<Circle> circles = {};

  ///TextEditingController

  final pickupLocationController = TextEditingController();
  final dropLocationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String pickupAddress =
        Provider.of<AppData>(context, listen: false).pickupAddress?.placeName ??
            "";
    pickupLocationController.text = pickupAddress;
    String dropAddress =
        Provider.of<AppData>(context, listen: false).dropAddress?.placeName ??
            "";
    dropLocationController.text = dropAddress;
    return Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: buildAppBar(),
        drawer: const DrawerWidget(),
        body: Stack(
          alignment: AlignmentDirectional.topCenter,
          clipBehavior: Clip.none,
          children: [
            buildMap(),
            Positioned(
                top: 50, left: 0, right: 0, child: buildPickUpLocation()),
            Positioned(top: 140, left: 0, right: 0, child: buildDropLocation()),
            buildDraggableBottomSheet()
          ],
        ));
  }

  buildAppBar() {
    return AppBar(
      title: Text(
        'Book Your Rides',
        style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w500, color: blueGreen),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: badges.Badge(
            position: badges.BadgePosition.topEnd(top: 2, end: 5),
            badgeContent: const Text(
              '3',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            badgeStyle: badges.BadgeStyle(
              badgeColor: blueGreen,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.notification_important_outlined,
                size: 30,
                color: Colors.black,
              ),
              onPressed: () {
                Get.to(const NotificationOfferScreen());
              },
            ),
          ),
        )
      ],
    );
  }

  buildMap() {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationButtonEnabled: true,
      initialCameraPosition: currentLocation,
      myLocationEnabled: true,
      zoomGesturesEnabled: true,
      zoomControlsEnabled: true,
      polylines: polylineSet,
      markers: markers,
      circles: circles,
      onMapCreated: (GoogleMapController controller) {
        googleMapCompleter.complete(controller);
        googleMapController = controller;
        locatePosition();
      },
    );
  }

  buildPickUpLocation() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 5)]),
        child: TextField(
          controller: pickupLocationController,
          cursorColor: Colors.black54,
          decoration: InputDecoration(
              hintText: 'Pickup Location',
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              border: InputBorder.none),
        ),
      ),
    );
  }

  buildDropLocation() {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 5)]),
          child: TextField(
            controller: dropLocationController,
            cursorColor: Colors.black54,
            readOnly: true,
            onTap: () async {
              var response = await Get.to(SearchScreen());
              if (response == "obtainDirection") {
                await getPlaceDirection();
              }
            },
            decoration: InputDecoration(
                hintText: 'Drop Location',
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                border: InputBorder.none),
          ),
        ));
  }

  buildDraggableBottomSheet() {
    return DraggableScrollableSheet(
        initialChildSize: 0.1,
        minChildSize: 0.1,
        maxChildSize: 0.5,
        builder: (context, controller) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(color: blueGreen, blurRadius: 10, spreadRadius: 0.5)
                ]),
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: ListView(
                controller: controller,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: [
                        Container(
                          width: 80,
                          height: 8,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: blueGreen.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Image.asset('assets/images/carimg1.png'),
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Mini',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    subtitle: Text(
                      directionModel != null
                          ?'${directionModel!.distanceText}':'5 mins',
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: Text(
                      directionModel != null
                          ? '\u{20b9} ${ServiceMethods().calculateMiniFare(directionModel!)}'
                          : 'Fare',
                      style: TextStyle(fontSize: 18),
                    ),
                    onTap: () {
                      Get.to(MiniScreen());
                    },
                  ),
                  Divider(color: blueGreen),
                  ListTile(
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: blueGreen.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset('assets/images/carimg2.png'),
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Sedan',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    subtitle: Text(
                      directionModel != null
                          ?'${directionModel!.distanceText}': '5 Mins',
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: Text(
                        directionModel != null
                            ? '\u{20b9} ${ServiceMethods().calculateSedanFare(directionModel!)}'
                            : 'Fare',
                      style: TextStyle(fontSize: 18),
                    ),
                    onTap: () {
                      Get.to(SedanScreen());
                    },
                  ),
                  Divider(color: blueGreen),
                  ListTile(
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: blueGreen.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset('assets/images/carimg3.png'),
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'XUV',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    subtitle: Text(
                      directionModel != null
                          ?'${directionModel!.distanceText}':'5 Mins',
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: Text(
                        directionModel != null
                            ? '\u{20b9} ${ServiceMethods().calculateXUVFare(directionModel!)}'
                            : 'Fare',
                      style: TextStyle(fontSize: 18),
                    ),
                    onTap: () {
                      Get.to(XuvScreen());
                    },
                  ),
                  Divider(color: blueGreen),
                  ListTile(
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: blueGreen.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset('assets/images/carimg2.png'),
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Rental',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    subtitle: Text(
                      'Choose rental hour',
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Get.to(SelectPackageScreen());
                    },
                  ),
                  Divider(color: blueGreen),
                  ListTile(
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: blueGreen.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset('assets/images/carimg3.png'),
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Outstation',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    subtitle: Text(
                      'Choose number of days',
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Get.to(OutstationRideScreen());
                    },
                  ),
                  Divider(color: blueGreen),
                  ListTile(
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: blueGreen.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset('assets/images/carimg4.png'),
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Tour',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    subtitle: Text(
                      'Choose number of days',
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Get.to(TourPackageScreen());
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<void> getPlaceDirection() async {
    ///to get the direction

    var initialPosition =
        Provider.of<AppData>(context, listen: false).pickupAddress;
    var finalPosition =
        Provider.of<AppData>(context, listen: false).dropAddress;

    var pickupLatLng =
        LatLng(initialPosition!.latitude!, initialPosition.longitude!);
    var dropLatLng = LatLng(finalPosition!.latitude!, finalPosition.longitude!);

    var details = await ServiceMethods()
        .obtainPlaceDirectionDetails(pickupLatLng, dropLatLng);
    print("This is your encoded points :: ${details!.encodedPoints}");

    setState(() {
      directionModel = details;
    });

    ///to add polyline from pickup to drop location

    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> decodedPolylinePointsResult =
        polylinePoints.decodePolyline(details.encodedPoints!);

    polylineCoordinates.clear();

    if (decodedPolylinePointsResult.isNotEmpty) {
      decodedPolylinePointsResult.forEach((PointLatLng pointLatLng) {
        polylineCoordinates
            .add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
      });
    }

    polylineSet.clear();

    setState(() {
      Polyline polyline = Polyline(
          polylineId: PolylineId("PolylineID"),
          color: blueGreen,
          jointType: JointType.round,
          points: polylineCoordinates,
          width: 5,
          startCap: Cap.roundCap,
          endCap: Cap.roundCap,
          geodesic: true);
      polylineSet.add(polyline);
    });

    ///to zoom out the map and show the complete route of pick and drop

    LatLngBounds latLngBounds;
    if (pickupLatLng.latitude > dropLatLng.latitude &&
        pickupLatLng.longitude > dropLatLng.longitude) {
      latLngBounds =
          LatLngBounds(southwest: dropLatLng, northeast: pickupLatLng);
    } else if (pickupLatLng.longitude > dropLatLng.longitude) {
      latLngBounds = LatLngBounds(
          southwest: LatLng(pickupLatLng.latitude, dropLatLng.longitude),
          northeast: LatLng(dropLatLng.latitude, pickupLatLng.longitude));
    } else if (pickupLatLng.latitude > dropLatLng.latitude) {
      latLngBounds = LatLngBounds(
          southwest: LatLng(dropLatLng.latitude, pickupLatLng.longitude),
          northeast: LatLng(pickupLatLng.latitude, dropLatLng.longitude));
    } else {
      latLngBounds =
          LatLngBounds(southwest: pickupLatLng, northeast: dropLatLng);
    }
    googleMapController!
        .animateCamera(CameraUpdate.newLatLngBounds(latLngBounds, 70));

    ///to set markers

    Marker pickupMarker = Marker(
        markerId: MarkerId('pickup'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow: InfoWindow(
            title: initialPosition.placeName, snippet: "My Location"),
        position: pickupLatLng);

    Marker dropMarker = Marker(
        markerId: MarkerId('drop'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        infoWindow: InfoWindow(
            title: finalPosition.placeName, snippet: "Drop Location"),
        position: dropLatLng);

    setState(() {
      markers.add(pickupMarker);
      markers.add(dropMarker);
    });

    ///to set circle

    Circle pickupCircle = Circle(
      circleId: CircleId('pickup'),
      fillColor: Colors.deepPurple,
      center: pickupLatLng,
      radius: 12,
      strokeWidth: 4,
      strokeColor: Colors.deepPurple,
    );

    Circle dropCircle = Circle(
      circleId: CircleId('drop'),
      fillColor: Colors.green,
      center: dropLatLng,
      radius: 12,
      strokeWidth: 4,
      strokeColor: Colors.green,
    );

    setState(() {
      circles.add(pickupCircle);
      circles.add(dropCircle);
    });
  }
}
