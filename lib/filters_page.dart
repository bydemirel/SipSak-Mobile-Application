import 'package:flutter/material.dart';

import 'constant.dart';

class FiltersPage extends StatefulWidget {
  const FiltersPage({Key? key}) : super(key: key);

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  var _value = 100.0;
  var isFreeDelivery = false;
  var isResTicket = false;
  var isGlutenFree = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Filtreler',
                style: TextStyle(
                    color: kOrderPageTextColor,
                    fontSize: 28,
                    fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _value = 100.0;
                    isFreeDelivery = false;
                    isResTicket = false;
                    isGlutenFree = false;
                  });
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.replay_outlined,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Sıfırla",
                      style:
                          TextStyle(fontWeight: FontWeight.w200, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 1,
          height: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "KATEGORİLER",
                style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 3,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "FİYAT ARALIĞI",
                style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 3,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "₺" + _value.round().toString(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ),
              Slider(
                activeColor: kOrderPageButtonColor,
                inactiveColor: Colors.grey,
                min: 0.0,
                max: 200.0,
                divisions: 20,
                value: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
              const Padding(
                padding: EdgeInsets.only(left: 13, top: 25),
                child: Text(
                  "SEÇENEKLER",
                  style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 3,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 0.5,
                height: 0,
              ),
              OptionsRow(
                text: "Ücretsiz Teslimat",
                isSelected: isFreeDelivery,
                func: () {
                  setState(() {
                    isFreeDelivery = !isFreeDelivery;
                  });
                },
              ),
              const Divider(
                thickness: 0.5,
                height: 0,
              ),
              OptionsRow(
                text: "Restorant İndirimi",
                isSelected: isResTicket,
                func: () {
                  setState(() {
                    isResTicket = !isResTicket;
                  });
                },
              ),
              const Divider(
                thickness: 0.5,
                height: 0,
              ),
              OptionsRow(
                text: "Glutensiz",
                isSelected: isGlutenFree,
                func: () {
                  setState(() {
                    isGlutenFree = !isGlutenFree;
                  });
                },
              ),
              const Divider(
                thickness: 0.5,
                height: 0,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    "Daha fazla",
                    style: TextStyle(
                        color: kOrderPageTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: kOrderPageButtonColor,
                    size: 15,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: FlatButton(
                  minWidth: double.infinity,
                  height: 50,
                  onPressed: () {},
                  child: const Text(
                    "Ara",
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
    );
  }
}

class OptionsRow extends StatelessWidget {
  final String? text;
  final bool? isSelected;
  final VoidCallback? func;

  const OptionsRow({
    Key? key,
    this.text,
    this.isSelected,
    this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: func!,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text!,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: isSelected! ? FontWeight.w400 : FontWeight.w300,
                  color: isSelected! ? kOrderPageButtonColor : Colors.black),
            ),
            isSelected!
                ? const Icon(
                    Icons.done,
                    color: kOrderPageButtonColor,
                  )
                : const Text(""),
          ],
        ),
      ),
    );
  }
}
