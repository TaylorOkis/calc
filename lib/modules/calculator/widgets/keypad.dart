import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/helper/calc_helper.dart';
import '../controller/calculator_controller.dart';
import 'submit_button.dart';
import 'key_button.dart';

class KeypadWidget extends StatelessWidget {
  const KeypadWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      primary: false,
      crossAxisCount: 4,
      padding: const EdgeInsets.all(2.0),
      childAspectRatio: 0.1 / 0.1,
      crossAxisSpacing: 4.0,
      mainAxisSpacing: 4.0,
      shrinkWrap: true,
      children: <Widget>[
        KeyButton(
          buttonKey: "C",
          staticKey: "C",
          textStyle: Theme.of(context).textTheme.bodySmall,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
          ),
        ),
        Consumer<CalculatorProvider>(builder: (context, provider, child) {
          String input = CalcHelperFunctions.checkBrackets(
              provider.equation, provider.cursorPosition);
          return KeyButton(
            staticKey: "()",
            buttonKey: input,
            textStyle: Theme.of(context).textTheme.bodyMedium,
          );
        }),
        KeyButton(
          staticKey: "%",
          buttonKey: "%",
          textStyle: Theme.of(context).textTheme.bodyMedium,
        ),
        KeyButton(
          staticKey: "\u00F7",
          buttonKey: "\u00F7",
          textStyle: Theme.of(context).textTheme.bodyMedium,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
          ),
        ),
        KeyButton(
          staticKey: "7",
          buttonKey: "7",
          textStyle: Theme.of(context).textTheme.bodyLarge,
        ),
        KeyButton(
          staticKey: "8",
          buttonKey: "8",
          textStyle: Theme.of(context).textTheme.bodyLarge,
        ),
        KeyButton(
          staticKey: "9",
          buttonKey: "9",
          textStyle: Theme.of(context).textTheme.bodyLarge,
        ),
        KeyButton(
          staticKey: "x",
          buttonKey: "x",
          textStyle: Theme.of(context).textTheme.bodyMedium,
        ),
        KeyButton(
          staticKey: "4",
          buttonKey: "4",
          textStyle: Theme.of(context).textTheme.bodyLarge,
        ),
        KeyButton(
          staticKey: "5",
          buttonKey: "5",
          textStyle: Theme.of(context).textTheme.bodyLarge,
        ),
        KeyButton(
          staticKey: "6",
          buttonKey: "6",
          textStyle: Theme.of(context).textTheme.bodyLarge,
        ),
        KeyButton(
          staticKey: "-",
          buttonKey: "-",
          textStyle: Theme.of(context).textTheme.bodyMedium,
        ),
        KeyButton(
          staticKey: "1",
          buttonKey: "1",
          textStyle: Theme.of(context).textTheme.bodyLarge,
        ),
        KeyButton(
          staticKey: "2",
          buttonKey: "2",
          textStyle: Theme.of(context).textTheme.bodyLarge,
        ),
        KeyButton(
          staticKey: "3",
          buttonKey: "3",
          textStyle: Theme.of(context).textTheme.bodyLarge,
        ),
        KeyButton(
          staticKey: "+",
          buttonKey: "+",
          textStyle: Theme.of(context).textTheme.bodyMedium,
        ),
        // Consumer<CalculatorProvider>(
        //   builder: (context, provider, child) {
        //     String input = CalcHelperFunctions.checkNegativeBrackets(provider);
        //     return KeyButton(
        //       staticKey: "+/-",
        //       buttonKey: input,
        //       textStyle: Theme.of(context).textTheme.bodyLarge,
        //       borderRadius: const BorderRadius.only(
        //         bottomLeft: Radius.circular(10),
        //       ),
        //     );
        //   },
        // ),
        KeyButton(
          staticKey: "+/-",
          buttonKey: "(-",
          textStyle: Theme.of(context).textTheme.bodyLarge,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
          ),
        ),
        KeyButton(
          staticKey: "0",
          buttonKey: "0",
          textStyle: Theme.of(context).textTheme.bodyLarge,
        ),
        KeyButton(
          staticKey: ".",
          buttonKey: ".",
          textStyle: Theme.of(context).textTheme.bodyLarge,
        ),
        SubmitButton(
          buttonText: "=",
          textStyle: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
