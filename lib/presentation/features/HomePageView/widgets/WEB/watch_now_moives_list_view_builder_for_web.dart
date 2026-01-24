import 'package:flutter/material.dart';

class WatchNowMoivesListViewBuilderForWeb extends StatelessWidget {
  const WatchNowMoivesListViewBuilderForWeb({
    super.key,
    required this.moviesWatchNow,
  });

  final List<String> moviesWatchNow;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: moviesWatchNow.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 2.0),
          child: FittedBox(
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
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      moviesWatchNow[index],
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    top: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 2.0),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4.0)),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.play_circle,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      // shrinkWrap: true,
    );
  }
}
