import 'package:fbs_flutter/main/fitness_app_home_screen.dart';
import 'package:flutter/widgets.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
  });

  Widget? navigateScreen;
  String imagePath;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/fitness_app/main.png',
      navigateScreen: FitnessAppHomeScreen(),
    ),
  ];
}
