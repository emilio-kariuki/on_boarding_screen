import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/onBoardingModel.dart';
import 'package:get/utils.dart';

class OnBoardingController {
  var selectedIndex = 0.obs;
  var pageController = PageController();

  nextPage() {
    pageController.nextPage(duration: 500.milliseconds, curve: Curves.easeIn);
  }

  List<OnBoardingModel> onBoarding = [
    OnBoardingModel(
      title: 'Burger Strategic',
      description: 'The biggest food company in the world',
      image: 'assets/burger_1.png',
    ),
    OnBoardingModel(
      title: 'Burgericious',
      description: 'The best burgers in the world',
      image: 'assets/burger_2.png',
    ),
    OnBoardingModel(
      title: 'Burger Cheese',
      description: 'The cheesiest burger in the world',
      image: 'assets/burger_4.png',
    ),
  ];
}
