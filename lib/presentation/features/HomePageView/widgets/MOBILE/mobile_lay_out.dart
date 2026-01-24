import 'package:flutter/material.dart';
import 'package:movi_app/presentation/features/HomePageView/widgets/MOBILE/trending_tab_for_mobile.dart';
import 'package:movi_app/presentation/features/HomePageView/widgets/MoviesTab.dart';
import 'package:movi_app/presentation/features/HomePageView/widgets/NewTab.dart';
import 'package:movi_app/presentation/features/HomePageView/widgets/SeriesTab.dart';
import 'package:movi_app/presentation/features/HomePageView/widgets/TvShowsTab.dart';
import 'package:movi_app/widgets/tabs_bar.dart';

class MobileLayOut extends StatelessWidget {
  const MobileLayOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: TabsBar(),
        ),
        SliverFillRemaining(
          child: TabBarView(
            children: [
              // Each tab content 👇
              TrendingTabForMobile(),
              const NewTab(),
              const MoviesTab(),
              const SeriesTab(),
              const TvShowsTab(),
            ],
          ),
        ),
      ],
    );
  }
}
