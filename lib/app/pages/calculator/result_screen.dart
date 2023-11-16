import 'package:calculator/app/controller/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultScreen extends GetView<CalculatorController> {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.1,
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Obx(
          () => Text(
            controller.result.value == ''
                ? controller.result.value
                : controller.numberFormat(controller.result.value),
            style: TextStyle(
              fontSize: controller.result.value.length > 10 ? 30 : 50,
              color: controller.isDarkMode.value ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
