import 'package:flutter/material.dart';

import '../widgets/home/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFffffff),
      body: HomeScreenBody(),
    );
  }
}
