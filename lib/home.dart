import 'dart:ui';

import 'package:api/tvadswithphp//beverage.dart';
import 'package:api/tvadswithphp/maincourse.dart';
import 'package:api/tvadswithphp/softdrink.dart';
import 'package:api/tvadswithphp/tea.dart';
import 'package:flutter/material.dart';

import 'crud/usable.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: test.length, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  List jan = [
    "${promotion[0]} 30 % Discount",
    "${promotion[1]}  20 % Discount ",
    "${promotion[2]} 10 % Discount",
    '${promotion[3]} 40 % Discount'
  ];
  List<Tab> test = [
    Tab(child: cont('Main Course')),
    Tab(
      child: cont('Tea & Coffee'),
    ),
    Tab(
      child: cont('Soft Drink'),
    ),
    Tab(
      child: cont('Beverage'),
    ),
  ];



  List<Widget> vew = [const maincourse(), tea(), const softdrk(), const bev()];
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: test.length,
            child: Scaffold(
              drawer: d(),
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                titleTextStyle:
                const TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
                centerTitle: true,
                title: Text(
                  "${jan[controller.index]}",
                  style: const TextStyle(color: Colors.lightBlue),
                ),

                backgroundColor: Colors.white,
                elevation: 0,
                bottom: TabBar(
                  controller: controller,
                  // onTap: (int index) {
                  //   print(vew[index]);
                  //   //tp(index);
                  // },
                  //isScrollable: true,
                  unselectedLabelColor: Colors.redAccent,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.redAccent),
                  tabs: test,
                ),
              ),
              body: TabBarView(controller: controller, children: vew),
            )));
  }
}
