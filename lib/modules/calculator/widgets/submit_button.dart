import 'package:calc/modules/calculator/controller/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubmitButton extends StatelessWidget {
  final String buttonText;
  final TextStyle? textStyle;
  const SubmitButton({
    super.key,
    required this.buttonText,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final calculatorProvider =
        Provider.of<CalculatorProvider>(context, listen: false);
    return InkWell(
      onTap: () => calculatorProvider.calculateExpression(),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Text(
          buttonText,
          style: textStyle,
        ),
      ),
    );
  }
}
