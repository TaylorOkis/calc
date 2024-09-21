import 'package:flutter/material.dart';

import '../../../utils/helper/calc_helper.dart';

class CalculatorProvider with ChangeNotifier {
  // Negative number controller
  bool _isNegative = false;
  bool get isNegative => _isNegative;
  void setIsNegative() {
    _isNegative = !isNegative;
  }

  // -- Text Editing controller
  final TextEditingController _textController = TextEditingController();
  TextEditingController get textController => _textController;

  void updateControllerValue(cursorPositon) {
    textController.text = equation;
    textController.selection = TextSelection.collapsed(offset: cursorPositon);
  }

  int get cursorPosition => textController.selection.baseOffset;
  void setCursorPosition(cursorPosition) {
    textController.selection = TextSelection.collapsed(offset: cursorPosition);
  }

  // -- Equation Variable
  String _equation = '';
  String get equation => _equation;
  void setEquation(String value) {
    _equation = value;
    notifyListeners();
  }

  void addToEquation(String value) {
    if (equation.isNotEmpty && cursorPosition > 0) {
      if (CalcHelperFunctions.isOperator(value)) {
        if (CalcHelperFunctions.isOperator(equation[cursorPosition - 1]) &&
            value != "%") {
        } else {
          if (equation.length > 1 && cursorPosition < equation.length) {
            if (CalcHelperFunctions.isOperator(equation[cursorPosition])) {
            } else {
              addNewValue(cursorPosition, value);
            }
          } else {
            addNewValue(cursorPosition, value);
          }
        }
      } else {
        addNewValue(cursorPosition, value);
      }
    } else {
      if (!CalcHelperFunctions.isOperator(value)) {
        addNewValue(cursorPosition, value);
      } else {}
    }
    calculateExpression(null);
  }

  void addNewValue(int cursorPosition, String value) {
    String updatedEquation = equation.substring(0, cursorPosition) +
        value +
        equation.substring(cursorPosition);
    setEquation(updatedEquation);
    updateControllerValue(cursorPosition + 1);
    notifyListeners();
  }
  // ---- //

  // -- Result Variable
  String _result = '';
  String get result => _result;
  void setResult(String value) {
    _result = value;
    notifyListeners();
  }

  void calculateExpression(String? buttonKey) {
    String? calculationResult =
        CalcHelperFunctions.getExpressionEvaluation(equation);
    if (buttonKey == '=') {
      setEquation(calculationResult);
      setResult('');
    } else {
      setResult(calculationResult);
    }
    updateControllerValue(equation.length);
    notifyListeners();
  }

  void clearAllInput() {
    setEquation("");
    setResult("");
    updateControllerValue(0);
    notifyListeners();
  }
  // ---- //

  int? removeSingleCharacter(int cursorPosition) {
    if (equation.isNotEmpty) {
      if (cursorPosition > 0) {
        String newEquation = equation.substring(0, cursorPosition - 1) +
            equation.substring(cursorPosition);
        setEquation(newEquation);
        notifyListeners();
        int newCursorPosition = cursorPosition - 1;
        updateControllerValue(newCursorPosition);
        calculateExpression(null);
        return newCursorPosition;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
