import 'package:flutter/material.dart';
import 'package:movi_app/presentation/features/HomePageView/widgets/MoviesTab.dart';
import 'package:movi_app/presentation/features/HomePageView/widgets/NewTab.dart';
import 'package:movi_app/presentation/features/HomePageView/widgets/SeriesTab.dart';
import 'package:movi_app/presentation/features/HomePageView/widgets/TvShowsTab.dart';
import 'package:movi_app/presentation/features/HomePageView/widgets/WEB/trending_tab_for_web.dart';
import 'package:movi_app/presentation/features/HomePageView/widgets/watch_now_header.dart';
import 'package:movi_app/presentation/features/HomePageView/widgets/WEB/watch_now_moives_list_view_builder_for_web.dart';
import 'package:movi_app/widgets/custom_drawer.dart';
import 'package:movi_app/widgets/tabs_bar.dart';

class WebLayOut extends StatelessWidget {
  const WebLayOut({super.key});

  static final moviesWatchNow = [
    "assets/images/28-years-later.webp",
    "assets/images/diablo-movie.webp",
    "assets/images/screamboat.webp",
    "assets/images/wolf-man.webp",
    "assets/images/the-amateur.webp",
    "assets/images/ballerina.webp",
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ----------------- Drawer Section -----------------
        const Expanded(
          flex: 1,
          child: CustomDrawer(),
        ),
        // ----------------- Watch Now Section -----------------
        Expanded(
          flex: 1,
          child: Column(
            children: [
              const SizedBox(height: 20),
              const WatchNowHeader(),
              const Divider(),
              Expanded(
                child: WatchNowMoivesListViewBuilderForWeb(
                  moviesWatchNow: moviesWatchNow,
                ),
              ),
            ],
          ),
        ),
        // ----------------- Slider Section -----------------
        Expanded(
          flex: 6,
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: TabsBar(),
              ),
              SliverFillRemaining(
                child: TabBarView(
                  children: [
                    // Each tab content 👇
                    TrendingTabForWeb(),
                    const NewTab(),
                    const MoviesTab(),
                    const SeriesTab(),
                    const TvShowsTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
