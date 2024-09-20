import 'package:flutter/material.dart';

class ResultField extends StatelessWidget {
  const ResultField({
    super.key,
    this.result = '',
  });

  final String result;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 50,
            child: Text(
              "=",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          Text(
            result,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
