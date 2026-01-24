import 'package:flutter/material.dart';

class TvShowsTab extends StatelessWidget {
  const TvShowsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("TV Shows Content", style: TextStyle(color: Colors.white)),
    );
  }
}



// ignore: non_constant_identifier_names
// Widget TopTabs() {
//   final tabs = ["Trending", "New", "Movies", "Series", "TV shows"];
//   return SizedBox(
//     height: 50,
//     child: ListView.separated(
//       scrollDirection: Axis.horizontal,
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       itemCount: tabs.length,
//       separatorBuilder: (_, __) => const SizedBox(width: 25),
//       itemBuilder: (context, index) {
//         return Text(
//           tabs[index],
//           style: TextStyle(
//             color: index == 0 ? const Color(0xff42FF73) : Colors.grey,
//             fontSize: 16,
//             fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
//           ),
//         );
//       },
//     ),
//   );
// }

// ignore: non_constant_identifier_names
// Widget BottomNavBar() {
//   return BottomNavigationBar(
//     backgroundColor: Colors.grey[300],
//     type: BottomNavigationBarType.fixed,
//     selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
//     unselectedItemColor: Color.fromARGB(255, 17, 229, 67),

//     items: const [
//       BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
//       BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
//       BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ""),
//       BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ""),
//     ],
//   );
// }
