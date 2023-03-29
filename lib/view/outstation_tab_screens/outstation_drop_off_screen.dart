import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../data_handler/app_data.dart';
import '../../models/address_model.dart';
import '../../models/place_prediction_model.dart';
import '../../services/location_service.dart';
import '../../widgets/appbar_widget.dart';



class OutstationDropOffScreen extends StatefulWidget {
  const OutstationDropOffScreen({Key? key}) : super(key: key);

  @override
  State<OutstationDropOffScreen> createState() => _OutstationDropOffScreenState();
}

class _OutstationDropOffScreenState extends State<OutstationDropOffScreen> {
  final dropLocationController = TextEditingController();

  List<PlacePredictionModel> placePrediction = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarWidget(title: 'Choose Drop Off Location'),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                TextField(
                  controller: dropLocationController,
                  cursorColor: Colors.black54,
                  decoration: InputDecoration(
                      hintText: 'Drop Location',
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: black),
                          borderRadius: BorderRadius.circular(50)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: black),
                          borderRadius: BorderRadius.circular(50)),
                      filled: true,
                      fillColor: blueGreen.withOpacity(0.4)),
                  onChanged: (value) {
                    findPlace(value);
                  },
                ),
                const SizedBox(height: 15),
                placePrediction.isEmpty
                    ? Container()
                    : ListView.separated(
                  itemCount: placePrediction.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text('${placePrediction[index].main_text}'),
                      subtitle:
                      Text('${placePrediction[index].secondary_text}'),
                      onTap: () {
                        getPlaceDetails(
                            context, placePrediction[index].place_id!);
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                )
              ],
            ),
          ),
        ));
  }

  ///get place list on type
  void findPlace(String placeName) async {
    if (placeName.length > 1) {
      String autoCompleteUrl =
          "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=AIzaSyDa3ndOn9kcJhiJqKBwi6D9WLwO_mH-_tM&components=country:in";

      final response = await LocationService().getRequest(autoCompleteUrl);
      if (response == 'failed') {
        return;
      }
      if (response["status"] == "OK") {
        var predictions = response["predictions"];
        var placesList = (predictions as List)
            .map((e) => PlacePredictionModel.fromJson(e))
            .toList();

        setState(() {
          placePrediction = placesList;
        });
      }
    }
  }

  ///show picked place details
  void getPlaceDetails(BuildContext context, String placeId) async {
    String placeDetailsUrl =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=AIzaSyDa3ndOn9kcJhiJqKBwi6D9WLwO_mH-_tM';

    final response = await LocationService().getRequest(placeDetailsUrl);

    if (response == "failed") {
      return;
    }
    if (response["status"] == "OK") {
      AddressModel addressModel = AddressModel();
      addressModel.placeId = placeId;
      addressModel.placeName = response["result"]["name"];
      addressModel.latitude = response["result"]["geometry"]["location"]["lat"];
      addressModel.longitude =
      response["result"]["geometry"]["location"]["lng"];

      Provider.of<AppData>(context, listen: false)
          .updateDropLocation(addressModel);
      print("this is your drop location ${addressModel.placeName}");

      Get.back(result: "obtainDirection");
      // Get.to(OutstationDropOffScreen());
    }
  }
}
