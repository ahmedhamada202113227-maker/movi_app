import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movi_app/presentation/features/HomePageView/Views/HomePageView.dart';

class CarouselSliderWidgetForWeb extends StatelessWidget {
  const CarouselSliderWidgetForWeb({
    super.key,
    required this.movies,
  });

  final List<String> movies;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.elasticIn,
        scrollDirection: Axis.horizontal,
        viewportFraction: 0.3,
        initialPage: 0,
        pauseAutoPlayOnTouch: true,
        pageSnapping: true,
        disableCenter: false,
        clipBehavior: Clip.hardEdge,
        scrollPhysics: const BouncingScrollPhysics(),
      ),
      items: movies.map((movie) {
        return Expanded(
          child: Column(
            children: [
              Expanded(
                flex: 10,
                child: AspectRatio(
                  aspectRatio: 0.85,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      movie,
                      fit: BoxFit.fill,
                      width: 300,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const DetailsMovi(type: '2022'),
              const Expanded(
                child: Text(
                  'Superman',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Expanded(
                child: FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DetailsMovi(type: 'Fantasy'),
                      SizedBox(width: 4),
                      DetailsMovi(type: '1h 45m'),
                      SizedBox(width: 4),
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      SizedBox(width: 2),
                      Text(
                        '4.5',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
