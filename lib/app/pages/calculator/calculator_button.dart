import 'package:calculator/app/controller/calculator_controller.dart';
import 'package:calculator/app/model/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class CalculatorButton extends GetView<CalculatorController> {
  const CalculatorButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: Get.height * 0.615,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            children: List.generate(
              buttons.length,
              (index) => StaggeredGridTile.count(
                crossAxisCellCount: buttons[index].crossAxisCellCount,
                mainAxisCellCount: buttons[index].mainAxisCellCount,
                child: _myButton(
                  buttons[index].text,
                  _getButtonColor(buttons[index].text),
                  _getTextColor(buttons[index].text),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _myButton(text, color, textColor) {
    return MaterialButton(
      onPressed: () {
        switch (text) {
          case 'Ac': return controller.reset();
          case '⌫': return controller.delete();
          case '=': return controller.submit();
          default: return controller.input(text);
        }
      },
      color: color,
      textColor: textColor,
      padding: const EdgeInsets.all(5),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      elevation: 0,
      highlightElevation: 0,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 35,
        ),
      ),
    );
  }

  Color _getButtonColor(String buttonText) {
    if (buttonText == '=') return const Color(0xFF199FFF);
    return controller.isDarkMode.value
        ? controller.isOperator(buttonText)
            ? const Color(0xFF005DB2)
            : const Color(0xFF303136)
        : controller.isOperator(buttonText)
            ? const Color(0xFFADE2FF)
            : const Color(0xFFFFFFFF);
  }

  Color _getTextColor(buttonText) {
    if (controller.isOperator(buttonText)) return const Color(0xFF1AA1FF);
    if (buttonText == 'Ac' || buttonText == '⌫') return const Color(0xFF959595);
    if (buttonText == '=') return const Color(0xFFB2DAFF);
    return const Color(0xFF30B0FF);
  }
}
