import 'package:flutter/material.dart';

BoxDecoration customScaffoldBK() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 10, 10, 26), // dark blue/purple tone
          Color.fromARGB(255, 31, 31, 81), // slightly lighter shade
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ),
    );
  }
