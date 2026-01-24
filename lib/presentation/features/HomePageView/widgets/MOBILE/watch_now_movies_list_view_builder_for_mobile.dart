import 'package:flutter/material.dart';

class WatchNowMoviesListViewBuilderForMobile extends StatelessWidget {
  const WatchNowMoviesListViewBuilderForMobile({
    super.key,
    required this.moviesWatchNow,
  });

  final List<String> moviesWatchNow;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: moviesWatchNow.length,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 2.0),
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 0.8,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 31, 31, 81),
                        blurRadius: 5,
                        spreadRadius: BorderSide.strokeAlignOutside,
                        offset: Offset(4, -3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: AspectRatio(
                      aspectRatio: 0.8,
                      child: Image.asset(
                        moviesWatchNow[index],
                        fit: BoxFit.fill,
                        width: 300,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      // shrinkWrap: true,
    );
  }
}
