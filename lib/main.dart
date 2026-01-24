import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:movi_app/presentation/features/SearchPageView/views/SearchPageView.dart';
import 'package:movi_app/presentation/features/SplashPageView/views/SplashPageView.dart';

void main() {
  runApp(
    DevicePreview(
        isToolbarVisible: false,
        enabled: !false,
        builder: (context) => const Movi_App(),
      ),
    );
}

// ignore: camel_case_types
class Movi_App extends StatelessWidget {
  const Movi_App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FilterPageView(),
    );
  }
}
