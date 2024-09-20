import 'package:calc/modules/calculator/controller/calculator_controller.dart';
import 'package:calc/utils/helper/calc_helper.dart';
import 'package:flutter/material.dart';

class BackspaceButton extends StatelessWidget {
  const BackspaceButton({
    super.key,
    required this.provider,
    required this.controller,
  });

  final CalculatorProvider provider;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 75,
          height: 75,
          child: IconButton(
            onPressed: () {
              CalcHelperFunctions.setCursorPosition(
                CalcHelperFunctions.getNewCursorPosition(provider, controller),
                controller,
              );
            },
            icon: const Icon(
              Icons.backspace_outlined,
              color: Color(0xffF00404),
              size: 34,
            ),
          ),
        ),
      ],
    );
  }
}
