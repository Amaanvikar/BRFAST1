import 'package:flutter/material.dart';

class PopularDietModel{
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool boxIsSelected;

  PopularDietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this. duration,
    required this. calorie,
    required this. boxIsSelected
});

  static List < PopularDietModel > getPopularDiets() {
    List <PopularDietModel> popularDiets = [];

    popularDiets.add(
        PopularDietModel(
          name: 'Blueberry Pancake',
          iconPath: 'assets/images/blueberry_pancake.png',
          level: 'Medium',
          duration: '30mins',
          calorie: '230KCal',
          boxIsSelected: true,
        )
    );

    popularDiets.add(
        PopularDietModel(
          name: 'Salmon Nigiri',
          iconPath: 'assets/images/salmon_nirigi.png',
          level: 'Easy',
          duration: '20mins',
          calorie: '120KCal',
          boxIsSelected: false,
        )
    );

    return popularDiets;
  }

}