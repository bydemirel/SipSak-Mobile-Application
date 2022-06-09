import 'package:courier_page/order_page.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  var starterPathList = [
    "assets/images/Starters/MeatBörek.jpg",
    "assets/images/Starters/CheeseBörek.jpg",
    "assets/images/Starters/WalnutSalad.jpg",
    "assets/images/Starters/StuffedMeatball.jpg",
  ];

  var startersDishNames = [
    "Kıymalı Börek",
    "Peynirli Börek",
    "Cevizli Marul Salatası",
    "İçli Köfte",
  ];

  var pastaPathList = [
    "assets/images/Pastas/PennePastaPesto.jpg",
    "assets/images/Pastas/PennePastaTomato.jpg",
    "assets/images/Pastas/Spaghetti.jpg",
    "assets/images/Pastas/SpaghettiShrimp.jpg",
  ];

  var pastaDishNames = [
    "Penne Makarna",
    "Domatesli Makarna",
    "Spagetti",
    "Karidesli Spagetti",
  ];

  var appetizerPathList = [
    "assets/images/Appetizer/ItalianBruschetta.jpg",
    "assets/images/Appetizer/CheesePlate.jpg",
    "assets/images/Appetizer/GreekSalad.jpg",
    "assets/images/Appetizer/FrenchFries.jpg",
  ];

  var appetizerDishNames = [
    "İtalyan Bruschetta",
    "Peynir Tabağı",
    "Yunan Salatası",
    "Kızarmış Patates",
  ];

  var mainDishPathList = [
    "assets/images/MainDish/Kimchi.jpg",
    "assets/images/MainDish/GrilledBeef.jpg",
    "assets/images/MainDish/ZucchiniFlowers.jpg",
    "assets/images/MainDish/SweetChicken.jpg",
  ];

  var mainDishDishNames = [
    "Kimchi",
    "Dana Eti",
    "Kabak Çiçeği",
    "Biberli Tavuk",
  ];

  var dessertPathList = [
    "assets/images/Dessert/Baklava.jpg",
    "assets/images/Dessert/Lokum.jpg",
    "assets/images/Dessert/CarrotBaklava.jpg",
    "assets/images/Dessert/Cezerye.jpg",
  ];

  var dessertDishNames = [
    "Baklava",
    "Lokum",
    "Havuç Dilimi",
    "Cezerye",
  ];

  var coldDrinkPathList = [
    "assets/images/ColdDrinks/IceLatte.jpg",
    "assets/images/ColdDrinks/Mojito.jpg",
    "assets/images/ColdDrinks/MintIceTea.jpg",
    "assets/images/ColdDrinks/Lemonade.jpg",
  ];

  var coldDrinkDishNames = [
    "Ice Latte",
    "Mojito",
    "Naneli Soğuk Çay",
    "Limonata",
  ];

  var hotDrinkPathList = [
    "assets/images/HotDrinks/Cappuccino.jpg",
    "assets/images/HotDrinks/Espresso.jpg",
    "assets/images/HotDrinks/Tea.jpg",
    "assets/images/HotDrinks/HotChocolate.jpg",
  ];

  var hotDrinkDishNames = [
    "Cappuccino",
    "Espresso",
    "Çay",
    "Sıcak Çikolata",
  ];

  var dishCategoryList = [
    "Başlangıçlar",
    "Makarnalar",
    "Aperatifler",
    "Ana Yemekler",
    "Tatlılar",
    "Soğuk İçecekler",
    "Sıcak İçecekler",
  ];

  getPage(int currentTab, int index) {
    if (currentTab == 0) {
      return StartersMenuRow(
        imagePath: starterPathList[index],
        dishName: startersDishNames[index],
      );
    } else if (currentTab == 1) {
      return PastasMenuRow(
        imagePath: pastaPathList[index],
        dishName: pastaDishNames[index],
      );
    } else if (currentTab == 2) {
      return AppetizersMenuRow(
        imagePath: appetizerPathList[index],
        dishName: appetizerDishNames[index],
      );
    } else if (currentTab == 3) {
      return MainDishesMenuRow(
        imagePath: mainDishPathList[index],
        dishName: mainDishDishNames[index],
      );
    } else if (currentTab == 4) {
      return DessertsMenuRow(
        imagePath: dessertPathList[index],
        dishName: dessertDishNames[index],
      );
    } else if (currentTab == 5) {
      return ColdDrinksMenuRow(
        imagePath: coldDrinkPathList[index],
        dishName: coldDrinkDishNames[index],
      );
    } else if (currentTab == 6) {
      return HotDrinksMenuRow(
        imagePath: hotDrinkPathList[index],
        dishName: hotDrinkDishNames[index],
      );
    }
  }

  var _currentTabIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Align(
                    alignment: Alignment.center,
                    child: IconButton(
                      splashRadius: 20,
                      alignment: Alignment.bottomLeft,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: kOrderPageTextColor,
                        size: 28,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Menü",
                    style: TextStyle(
                        color: kOrderPageTextColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 62,
              width: double.infinity,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  for (var i = 0; i < 7; i++) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      child: GestureDetector(
                        child: Container(
                          width: 104,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              dishCategoryList[i],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: i == _currentTabIndex
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: i == _currentTabIndex
                                    ? FontWeight.w500
                                    : FontWeight.w300,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: i == _currentTabIndex
                                ? kOrderPageButtonColor
                                : Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _currentTabIndex = i;
                          });
                        },
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior: const ScrollBehavior().copyWith(
                  overscroll: false,
                ),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (var i = 0; i < 4; i++) ...[
                      getPage(_currentTabIndex, i),
                      const SizedBox(
                        height: 3,
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                        indent: 0,
                        endIndent: 0,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                    ],
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child: FlatButton(
                minWidth: double.infinity,
                height: 50,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OrderPage()),
                  );
                },
                child: const Text(
                  "Ödemeye Geç",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                color: kOrderPageButtonColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StartersMenuRow extends StatelessWidget {
  final String? imagePath;
  final String? dishName;

  const StartersMenuRow({
    Key? key,
    this.imagePath,
    this.dishName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 83,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath!,
              height: 85,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dishName!,
                    style: const TextStyle(
                        fontSize: 18,
                        color: kOrderPageTextColor,
                        fontWeight: FontWeight.w300),
                  ),
                  const Text(
                    "Lorem ipsum dolor sit",
                    style: TextStyle(
                        fontSize: 16,
                        color: kOrderPageTextColor,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              const Text(
                "₺ 14.90",
                style: TextStyle(
                    fontSize: 18,
                    color: kOrderPageTextColor,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              child: Container(
                width: 35,
                height: 35,
                child: const Center(
                  child: Icon(
                    Icons.add,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
                decoration: const BoxDecoration(
                  color: kOrderPageButtonColor,
                  shape: BoxShape.circle,
                ),
              ),
              onTap: () {
                print("Add Button Clicked...");
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PastasMenuRow extends StatelessWidget {
  final String? imagePath;
  final String? dishName;

  const PastasMenuRow({
    Key? key,
    this.imagePath,
    this.dishName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 83,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath!,
              height: 85,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dishName!,
                    style: const TextStyle(
                        fontSize: 18,
                        color: kOrderPageTextColor,
                        fontWeight: FontWeight.w300),
                  ),
                  const Text(
                    "Lorem ipsum dolor sit",
                    style: TextStyle(
                        fontSize: 16,
                        color: kOrderPageTextColor,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              const Text(
                "₺ 14.90",
                style: TextStyle(
                    fontSize: 18,
                    color: kOrderPageTextColor,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              child: Container(
                width: 35,
                height: 35,
                child: const Center(
                  child: Icon(
                    Icons.add,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
                decoration: const BoxDecoration(
                  color: kOrderPageButtonColor,
                  shape: BoxShape.circle,
                ),
              ),
              onTap: () {
                print("Add Button Clicked...");
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AppetizersMenuRow extends StatelessWidget {
  final String? imagePath;
  final String? dishName;

  const AppetizersMenuRow({
    Key? key,
    this.imagePath,
    this.dishName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 83,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath!,
              height: 85,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dishName!,
                    style: const TextStyle(
                        fontSize: 18,
                        color: kOrderPageTextColor,
                        fontWeight: FontWeight.w300),
                  ),
                  const Text(
                    "Lorem ipsum dolor sit",
                    style: TextStyle(
                        fontSize: 16,
                        color: kOrderPageTextColor,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              const Text(
                "₺ 14.90",
                style: TextStyle(
                    fontSize: 18,
                    color: kOrderPageTextColor,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              child: Container(
                width: 35,
                height: 35,
                child: const Center(
                  child: Icon(
                    Icons.add,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
                decoration: const BoxDecoration(
                  color: kOrderPageButtonColor,
                  shape: BoxShape.circle,
                ),
              ),
              onTap: () {
                print("Add Button Clicked...");
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MainDishesMenuRow extends StatelessWidget {
  final String? imagePath;
  final String? dishName;

  const MainDishesMenuRow({
    Key? key,
    this.imagePath,
    this.dishName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 83,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath!,
              height: 85,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dishName!,
                    style: const TextStyle(
                        fontSize: 18,
                        color: kOrderPageTextColor,
                        fontWeight: FontWeight.w300),
                  ),
                  const Text(
                    "Lorem ipsum dolor sit",
                    style: TextStyle(
                        fontSize: 16,
                        color: kOrderPageTextColor,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              const Text(
                "₺ 14.90",
                style: TextStyle(
                    fontSize: 18,
                    color: kOrderPageTextColor,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              child: Container(
                width: 35,
                height: 35,
                child: const Center(
                  child: Icon(
                    Icons.add,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
                decoration: const BoxDecoration(
                  color: kOrderPageButtonColor,
                  shape: BoxShape.circle,
                ),
              ),
              onTap: () {
                print("Add Button Clicked...");
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DessertsMenuRow extends StatelessWidget {
  final String? imagePath;
  final String? dishName;

  const DessertsMenuRow({
    Key? key,
    this.imagePath,
    this.dishName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 83,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath!,
              height: 85,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dishName!,
                    style: const TextStyle(
                        fontSize: 18,
                        color: kOrderPageTextColor,
                        fontWeight: FontWeight.w300),
                  ),
                  const Text(
                    "Lorem ipsum dolor sit",
                    style: TextStyle(
                        fontSize: 16,
                        color: kOrderPageTextColor,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              const Text(
                "₺ 14.90",
                style: TextStyle(
                    fontSize: 18,
                    color: kOrderPageTextColor,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              child: Container(
                width: 35,
                height: 35,
                child: const Center(
                  child: Icon(
                    Icons.add,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
                decoration: const BoxDecoration(
                  color: kOrderPageButtonColor,
                  shape: BoxShape.circle,
                ),
              ),
              onTap: () {
                print("Add Button Clicked...");
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ColdDrinksMenuRow extends StatelessWidget {
  final String? imagePath;
  final String? dishName;

  const ColdDrinksMenuRow({
    Key? key,
    this.imagePath,
    this.dishName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 83,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath!,
              height: 85,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dishName!,
                    style: const TextStyle(
                        fontSize: 18,
                        color: kOrderPageTextColor,
                        fontWeight: FontWeight.w300),
                  ),
                  const Text(
                    "Lorem ipsum dolor sit",
                    style: TextStyle(
                        fontSize: 16,
                        color: kOrderPageTextColor,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              const Text(
                "₺ 14.90",
                style: TextStyle(
                    fontSize: 18,
                    color: kOrderPageTextColor,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              child: Container(
                width: 35,
                height: 35,
                child: const Center(
                  child: Icon(
                    Icons.add,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
                decoration: const BoxDecoration(
                  color: kOrderPageButtonColor,
                  shape: BoxShape.circle,
                ),
              ),
              onTap: () {
                print("Add Button Clicked...");
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HotDrinksMenuRow extends StatelessWidget {
  final String? imagePath;
  final String? dishName;

  const HotDrinksMenuRow({
    Key? key,
    this.imagePath,
    this.dishName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 83,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath!,
              height: 85,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dishName!,
                    style: const TextStyle(
                        fontSize: 18,
                        color: kOrderPageTextColor,
                        fontWeight: FontWeight.w300),
                  ),
                  const Text(
                    "Lorem ipsum dolor sit",
                    style: TextStyle(
                        fontSize: 16,
                        color: kOrderPageTextColor,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              const Text(
                "₺ 14.90",
                style: TextStyle(
                    fontSize: 18,
                    color: kOrderPageTextColor,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              child: Container(
                width: 35,
                height: 35,
                child: const Center(
                  child: Icon(
                    Icons.add,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
                decoration: const BoxDecoration(
                  color: kOrderPageButtonColor,
                  shape: BoxShape.circle,
                ),
              ),
              onTap: () {
                print("Add Button Clicked...");
              },
            ),
          ),
        ],
      ),
    );
  }
}
