// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'constant.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  /*var amount1 = 1;
  var amount2 = 1;
  var amount3 = 1;*/

  var subTotal = 0;

  var amountList = [
    1,
    1,
    1,
  ];

  var dishPriceList = [
    21.90,
    14.90,
    17.50,
  ];

  var totalTextList = [
    "Ara Toplam",
    "Restorant İndirimi",
    "Teslimat Ücreti",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                    onPressed: () {},
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
                  "Sipariş",
                  style: TextStyle(
                      color: kOrderPageTextColor,
                      fontSize: 28,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView(
              children: [
                for (var i = 0; i < 3; i++) ...[
                  OrderListItem(
                    dishPrice: dishPriceList[i],
                    funcInc: () {
                      setState(() {
                        amountList[i]++;
                      });
                    },
                    funcDec: () {
                      setState(() {
                        if (amountList[i] > 0) {
                          amountList[i]--;
                        }
                      });
                    },
                    amount: amountList[i],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                    indent: 10,
                    endIndent: 15,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18, left: 10),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.discount, color: Colors.grey),
                        Text(
                          "Kupon Ekle / Restorant İndirimi",
                          style: TextStyle(
                              color: kOrderPageTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: const [
                      Text(
                        "Toplam",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: kOrderPageTextColor),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                for (var i = 0; i < 3; i++) ...[
                  TotalListItem(
                    totalTitle: totalTextList[i],
                    total: getTotal(
                      i,
                      amountList,
                      dishPriceList,
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                    indent: 10,
                    endIndent: 15,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        flex: 3,
                        child: Text(
                          "Ödenecek Tutar",
                          style: TextStyle(
                              color: kOrderPageTextColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "₺ " +
                                  getTotal(
                                    3,
                                    amountList,
                                    dishPriceList,
                                  ).toStringAsFixed(2),
                              style: const TextStyle(
                                  color: kOrderPageTextColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  child: FlatButton(
                    minWidth: double.infinity,
                    height: 50,
                    onPressed: () {},
                    child: const Text(
                      "Siparişi Tamamla",
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
        ],
      ),
    );
  }
}

getTotal(index, amountList, dishPriceList) {
  var total = 0.0;
  if (index == 0) {
    // Subtotal
    for (var i = 0; i < 3; i++) {
      total += amountList[i] * dishPriceList[i];
    }
    return total;
  } else if (index == 1) {
    // Restaurant Ticket
    return -20.0;
  } else if (index == 2) {
    // Delivery Fee
    return -5.90;
  } else if (index == 3) {
    // TO PAY
    for (var i = 0; i < 3; i++) {
      total += amountList[i] * dishPriceList[i];
    }
    return total - 20.0 + 5.90;
  }
}

class TotalListItem extends StatelessWidget {
  final String? totalTitle;
  final double? total;

  const TotalListItem({
    Key? key,
    this.totalTitle,
    this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              totalTitle!,
              style: const TextStyle(
                  color: kOrderPageTextColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w300),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              total! < 0
                  ? "- ₺ " + (total! * -1).toStringAsFixed(2)
                  : "  ₺ " + total!.toStringAsFixed(2),
              style: const TextStyle(
                  color: kOrderPageTextColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderListItem extends StatelessWidget {
  final VoidCallback funcInc;
  final VoidCallback funcDec;
  final double? dishPrice;
  final int? amount;
  const OrderListItem({
    Key? key,
    this.amount,
    required this.funcInc,
    required this.funcDec,
    this.dishPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Yemeğin İsmi",
                  style: TextStyle(
                      color: kOrderPageTextColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "₺ " + dishPrice!.toStringAsFixed(2),
                  style: const TextStyle(
                      color: kOrderPageTextColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Container(
                    width: 35,
                    height: 35,
                    child: const Center(
                      child: Icon(
                        Icons.remove,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  onTap: funcDec,
                ),
                Text(
                  amount!.toString(),
                  style: const TextStyle(
                      color: kOrderPageTextColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  child: Container(
                    width: 35,
                    height: 35,
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: kOrderPageButtonColor,
                    ),
                  ),
                  onTap: funcInc,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
