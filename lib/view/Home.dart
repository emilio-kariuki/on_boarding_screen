// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_boarding_screen/controller/OnBoardingController.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = OnBoardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          PageView.builder(
              controller: _controller.pageController,
              onPageChanged: _controller.selectedIndex,
              itemCount: _controller.onBoarding.length,
              itemBuilder: (context, index) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(_controller.onBoarding[index].image!),
                      const SizedBox(height: 20),
                      Text(
                        _controller.onBoarding[index].title!,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        _controller.onBoarding[index].description!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ]);
              }),
          Positioned(
              left: 15,
              bottom: 15,
              child: Row(
                children: List.generate(
                    _controller.onBoarding.length,
                    (index) => Obx(() {
                          return Container(
                            margin: const EdgeInsets.only(right: 5),
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _controller.selectedIndex == index
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                          );
                        })),
              )),
          Positioned(
              right: 10,
              bottom: 10,
              child: FloatingActionButton(
                elevation: 0,
                backgroundColor: const Color(0xFF4e5ae8),
                onPressed: _controller.nextPage,
                child: Obx(() {
                  return Text(_controller.selectedIndex ==
                          _controller.onBoarding.length - 1
                      ? "Start"
                      : "Next");
                }),
              )),
        ],
      ),
    ));
  }
}
