import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_onboarding/screens/onboard/onboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Onboard(),
      theme: ThemeData(primaryColor: const Color(0xFF4A00E0)),
    );
  }
}
