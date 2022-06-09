import 'package:courier_page/restaurant_page.dart';
import 'package:courier_page/restaurants_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'constant.dart';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({Key? key}) : super(key: key);

  @override
  State<DiscoveryPage> createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  var svgPathList = [
    "assets/svgs/Breakfast.svg",
    "assets/svgs/Salad.svg",
    "assets/svgs/Pasta.svg",
    "assets/svgs/Burger.svg",
    "assets/svgs/Dessert.svg",
    "assets/svgs/Drink.svg",
    "assets/svgs/Vegan.svg",
    "assets/svgs/Sushi.svg",
  ];

  var titleList = [
    "Kahvaltılık",
    "Salata",
    "Makarna",
    "Burger",
    "Tatlılar",
    "İçecekler",
    "Vegan",
    "Asya",
  ];

  var isDeliveryFreeList = [
    false,
    true,
    true,
    false,
  ];

  var restaurantTitleList = [
    "Big Chefs",
    "Red Dragon",
    "Midpoint",
    "Çorbacı İsmet Usta",
  ];

  var rateList = [
    "4.5",
    "4.7",
    "4.6",
    "4.8",
  ];

  var imagePathList = [
    "assets/images/Döner.jpg",
    "assets/images/Hawaiian.jpg",
    "assets/images/TurkishBreakfast.jpg",
    "assets/images/Soup.jpg",
  ];

  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'En iyi Restaurantlar',
                style: TextStyle(
                  color: kOrderPageTextColor,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.search,
                    color: kOrderPageTextColor,
                  ),
                ),
                Expanded(
                  child: TextField(
                    cursorColor: kOrderPageTextColor,
                    decoration: InputDecoration(
                      hintText: 'Restaurant Ara',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.menu,
                    color: kOrderPageTextColor,
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Kategoriler",
                  style: TextStyle(
                    color: kOrderPageTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: const [
                    Text(
                      "Hepsini Göster",
                      style: TextStyle(
                        color: kOrderPageTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: kOrderPageButtonColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView(
              addAutomaticKeepAlives: false,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                for (var i = 0; i < titleList.length; i++) ...[
                  GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          currentIndex = i;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RestaurantsPage()),
                          );
                        },
                      );
                    },
                    child: CategoryListElement(
                      title: titleList[i],
                      svgPath: svgPathList[i],
                      currentIndex: currentIndex,
                      index: i,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 3,
            child: SizedBox(
              height: 65,
              child: ListView(
                addAutomaticKeepAlives: false,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: [
                  for (var i = 0;
                      i < restaurantTitleList.length;
                      i = i + 2) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BestRestaurantItem(
                          title: restaurantTitleList[i],
                          rate: rateList[i],
                          imagePath: imagePathList[i],
                          isFreeDelivery: isDeliveryFreeList[i],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: BestRestaurantItem(
                            title: restaurantTitleList[i + 1],
                            rate: rateList[i + 1],
                            imagePath: imagePathList[i + 1],
                            isFreeDelivery: isDeliveryFreeList[i + 1],
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BestRestaurantItem extends StatelessWidget {
  final String? title;
  final String? rate;
  final String? imagePath;
  final bool? isFreeDelivery;

  const BestRestaurantItem({
    Key? key,
    this.title,
    this.rate,
    this.imagePath,
    this.isFreeDelivery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RestaurantPage()),
          );
        },
        child: Container(
          height: 230,
          width: 155.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.black,
            image: DecorationImage(
              image: AssetImage(imagePath!),
              fit: BoxFit.cover,
              opacity: 0.55,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isFreeDelivery!
                    ? Container(
                        height: 25,
                        width: 105,
                        decoration: BoxDecoration(
                          color: kOrderPageButtonColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            "Ücretsiz Teslimat",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    : Container(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          rate!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryListElement extends StatefulWidget {
  final String? title;
  final String? svgPath;
  final int? currentIndex;
  final int index;

  CategoryListElement({
    Key? key,
    this.title,
    this.svgPath,
    required this.index,
    this.currentIndex,
  }) : super(key: key);

  @override
  State<CategoryListElement> createState() => _CategoryListElementState();
}

class _CategoryListElementState extends State<CategoryListElement> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.currentIndex == widget.index
              ? kOrderPageButtonColor
              : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: SvgPicture.asset(
                widget.svgPath!,
                color: widget.currentIndex == widget.index
                    ? Colors.white
                    : Colors.black,
                height: 50,
                width: 50,
              ),
            ),
            Center(
                child: Text(
              widget.title!,
              style: TextStyle(
                color: widget.currentIndex == widget.index
                    ? Colors.white
                    : Colors.black,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
