import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController {
  final expression = '0'.obs;
  final result = ''.obs;

  final isDarkMode = false.obs;
  bool isFromResult = false;

  bool isOperator(text) => ['+', '-', '×', '÷', 'e'].contains(text);
  bool isDecimal() => expression.split(RegExp(r'[\-+÷×]')).last.contains('.');

  void input(value) {
    if (isOperator(value) || value == '.') {
      if (isOperator(expression.value.characters.last)) delete();
      if (value == '.' && isDecimal()) return;
      expression.value += value;
    } else {
      if (expression == result && isFromResult) return expression.value = value;
      expression.value == '0'
          ? expression.value = value
          : expression.value += value;
    }
    isFromResult = false;
  }

  void delete() {
    expression.value = expression.substring(0, expression.value.length - 1);
    if (expression.isEmpty) expression.value = '0';
  }

  void reset() {
    expression.value = '0';
    result.value = '';
  }

  void submit() {
    if (isOperator(expression.value.characters.last)) delete();
    final e = expression.replaceAll('×', '*').replaceAll('÷', '/');
    num eval = Parser().parse(e).evaluate(EvaluationType.REAL, ContextModel());

    if (eval.isFinite) {
      eval.isEqual(eval.toInt())
          ? result.value = eval.toInt().toString()
          : result.value = eval.toString();
      expression.value = result.value;
    } else {
      result.value = eval.toString();
    }
    isFromResult = true;
  }

  String numberFormat(number) {
    number = double.parse(number);
    if (number >= 1e+15 || number <= -1e+15 && number != 0) {
      return NumberFormat.scientificPattern().format(number);
    } else if (number >= 1e+12 || number <= -1e+12) {
      return NumberFormat('#,###').format(number);
    } else if (number >= 1e+9 || number <= -1e+9) {
      return NumberFormat('#,###.###').format(number);
    } else if (number >= 1e+6 || number <= -1e+6) {
      return NumberFormat('#,###.######').format(number);
    } else if (number >= 1e+3 || number <= -1e+3) {
      return NumberFormat('#,###.#########').format(number);
    } else {
      return NumberFormat('#,###.############').format(number);
    }
  }
}
