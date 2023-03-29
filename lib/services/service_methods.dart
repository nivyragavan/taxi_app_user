import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:taxi_user_app/models/address_model.dart';
import 'package:taxi_user_app/services/location_service.dart';

import '../data_handler/app_data.dart';
import '../models/direction_model.dart';

class ServiceMethods {
  Future searchCoordinateAddress(
       context, Position position) async {
    String placeAddress = "";
    String st1, st2, st3, st4;
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=AIzaSyDa3ndOn9kcJhiJqKBwi6D9WLwO_mH-_tM";

    final response = await LocationService().getRequest(url);

    print(response);
    print(url);

    if (response != "Failed") {
      st1 = response["results"][0]["address_components"][0]["long_name"];
      st2 = response["results"][0]["address_components"][3]["long_name"];
      st3 = response["results"][0]["address_components"][4]["long_name"];
      st4 = response["results"][0]["address_components"][7]["long_name"];

      placeAddress = st1 + ", " + st2 + ", " + st3 + ", " + st4;

      AddressModel userPickupAddress = AddressModel();
      userPickupAddress.placeName = placeAddress;
      userPickupAddress.latitude = position.latitude;
      userPickupAddress.longitude = position.longitude;

      Provider.of<AppData>(context, listen: false).updatePickupLocation(userPickupAddress);
    }

    return placeAddress;
  }

  Future<DirectionModel?> obtainPlaceDirectionDetails(LatLng initialPosition, LatLng finalPosition) async {
    String directionUrl = "https://maps.googleapis.com/maps/api/directions/json?origin=${initialPosition.latitude},${initialPosition.longitude}&destination=${finalPosition.latitude},${finalPosition.longitude}&key=AIzaSyDa3ndOn9kcJhiJqKBwi6D9WLwO_mH-_tM";

    final response = await LocationService().getRequest(directionUrl);
    if(response == "failed"){
      return null;
    }
    DirectionModel directionModel = DirectionModel();

    directionModel.encodedPoints = response["routes"][0]["overview_polyline"]["points"];

    directionModel.distanceText = response["routes"][0]["legs"][0]["distance"]["text"];
    directionModel.distanceValue = response["routes"][0]["legs"][0]["distance"]["value"];

    directionModel.durationText = response["routes"][0]["legs"][0]["duration"]["text"];
    directionModel.durationValue = response["routes"][0]["legs"][0]["duration"]["value"];

    return directionModel;

  }

  int calculateMiniFare(DirectionModel directionModel){

    /// in usd

    double timeTravelledFare = (directionModel.durationValue! / 60) * 0.10;
    double distanceTravelledFare = (directionModel.distanceValue! / 1000) * 0.10;
    double totalFare = timeTravelledFare + distanceTravelledFare;

    ///in rupees
    double totalFareAmount = totalFare * 80;

    return totalFareAmount.truncate();
  }

  int calculateSedanFare(DirectionModel directionModel){

    /// in usd

    double timeTravelledFare = (directionModel.durationValue! / 60) * 0.11;
    double distanceTravelledFare = (directionModel.distanceValue! / 1000) * 0.11;
    double totalFare = timeTravelledFare + distanceTravelledFare;

    ///in rupees
    double totalFareAmount = totalFare * 80;

    return totalFareAmount.truncate();
  }

  int calculateXUVFare(DirectionModel directionModel){

    /// in usd

    double timeTravelledFare = (directionModel.durationValue! / 60) * 0.13;
    double distanceTravelledFare = (directionModel.distanceValue! / 1000) * 0.13;
    double totalFare = timeTravelledFare + distanceTravelledFare;

    ///in rupees
    double totalFareAmount = totalFare * 80;

    return totalFareAmount.truncate();
  }

  int calculateRentalFare(DirectionModel directionModel){

    /// in usd

    double timeTravelledFare = (directionModel.durationValue! / 60) * 0.14;
    double distanceTravelledFare = (directionModel.distanceValue! / 1000) * 0.14;
    double totalFare = timeTravelledFare + distanceTravelledFare;

    ///in rupees
    double totalFareAmount = totalFare * 80;

    return totalFareAmount.truncate();
  }

  int calculateOutstationFare(DirectionModel directionModel){

    /// in usd

    double timeTravelledFare = (directionModel.durationValue! / 60) * 0.15;
    double distanceTravelledFare = (directionModel.distanceValue! / 1000) * 0.15;
    double totalFare = timeTravelledFare + distanceTravelledFare;

    ///in rupees
    double totalFareAmount = totalFare * 80;

    return totalFareAmount.truncate();
  }

  int calculateTourFare(DirectionModel directionModel){

    /// in usd

    double timeTravelledFare = (directionModel.durationValue! / 60) * 0.16;
    double distanceTravelledFare = (directionModel.distanceValue! / 1000) * 0.16;
    double totalFare = timeTravelledFare + distanceTravelledFare;

    ///in rupees
    double totalFareAmount = totalFare * 80;

    return totalFareAmount.truncate();
  }
}
