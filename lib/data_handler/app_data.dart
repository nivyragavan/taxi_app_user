import 'package:flutter/material.dart';

import '../models/address_model.dart';

class AppData extends ChangeNotifier {
  AddressModel? pickupAddress, dropAddress;

  void updatePickupLocation(AddressModel pickupLocation) {
    pickupAddress = pickupLocation;
    notifyListeners();
  }

  void updateDropLocation(AddressModel dropLocation) {
    dropAddress = dropLocation;
    notifyListeners();
  }
}