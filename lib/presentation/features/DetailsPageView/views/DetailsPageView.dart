import 'package:flutter/material.dart';
import 'package:movi_app/core/utils/app/styles/app_styles.dart';

class DetailsPageView extends StatelessWidget {
  const DetailsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/ballerina.webp'),
          fit: BoxFit.cover,
          opacity: 0.8,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.share, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.9),
                    Colors.black,
                  ],
                  stops: const [0.2, 0.88, 1.0],
                ),
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Ballerina',
                    style: AppStyles.styleExtraBold27,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '2023',
                        style: AppStyles.styleRegular13
                            .copyWith(color: Colors.white70),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '|',
                        style: AppStyles.styleRegular13
                            .copyWith(color: Colors.white70),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.star, color: Colors.amber, size: 12),
                      Text(
                        '8.5',
                        style: AppStyles.styleRegular13
                            .copyWith(color: Colors.white70),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '|',
                        style: AppStyles.styleRegular13
                            .copyWith(color: Colors.white70),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Family',
                        style: AppStyles.styleRegular13
                            .copyWith(color: Colors.white70),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '|',
                        style: AppStyles.styleRegular13
                            .copyWith(color: Colors.white70),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '43Minutes',
                        style: AppStyles.styleRegular13
                            .copyWith(color: Colors.white70),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'In a world where dreams take flight, a young ballerina embarks on a journey of passion, perseverance, and self-discovery. Amidst the challenges of life and the pursuit of excellence, she learns that true artistry comes from within.',
                          style: AppStyles.styleRegular16
                              .copyWith(color: Colors.white70),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.play_arrow,
                              color: Colors.white, size: 28),
                          const SizedBox(width: 8),
                          Text(
                            'Play Now',
                            style: AppStyles.styleBold20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  DefaultTabController(
                    length: 4,
                    child: Column(
                      children: [
                        TabBar(
                          isScrollable: false,
                          indicatorColor: Colors.green,
                          labelColor: Colors.white,
                          labelStyle: AppStyles.styleBold16,
                          unselectedLabelColor: Colors.white70,
                          unselectedLabelStyle: AppStyles.styleRegular16,
                          dividerColor: Colors.transparent,
                          tabs: const [
                            Tab(text: 'Episodes'),
                            Tab(text: 'Cast'),
                            Tab(text: 'More Like This'),
                            Tab(text: 'Details'),
                          ],
                        ),
                        const SizedBox(height: 50),
                        SizedBox(
                          height: 200,
                          child: TabBarView(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  // color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(66, 255, 0, 0),
                                      blurRadius: 8,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        'assets/images/ballerina.webp',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Episode 1',
                                          style: AppStyles.styleBold20
                                              .copyWith(color: Colors.white),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          'The Beginning',
                                          style: AppStyles.styleRegular16
                                              .copyWith(color: Colors.white70),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          'Duration: 43 Minutes',
                                          style: AppStyles.styleRegular13
                                              .copyWith(color: Colors.white70),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                  child: Text('Trailers & More',
                                      style: AppStyles.styleBold24
                                          .copyWith(color: Colors.white))),
                              Center(
                                  child: Text('More Like This',
                                      style: AppStyles.styleBold24
                                          .copyWith(color: Colors.white))),
                              Center(
                                  child: Text('Details',
                                      style: AppStyles.styleBold24
                                          .copyWith(color: Colors.white))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
