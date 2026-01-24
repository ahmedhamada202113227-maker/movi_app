import 'package:flutter/material.dart';
import 'package:movi_app/presentation/features/HomePageView/widgets/MOBILE/mobile_lay_out.dart';
import 'package:movi_app/presentation/features/HomePageView/widgets/WEB/web_lay_out.dart';

class HomePageViewBody extends StatelessWidget {
  const HomePageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 550) {
        print('Current width: ${constraints.maxWidth}');
        return const MobileLayOut();
      } else {
        return const WebLayOut();
      }
    });
  }
}
