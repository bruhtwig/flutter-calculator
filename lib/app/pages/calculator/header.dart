import 'package:calculator/app/controller/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Header extends GetView<CalculatorController> {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: GestureDetector(
          onTap: () => controller.isDarkMode.value = !controller.isDarkMode.value,
          child: Container(
            width: 70,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: controller.isDarkMode.value
                  ? const Color(0xFF303136)
                  : const Color(0xFFFFFFFF),
            ),
            child: Stack(
              children: [
                const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.wb_sunny_rounded,
                        color: Colors.grey,
                        size: 20,
                      ),
                      Icon(
                        Icons.nights_stay,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ),
                AnimatedAlign(
                  duration: const Duration(milliseconds: 400),
                  alignment: controller.isDarkMode.value
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  curve: Curves.decelerate,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: controller.isDarkMode.value
                            ? const Color(0xFF005DB2)
                            : const Color(0xFFADE2FF),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
