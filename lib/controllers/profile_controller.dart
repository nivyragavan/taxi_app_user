import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/get_profile_model.dart';
import '../services/apiservice.dart';

class ProfileController extends GetxController {
  var getProfileInfo = <GetProfileModel>[].obs;
  // var updateProfileInfo = <ProfileUpdateModel>[].obs;
  var isLoading = true.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();


  @override
  void onInit() {
    fetchProfileInfo();
    super.onInit();
  }

  void fetchProfileInfo() async {
    try {
      isLoading(true);
      var profileInfo = await APIService().fetchProfile();
      if (profileInfo != null) {
        getProfileInfo.assign(profileInfo);
        nameController.text = getProfileInfo[0].body!.name!;
        phoneController.text = getProfileInfo[0].body!.contact!;
        emailController.text = getProfileInfo[0].body!.email!;
      }
    } finally {
      isLoading(false);
    }
  }

  // void fetchProfileUpdate() async {
  //   try {
  //     isLoading(true);
  //     var profileUpdateInfo = await APIService().updateProfile(
  //         namecontroller.text,
  //         phonecontroller.text,
  //         emailcontroller.text,
  //         passwordcontroller.text);
  //     if (profileUpdateInfo != null) {
  //       updateProfileInfo.assign(profileUpdateInfo);
  //       passwordcontroller.text =
  //           profileUpdateInfo.profileEdit[0].password ?? '';
  //     }
  //     return null;
  //   } finally {
  //     isLoading(false);
  //   }
  // }
}
