import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/calculator_controller.dart';
import '../widgets/backspace_button.dart';
import '../widgets/keypad.dart';
import '../widgets/input_textfield.dart';
import '../widgets/responsive.dart';
import '../widgets/result_field.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final calculatorProvider =
        Provider.of<CalculatorProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ScreenLayoutResponse(
            portrait: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Consumer<CalculatorProvider>(
                  builder: (context, provider, child) {
                    // CalcHelperFunctions.updateControllerValue(
                    //     provider.equation, provider.textController);
                    return InputTextField(controller: provider.textController);
                  },
                ),
                Consumer<CalculatorProvider>(
                    builder: (context, provider, child) {
                  return ResultField(result: provider.result);
                }),
                Consumer<CalculatorProvider>(
                  builder: (context, provider, child) {
                    return BackspaceButton(
                      provider: calculatorProvider,
                      controller: provider.textController,
                    );
                  },
                ),
                const KeypadWidget(),
              ],
            ),
            landscape: const Row(),
          ),
        ),
      ),
    );
  }
}
