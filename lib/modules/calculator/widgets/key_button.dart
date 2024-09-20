import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/calculator_controller.dart';
import '../../../utils/helper/calc_helper.dart';

class KeyButton extends StatelessWidget {
  final String buttonKey;
  final String staticKey;
  final TextStyle? textStyle;
  final BorderRadius? borderRadius;
  final TextEditingController? controller;

  const KeyButton({
    super.key,
    required this.buttonKey,
    required this.textStyle,
    this.borderRadius,
    required this.staticKey,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final calculatorProvider =
        Provider.of<CalculatorProvider>(context, listen: false);
    return InkWell(
      onTap: () =>
          CalcHelperFunctions.onButtonPressed(buttonKey, calculatorProvider),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: borderRadius,
        ),
        child: Text(
          staticKey,
          style: textStyle,
        ),
      ),
    );
  }
}
