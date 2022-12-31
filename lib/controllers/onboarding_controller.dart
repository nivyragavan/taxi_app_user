import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';

import '../models/onboarding_info.dart';

class OnboardingController extends GetxController {
  var selectedpageIndex = 0.obs;
  bool get isLastPage => selectedpageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  ForwardAction() {
    if (isLastPage) {
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('assets/images/introimg1.png', 'Ride Request',
        'Request a ride and get picked up by a nearby driver'),
    OnboardingInfo('assets/images/introimg2.png', 'Ride Tracking',
        'Track your driver location from your place'),
    OnboardingInfo('assets/images/introimg3.png', 'Easy Payment',
        'No more worry for payments')
  ];
}
