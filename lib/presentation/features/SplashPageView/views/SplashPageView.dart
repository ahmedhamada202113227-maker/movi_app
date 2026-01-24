import 'package:flutter/material.dart';
import 'package:movi_app/presentation/features/HomePageView/Views/HomePageView.dart';
import 'package:movi_app/presentation/features/SplashPageView/widget/SplashPageViewBody.dart';

class SplashPageView extends StatefulWidget {
  const SplashPageView({super.key});

  @override
  State<SplashPageView> createState() => _SplashPageViewState();
}

class _SplashPageViewState extends State<SplashPageView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      // Navigate to the next screen after the delay
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) => const HomePageView(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SplashPageViewBody();
  }
}
