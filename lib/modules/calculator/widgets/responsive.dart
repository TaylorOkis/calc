import 'package:flutter/material.dart';

class ScreenLayoutResponse extends StatelessWidget {
  final Widget portrait;
  final Widget landscape;
  const ScreenLayoutResponse({
    super.key,
    required this.portrait,
    required this.landscape,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 768) {
          return portrait;
        } else {
          return landscape;
        }
      },
    );
  }
}
