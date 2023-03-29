// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_webservice/places.dart';
//
//
// class LocationController extends GetxController {
//   Placemark pickPlace = Placemark();
//   Placemark get pickPlaceMark => pickPlace;
//
//   List<Prediction> predictions = [];
//
//   Future<List<Prediction>> pickupLocation(BuildContext context, String text) async {
//     if(text != null && text.isNotEmpty) {
//       final response = await getPickupLocation(text);
//       var data = jsonDecode(response.body.toString());
//       print("status ===== ${data["status"]}");
//       if(data["status"] == "OK"){
//         predictions = [];
//         data['predictions'].forEach((prediction)=>predictions.add(Prediction.fromJson(prediction)));
//       } else {
//
//       }
//     }
//     return predictions;
//   }
// }