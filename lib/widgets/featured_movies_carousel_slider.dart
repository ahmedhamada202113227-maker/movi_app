import 'package:flutter/material.dart';
import 'package:movi_app/presentation/features/HomePageView/widgets/MOBILE/carousel_slider_widget.dart';
import 'package:movi_app/presentation/features/HomePageView/widgets/WEB/carousel_slider_widget_for_web.dart';

// ignore: non_constant_identifier_names
Widget FeaturedMoviesCarouselSlider(BuildContext context) {
  final movies = [
    "assets/images/kpop-demon-hunters.webp",
    "assets/images/superman.webp",
    "assets/images/ballerina.webp",
    "assets/images/m3gan.webp",
  ];

  return CarouselSliderWidgetForMobile(movies: movies);
}

// ignore: non_constant_identifier_names
Widget FeaturedMoviesCarouselSliderForWeb(BuildContext context) {
  final movies = [
    "assets/images/kpop-demon-hunters.webp",
    "assets/images/superman.webp",
    "assets/images/ballerina.webp",
    "assets/images/m3gan.webp",
  ];

  return CarouselSliderWidgetForWeb(movies: movies);
}
