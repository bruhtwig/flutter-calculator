import 'package:calculator/app/controller/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpressionScreen extends GetView<CalculatorController> {
  const ExpressionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.15,
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Obx(
          () {
            final regex = RegExp(r'(\d+(\.\d+)?([eE][+\-]?\d+)?)|([+\-÷×])');
            final matches = regex.allMatches(controller.expression.value);
            final expression = matches.map((e) => e.group(0)).toList();
            return RichText(
              maxLines: 2,
              text: TextSpan(
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 25,
                ),
                children: List.generate(
                  expression.length,
                  (index) => controller.isOperator(expression[index])
                      ? TextSpan(
                          text: expression[index],
                          style: const TextStyle(
                            color: Color(0xFF109DFF),
                          ),
                        )
                      : TextSpan(
                          text: controller.numberFormat(expression[index]),
                          style: const TextStyle(
                            color: Color(0xFF818181),
                          ),
                        ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
