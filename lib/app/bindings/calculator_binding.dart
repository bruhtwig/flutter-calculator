import 'package:calculator/app/controller/calculator_controller.dart';
import 'package:get/get.dart';

class CalculatorBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(CalculatorController());
  }
}