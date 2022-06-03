// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'constant.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({Key? key}) : super(key: key);

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  var isFav = false;

  var titleList = [
    "Çilekli Magnolia",
    "Pizza",
    "Burger",
    "Cheesecake",
  ];

  var priceList = [
    27.0,
    75.0,
    67.50,
    32.0,
  ];

  var imagePathList = [
    "assets/images/StrawberryMagnolia.jpg",
    "assets/images/Pizza.jpg",
    "assets/images/Burger.jpg",
    "assets/images/Cheescake.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: AssetImage("assets/images/breakfast.jpg"),
                  fit: BoxFit.cover,
                  opacity: 0.55,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Container(
                          height: 25,
                          width: 120,
                          decoration: BoxDecoration(
                            color: kOrderPageButtonColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              "Ücretsiz Teslimat",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "CookShop",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 36,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "Bornova, Kazım Dirik Mah",
                        style: TextStyle(
                            color: kOrderPageTextColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.timer_outlined,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "12:00 - 23:00   ",
                        style: TextStyle(
                            color: kOrderPageTextColor,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Şuan Açık",
                        style: TextStyle(
                            color: Colors.green[500],
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      children: const [
                        Text(
                          "Yemek yemeyi seviyorsanız, COOKSHOP'a bekleriz.",
                          style: TextStyle(
                              color: kOrderPageTextColor,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        FlatButton(
                          height: 40,
                          minWidth: 150,
                          onPressed: () {},
                          color: Colors.white,
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: kOrderPageButtonColor,
                              width: 1,
                            ),
                          ),
                          child: const Text(
                            "Yol Tarifi",
                            style: TextStyle(
                                color: kOrderPageTextColor,
                                letterSpacing: 3,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Text(
                              "Öne Çıkanlar",
                              style: TextStyle(
                                  color: kOrderPageButtonColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: [
                  for (var i = 0; i < 4; i++) ...[
                    RestaurantPageRow(
                      title: titleList[i],
                      price: priceList[i],
                      imagePath: imagePathList[i],
                    ),
                  ],
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: FlatButton(
                minWidth: double.infinity,
                height: 50,
                onPressed: () {},
                child: const Text(
                  "Sipariş Ver",
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
        Positioned(
          bottom: 0,
          top: -310,
          right: 30,
          child: GestureDetector(
            child: Container(
              width: 70,
              height: 70,
              child: const Center(
                child: Icon(
                  Icons.favorite_outline,
                  size: 36,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: isFav ? kOrderPageButtonColor : Colors.grey,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
            ),
            onTap: () {
              setState(() {
                isFav = !isFav;
              });
            },
          ),
        ),
      ],
    );
  }
}

class RestaurantPageRow extends StatelessWidget {
  final String? title;
  final double? price;
  final String? imagePath;

  const RestaurantPageRow({
    Key? key,
    this.title,
    this.price,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath!,
              height: 130,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            title!,
            style: const TextStyle(color: kOrderPageTextColor, fontSize: 16),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "₺ " + price!.toStringAsFixed(2),
            style: TextStyle(
                color: Colors.grey[400],
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
