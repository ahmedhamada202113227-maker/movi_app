import 'package:flutter/material.dart';

Widget BottomNavBar() {
  return Container(
    margin: const EdgeInsets.all(20.0),
    height: 65,
    decoration: BoxDecoration(
        color: Colors.grey[800]?.withOpacity(0.4),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 31, 31, 81),
            blurRadius: 10,
            offset: Offset(0, -1),
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(100))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.favorite_border, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.person_outline, color: Colors.white),
          onPressed: () {},
        ),
      ],
    ),
  );
}




