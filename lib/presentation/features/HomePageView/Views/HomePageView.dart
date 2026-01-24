import 'package:flutter/material.dart';
import 'package:movi_app/core/utils/app/styles/app_styles.dart';
import 'package:movi_app/presentation/features/HomePageView/widgets/HomePageViewBody.dart';
import 'package:movi_app/widgets/custom_scaffoldBK.dart';
import 'package:movi_app/widgets/floating_bottom_navbar.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: customScaffoldBK(),
      child: DefaultTabController(
        length: 5, // Number of tabs in TopTabs
        child: Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: LayoutBuilder(
            builder: (context, constraints) => constraints.maxWidth < 600 - 50
                ? BottomNavBar()
                : const SizedBox.shrink(),
          ), // keep gradient visible
          body: const SafeArea(
            child: HomePageViewBody(),
          ),
        ),
      ),
    );
  }
}

class DetailsMovi extends StatelessWidget {
  const DetailsMovi({
    required this.type,
    super.key,
  });

  final String type;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
      decoration: const BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      child: Text(
        type,
        style: AppStyles.styleBold13,
      ),
    );
  }
}
