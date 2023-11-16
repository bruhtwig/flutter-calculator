import 'package:calculator/app/controller/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'calculator_button.dart';
import 'expression_screen.dart';
import 'header.dart';
import 'result_screen.dart';

class MyCalculator extends GetView<CalculatorController> {
  const MyCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: controller.isDarkMode.value
            ? const Color(0xFF17181A)
            : const Color(0xFFF7F8FB),
        body: const Column(
          children: [
            Header(),
            ExpressionScreen(),
            ResultScreen(),
            CalculatorButton(),
          ],
        ),
      ),
    );
  }
}
