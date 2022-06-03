import 'package:courier_page/constant.dart';
import 'package:flutter/material.dart';
//import 'package:lottie/lottie.dart';

class CourierPage extends StatefulWidget {
  const CourierPage({Key? key}) : super(key: key);

  @override
  State<CourierPage> createState() => _CourierPageState();
}

class _CourierPageState extends State<CourierPage> {
  bool isSwitched = false;
  String courierState = "Kurye Meşgul";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Şipşak Kurye Sayfası",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 218, 196, 4)),
                ),
                Icon(
                  Icons.person,
                  size: 34,
                  color: Color.fromARGB(255, 218, 196, 4),
                ),
              ],
            ),
          ),
          const Divider(
            height: 20,
            thickness: 1,
          ),
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.redAccent,
            child: const Align(
                alignment: Alignment.center, child: Text("HARİTA GELECEK...")),
          ),
          const SizedBox(
            height: 15,
          ),
          /*SizedBox(
            height: size.height * 0.5,
            width: size.width * 1.5,
            child: Lottie.network(
                'https://assets10.lottiefiles.com/packages/lf20_3ls8a1y5.json'),
          ),*/
          const SizedBox(
            height: 15,
          ),
          Container(
            color: Colors.amber[100],
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 1,
                ),
                const Icon(
                  Icons.motorcycle,
                  size: 60,
                ),
                Text(
                  courierState,
                  style: const TextStyle(fontSize: 24),
                ),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      if (!isSwitched) {
                        courierState = "Kurye Çalışıyor";
                      } else {
                        courierState = "Kurye Dinleniyor";
                      }
                      isSwitched = value;
                    });
                  },
                  activeTrackColor: Colors.lightGreenAccent,
                  activeColor: Colors.green,
                  inactiveTrackColor: Colors.redAccent,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const CourierCard(
            title: "Product Type",
            content: "Hamburger",
            imagePath: "",
          ),
          const CourierCard(
            title: "Product Content",
            content: "1 Hamburger",
            imagePath: "",
          ),
          const CourierCard(
            title: "Payment Method",
            content: "Credit Card",
            imagePath: "",
          ),
        ],
      ),
    );
  }
}

class CourierCard extends StatelessWidget {
  final String? title;
  final String? content;
  final String? imagePath;

  const CourierCard({
    Key? key,
    this.title,
    this.content,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        height: size.height * 0.16,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: KprimaryColor,
            border: Border.all(
              width: 2,
              color: const Color.fromARGB(255, 11, 12, 1),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 3),
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              radius: 40,
            ),
            const SizedBox(
              width: 40,
            ),
            SizedBox(
              width: size.width * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        title!,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        content!,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
