import 'package:breakfast_app/models/category_model.dart';
import 'package:breakfast_app/models/diet_model.dart';
import 'package:flutter/material.dart';
import 'package:breakfast_app/models/popular_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<CategoryModel> categories = CategoryModel.getCategories();
  List<DietModel> diets = [];
  List<PopularDietModel> popularDiets = [];

  void getInitialInfo() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
    popularDiets = PopularDietModel.getPopularDiets();
  }

  @override
  void initState() {
    super.initState();
    getInitialInfo();
  }

  @override
  Widget build(BuildContext context) {
    getInitialInfo();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: appBar(),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            searchField(),
            const SizedBox(
              height: 40,
            ),
            categoriesSection(),
            const SizedBox(
              height: 40,
            ),
            dietSection(),
            const SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Popular',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            popularDiets[index].iconPath,
                            width: 65,
                            height: 65,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                popularDiets[index].name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 16),
                              ),
                              Text(popularDiets[index].level +
                                  ' | ' +
                                  popularDiets[index].duration +
                                  ' | ' +
                                  popularDiets[index].calorie)
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              'assets/images/arrow.png',
                              width: 30,
                              height: 30,
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: popularDiets[index].boxIsSelected
                              ? Colors.white
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: popularDiets[index].boxIsSelected
                              ? [
                                  BoxShadow(
                                      color: const Color(0xff1D1617)
                                          .withOpacity(0.07),
                                      offset: const Offset(0, 10),
                                      blurRadius: 40,
                                      spreadRadius: 0)
                                ]
                              : []),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 25);
                  },
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  itemCount: popularDiets.length,
                  shrinkWrap: true,
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  Column dietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Recommendation\nfor Diet',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            )),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 240,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                  width: 210,
                  decoration: BoxDecoration(
                      color: categories[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            height: 70,
                            width: 70,
                            child: Image.asset(diets[index].iconPath)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              diets[index].name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16),
                            ),
                            Text(
                              diets[index].level +
                                  ' | ' +
                                  diets[index].duration +
                                  ' | ' +
                                  diets[index].calorie,
                              style: const TextStyle(
                                  color: Color(0xff7B6F72),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ),
                            Container(
                              height: 45,
                              width: 130,
                              child: Center(
                                child: Text(
                                  'View',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: diets[index].viewIsSelected
                                          ? Colors.white
                                          : const Color(0xffC58BF2),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    diets[index].viewIsSelected
                                        ? const Color(0xff9DCEff)
                                        : Colors.transparent,
                                    diets[index].viewIsSelected
                                        ? const Color(0xff92A3FD)
                                        : Colors.transparent
                                  ]),
                                  borderRadius: BorderRadius.circular(50)),
                            )
                          ],
                        ),
                      ]));
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 25,
              );
            },
            itemCount: diets.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
          ),
        )
      ],
    );
  }

  Column categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Category',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            )),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 120,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) {
              return const SizedBox(width: 25);
            },
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                decoration: BoxDecoration(
                    color: categories[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(categories[index].iconPath),
                      ),
                    ),
                    Text(
                      categories[index].name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 14),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Container searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 20, right: 40, left: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white70,
          contentPadding: const EdgeInsets.all(15),
          hintText: 'Search Pancake',
          hintStyle: const TextStyle(
            color: Color(0xffDDDADA),
            fontSize: 18,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          prefixIcon: const Icon(
            Icons.menu,
            color: Colors.black45,
          ),
          suffixIcon: Container(
            width: 100,
            child: const IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  VerticalDivider(
                    color: Colors.black,
                    indent: 10,
                    endIndent: 10,
                    thickness: 0.1,
                  ),
                  Icon(
                    Icons.filter_list,
                    color: Colors.black45,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'BreakFast',
        style: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white70,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Image.asset('assets/images/arrow.png'),
          decoration: BoxDecoration(
            color: const Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Image.asset('assets/images/dots.png'),
            decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
