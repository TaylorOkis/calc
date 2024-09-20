import 'package:flutter/material.dart';

import '../../../utils/helper/calc_helper.dart';

class CalculatorProvider with ChangeNotifier {
  final TextEditingController _textController = TextEditingController();
  TextEditingController get textController => _textController;

  void updateControllerValue(cursorPositon) {
    textController.text = equation;
    textController.selection = TextSelection.collapsed(offset: cursorPositon);
  }

  // -- Equation Variable
  String _equation = '';
  String get equation => _equation;
  void setEquation(String value) {
    _equation = value;
    notifyListeners();
  }

  void addToEquation(String value, int? cursorPosition) {
    if (cursorPosition != null) {
      String updatedEquation = equation.substring(0, cursorPosition) +
          value +
          equation.substring(cursorPosition);
      setEquation(updatedEquation);
      updateControllerValue(cursorPosition + 1);
      notifyListeners();
    }
  }
  // ---- //

  // -- Result Variable
  String _result = '';
  String get result => _result;
  void setResult(String value) {
    _result = value;
    notifyListeners();
  }

  void calculateExpression() {
    setResult(CalcHelperFunctions.getExpressionEvaluation(equation));
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
        return newCursorPosition;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
