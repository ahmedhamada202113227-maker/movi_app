import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movi_app/core/utils/app/styles/app_styles.dart';
import 'package:movi_app/presentation/features/HomePageView/widgets/MOBILE/watch_now_movies_list_view_builder_for_mobile.dart';
import 'package:movi_app/widgets/featured_movies_carousel_slider.dart';

class TrendingTabForWeb extends StatelessWidget {
  TrendingTabForWeb({super.key});
  final moviesWatchNow = [
    "assets/images/28-years-later.webp",
    "assets/images/diablo-movie.webp",
    "assets/images/screamboat.webp",
    "assets/images/wolf-man.webp",
    "assets/images/the-amateur.webp",
    "assets/images/ballerina.webp",
    'assets/images/freakier-friday.webp',
    'assets/images/kayara-ukrainian.webp',
    'assets/images/heart-eyes.webp',
    'assets/images/the-legend-of-ochi.webp',
    'assets/images/toxic-indian.webp',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        // ----------------- Slider Section -----------------
        Expanded(
          flex: 5,
          child: FeaturedMoviesCarouselSliderForWeb(context),
        ),
        const SizedBox(height: 8),
        // ----------------- Header Section -----------------
        const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: HeaderSection(),
        ),
        // ----------------- Divider Section -----------------
        const Divider(),
        // ----------------- Movies List Section -----------------
        Expanded(
          flex: 2,
          child: WatchNowMoviesListViewBuilderForMobile(
            moviesWatchNow: moviesWatchNow,
          ),
        ),
        const SizedBox(height: 12),
        // ----------------- Header2 Section -----------------
        const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: HeaderSection(),
        ),
        // ----------------- Divider Section -----------------
        const Divider(),
        // ----------------- Movies List2 Section -----------------

        Expanded(
          flex: 2,
          child: WatchNowMoviesListViewBuilderForMobile(
            moviesWatchNow: moviesWatchNow,
          ),
        ),
      ],
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Trending Now', style: AppStyles.styleExtraBold24),
        TextButton(
          onPressed: () {},
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.ellipsisVertical,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
