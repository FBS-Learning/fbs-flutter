import 'package:fbs_flutter/main/main_layout.dart';
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
      navigateScreen: const MainLayout(),
    ),
  ];
}
