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

  // -- Expression helper function

  static String formatDouble(double number) {
    if (number == number.toInt()) {
      return number.toInt().toString();
    } else {
      return number.toString();
    }
  }

  static String getExpressionEvaluation(String equation) {
    String finalEquation = equation.replaceAll('x', "*");
    finalEquation = finalEquation.replaceAll('%', '/100');
    finalEquation = finalEquation.replaceAll('\u00F7', '/');

    final Parser p = Parser();

    if (checkParse(finalEquation, p)) {
      Expression exp = p.parse(finalEquation);
      ContextModel cm = ContextModel();
      double evaluation = exp.evaluate(EvaluationType.REAL, cm);
      return formatDouble(evaluation);
    } else {
      return '';
    }
  }

  static bool checkParse(String expression, Parser p) {
    try {
      p.parse(expression);
      return true;
    } catch (e) {
      return false;
    }
  }

  static void onButtonPressed(buttonKey, calculatorProvider) {
    if (buttonKey == "C") {
      calculatorProvider.clearAllInput();
    } else {
      calculatorProvider.addToEquation(buttonKey);
    }
  }

  static bool isOperator(String value) {
    switch (value) {
      case '+':
        return true;
      case '-':
        return true;
      case '\u00F7':
        return true;
      case 'x':
        return true;
      case '%':
        return true;
      case '.':
        return true;
      default:
        return false;
    }
  }

  static bool isSymbol(String value) {
    switch (value) {
      case '(':
        return true;
      case ')':
        return true;
      case '(-':
        return true;
      default:
        return false;
    }
  }

  static String checkBrackets(equation, cursorPosition) {
    if (cursorPosition == 0) {
      return "(";
    } else {
      for (int i = 1; i <= equation.length; i++) {
        String character = equation[equation.length - i];
        if (character == "(") {
          return ")";
        } else if (character == ")") {
          return "x(";
        }
      }
      return 'x(';
    }
  }

  // static String checkNegativeBrackets(provider) {
  //   final int cursorPosition = provider.cursorPosition;
  //   final String equation = provider.equation;

  //   if (cursorPosition == 0) {
  //     return '(-';
  //   } else {
  //     for (int i = cursorPosition; i > 1; i--) {
  //       String character = equation[i - 1];
  //       if (isOperator(character) || cursorPosition == 0) {
  //         provider.textController.text =
  //             equation.substring(0, i) + character + equation.substring(i);
  //         provider.updateControllerValue;
  //       } else if (character == ")") {
  //         return "x(";
  //       }
  //     }
  //     return 'x(';
  //   }
  // }

  // static bool checkInteger(value) {
  //   try {
  //     int.parse(value);
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }
}
