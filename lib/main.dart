import 'package:calc/core/theme/theme.dart';
import 'package:calc/modules/calculator/controller/calculator_controller.dart';
import 'package:calc/modules/calculator/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CalculatorProvider>(
      create: (_) => CalculatorProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: Apptheme().lightMode(),
        darkTheme: Apptheme().darkMode(),
        themeMode: ThemeMode.system,
        home: const MainPage(),
      ),
    );
  }
}
