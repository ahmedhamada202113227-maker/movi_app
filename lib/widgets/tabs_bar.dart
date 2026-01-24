import 'package:flutter/material.dart';
import 'package:movi_app/core/utils/app/colors/app_colors.dart';
import 'package:movi_app/core/utils/app/styles/app_styles.dart';

class TabsBar extends StatelessWidget {
  const TabsBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TabBar(
            // isScrollable: true,
            indicatorColor: AppColors.indicatorColor,
            labelColor: AppColors.labelColor,
            labelStyle: AppStyles.styleBold16,
            labelPadding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.01,
            ),
            unselectedLabelColor: AppColors.unselectedLabelColor,
            unselectedLabelStyle: AppStyles.styleRegular16,
            dividerColor: Colors.transparent,
            tabs: const [
              Tab(text: "Trending"),
              Tab(text: "New"),
              Tab(text: "Movies"),
              Tab(text: "Series"),
              Tab(text: "TV shows"),
            ],
          ),
        ),
      ],
    );
  }
}
















// class MobileLayOut extends StatelessWidget {
//   const MobileLayOut({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const SizedBox(height: 10),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//           child: TabBar(
//             // isScrollable: true,
//             indicatorColor: AppColors.indicatorColor,
//             labelColor: AppColors.labelColor,
//             labelStyle: AppStyles.styleBold16,
//             labelPadding: EdgeInsets.symmetric(
//               horizontal: MediaQuery.of(context).size.width * 0.01,
//             ),
//             unselectedLabelColor: AppColors.unselectedLabelColor,
//             unselectedLabelStyle: AppStyles.styleRegular16,
//             dividerColor: Colors.transparent,
//             tabs: const [
//               Tab(text: "Trending"),
//               Tab(text: "New"),
//               Tab(text: "Movies"),
//               Tab(text: "Series"),
//               Tab(text: "TV shows"),
//             ],
//           ),
//         ),
//         Expanded(
//           child: TabBarView(
//             children: [
//               // Each tab content 👇
//               TrendingTab(),
//               const NewTab(),
//               const MoviesTab(),
//               const SeriesTab(),
//               const TvShowsTab(),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

