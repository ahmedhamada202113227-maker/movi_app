import 'package:flutter/material.dart';
import 'package:movi_app/presentation/features/HomePageView/widgets/watch_now_header.dart';
import 'package:movi_app/presentation/features/HomePageView/widgets/MOBILE/watch_now_movies_list_view_builder_for_mobile.dart';
import 'package:movi_app/widgets/featured_movies_carousel_slider.dart';

class TrendingTabForMobile extends StatelessWidget {
  TrendingTabForMobile({super.key});
  final moviesWatchNow = [
    "assets/images/28-years-later.webp",
    "assets/images/diablo-movie.webp",
    "assets/images/screamboat.webp",
    "assets/images/wolf-man.webp",
    "assets/images/the-amateur.webp",
    "assets/images/ballerina.webp",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        // ----------------- Slider Section -----------------
        FeaturedMoviesCarouselSlider(context),
        const SizedBox(height: 8),
        // ----------------- Watch Now Header Section -----------------
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: WatchNowHeader(),
        ),
        const Divider(),
        // ----------------- Watch Now Movies Section -----------------
        Expanded(
          child: WatchNowMoviesListViewBuilderForMobile(
            moviesWatchNow: moviesWatchNow,
          ),
        ),
      ],
    );
  }
}
