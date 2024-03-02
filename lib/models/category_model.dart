import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

   static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(
        name: 'Desert',
        iconPath: 'assets/images/pancake.png',
        boxColor: Color(0xff92A3FD)));

    categories.add(CategoryModel(
        name: 'Juice',
        iconPath: 'assets/images/orange.png',
        boxColor: Color(0xffC58Bf2)));

    categories.add(CategoryModel(
        name: 'Pie',
        iconPath: 'assets/images/pie.png',
        boxColor: Color(0xff92A3FD)));

    categories.add(CategoryModel(
        name: 'Salad',
        iconPath: 'assets/images/dish.png',
        boxColor: Color(0xffC58Bf2)));

    return categories;
  }
}
