import 'package:courier_page/restaurant_page.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

class RestaurantsPage extends StatefulWidget {
  const RestaurantsPage({Key? key}) : super(key: key);

  @override
  State<RestaurantsPage> createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  var rateList = [
    "4.5",
    "4.7",
    "4.2",
    "4.8",
  ];
  /*var pathList = [
    "assets/images/kırçiçeği.jpg",
    "assets/images/pennePastaTomato.jpg",
    "assets/images/Spaghetti.jpg",
    "assets/images/SpaghettiShrimp.jpg",
  ];*/

  var isFavoriteList = [
    true,
    false,
    false,
    true,
  ];

  var resNameList = [
    "Kırçiçeği",
    "Ramazan Usta",
    "Ciğerci Apo",
    "Dönerci Vedat",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            image: DecorationImage(
              image: AssetImage("assets/images/kırçiçeği.jpg"),
              fit: BoxFit.cover,
              opacity: 0.4,
            ),
          ),
          child: Column(
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
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Türk Yemekleri",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Expanded(
          child: ListView(
            addAutomaticKeepAlives: false,
            shrinkWrap: true,
            cacheExtent: 100,
            physics: const BouncingScrollPhysics(),
            children: [
              for (var i = 0; i < 4; i++) ...[
                RestaurantsRow(
                    rate: rateList[i],
                    resName: resNameList[i],
                    isFav: isFavoriteList[i],
                    func: () {
                      setState(() {
                        isFavoriteList[i] = !isFavoriteList[i];
                      });
                    },
                    func2: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RestaurantPage()),
                      );
                    }),
                const Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  indent: 20,
                  endIndent: 20,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class RestaurantsRow extends StatelessWidget {
  final String? rate;
  final VoidCallback? func;
  final VoidCallback? func2;
  final String? resName;
  final bool? isFav;

  const RestaurantsRow({
    Key? key,
    this.rate,
    this.resName,
    this.isFav,
    this.func,
    this.func2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: func2,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/kırçiçeği.jpg",
                      height: 95,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.star,
                                color: Colors.yellow[600],
                                size: 20,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                rate!,
                                style: const TextStyle(
                                    color: kOrderPageTextColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Text(
                            resName!,
                            style: const TextStyle(
                                color: kOrderPageTextColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.grey[400],
                            ),
                            SizedBox(
                              width: size.width * 0.4,
                              child: Text(
                                "Bornova, Kazım Dirik Mahallesi",
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.w400),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 20,
                              width: 110,
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
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: GestureDetector(
                child: Container(
                  width: 40,
                  height: 40,
                  child: const Center(
                    child: Icon(
                      Icons.favorite_outline,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: isFav! ? kOrderPageButtonColor : Colors.grey[400],
                    shape: BoxShape.circle,
                  ),
                ),
                onTap: func,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
