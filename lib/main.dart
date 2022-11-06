import 'package:cell_management/constants/colors.dart';
import 'package:cell_management/view/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cell Management',
      theme: ThemeData(
        primarySwatch: AppColors.primaryColor,
      ),
      home: const SplashScreen(),
    );
  }
}
