import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController controller;
  const InputTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextFormField(
          keyboardType: TextInputType.none,
          autofocus: true,
          decoration: const InputDecoration(
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
          cursorWidth: 3.5,
          maxLines: 3,
          textAlign: TextAlign.right,
          controller: controller,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}
