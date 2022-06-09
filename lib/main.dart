import 'package:courier_page/constant.dart';
import 'package:courier_page/discovery_page.dart';
import 'package:courier_page/filters_page.dart';
import 'package:courier_page/menu_page.dart';
import 'package:courier_page/order_page.dart';
import 'package:courier_page/restaurant_page.dart';
import 'package:courier_page/restaurants_page.dart';
import 'package:flutter/material.dart';

import 'couirer_page.dart';
import 'product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _pageList = const [
    CourierPage(),
    ProductPage(),
    DiscoveryPage(),
    FiltersPage(),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: _pageList[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.pages),
                label: 'I',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.pages),
                label: 'II',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.pages),
                label: 'III',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.pages),
                label: 'IV',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: kOrderPageTextColor,
            unselectedItemColor: kOrderPageButtonColor,
            unselectedLabelStyle: const TextStyle(color: kOrderPageButtonColor),
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
