import 'package:flutter/material.dart';

class DietModel{
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool viewIsSelected;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this. duration,
    required this. calorie,
    required this. viewIsSelected
 });

   static List <DietModel> getDiets(){
    List <DietModel> diets =[];

    diets.add(
        DietModel(
            name: 'Honey Pancake',
            iconPath: 'assets/images/pancake.png',
            level: 'Easy',
            duration: '30mins',
            calorie: '180KCal',
            viewIsSelected: true
        )
    );

    diets.add(
        DietModel(
            name: 'canai Bread',
            iconPath: 'assets/images/pie.png',
            level: 'Easy',
            duration: '20mins',
            calorie: '230KCal',
            viewIsSelected: false
        )
    );

    return diets;

  }
}