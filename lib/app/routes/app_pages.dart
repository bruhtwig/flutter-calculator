import 'package:calculator/app/bindings/calculator_binding.dart';
import 'package:calculator/app/pages/calculator/my_calculator.dart';
import 'package:calculator/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.initial,
      page: () => const MyCalculator(),
      binding: CalculatorBinding(),
    )
  ];
}
