import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import '../../modules/calculator/controller/calculator_controller.dart';

class CalcHelperFunctions {
  CalcHelperFunctions._();

  // -- TextEditingController Helper Function.
  static int getCursorPosition(TextEditingController controller) {
    return controller.selection.baseOffset;
  }

  static void setCursorPosition(
      int? newCursorPosition, TextEditingController controller) {
    if (newCursorPosition != null) {
      controller.selection = TextSelection.collapsed(offset: newCursorPosition);
    } else {
      controller.selection =
          TextSelection.collapsed(offset: controller.text.length);
    }
  }

  static int? getNewCursorPosition(
      CalculatorProvider provider, TextEditingController controller) {
    int? cursorPosition =
        provider.removeSingleCharacter(getCursorPosition(controller));
    return cursorPosition;
  }

  static String formatDouble(double number) {
    if (number == number.toInt()) {
      return number.toInt().toString();
    } else {
      return number.toString();
    }
  }

  static String getExpressionEvaluation(String equation) {
    String finalEquation = equation.replaceAll('x', "*");

    Parser p = Parser();
    Expression exp = p.parse(finalEquation);
    ContextModel cm = ContextModel();
    double evaluation = exp.evaluate(EvaluationType.REAL, cm);
    return formatDouble(evaluation);
  }

  static void onButtonPressed(buttonKey, calculatorProvider) {
    if (buttonKey == "C") {
      calculatorProvider.clearAllInput();
    } else {
      calculatorProvider.addToEquation(
        buttonKey,
        CalcHelperFunctions.getCursorPosition(
            calculatorProvider.textController),
      );
    }
  }
}
