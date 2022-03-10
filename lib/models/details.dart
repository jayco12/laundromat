import 'package:flutter/material.dart';
import 'package:flutterfire_demo/models/picktime.dart';
import 'package:flutterfire_demo/utils/fade_animation.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Map<String, Map<String, int>> order = {
    'shirt': {'price': 3, 'total': 0},
    'short': {'price': 2, 'total': 0},
    'trouser': {'price': 5, 'total': 0},
    'jacket': {'price': 5, 'total': 0},
    'dress': {'price': 5, 'total': 0},
    'others': {'price': 2, 'total': 0}
  };
  int totalPrice = 0;

  //////////////////////////////
  /// @withflutter
  ///
  /// afifudin.vercel.app
  //////////////////////////////
  @override
  Widget build(BuildContext context) {
    Widget option(
        {String? image, String? name, int? price, String? type, int? delay}) {
      return FadeAnimation(
        delay: delay,
        child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/page1/$image',
                  width: 48,
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name!,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      '\$$price',
                    )
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (order[type]!['total'] != 0) {
                        order[type]!['total'] = order[type]!['total']! - 1;
                        totalPrice = totalPrice - order[type]!['price']!;
                      }
                    });
                  },
                  child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300, shape: BoxShape.circle),
                      child: Center(
                          child: Icon(
                        Icons.remove,
                        size: 16,
                        color: Colors.grey.shade800,
                      ))),
                ),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                  width: 24,
                  child: Center(
                    child: Text(
                      '${order[type]!['total']}',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      order[type]!['total'] = order[type]!['total']! + 1;
                      totalPrice = totalPrice + order[type]!['price']!;
                    });
                  },
                  child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300, shape: BoxShape.circle),
                      child: Center(
                          child: Icon(
                        Icons.add,
                        size: 16,
                        color: Colors.grey.shade800,
                      ))),
                ),
              ],
            )),
      );
    }

    return Scaffold(
        backgroundColor: const Color(0xffF1F1F1),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Add Details',
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                option(
                    image: 'shirt.png',
                    name: 'T-Shirt',
                    price: 3,
                    type: 'shirt',
                    delay: 150),
                option(
                    image: 'shorts.png',
                    name: 'Short',
                    price: 2,
                    type: 'short',
                    delay: 300),
                option(
                    image: 'trousers.png',
                    name: 'Trouser',
                    price: 5,
                    type: 'trouser',
                    delay: 450),
                option(
                    image: 'jacket.png',
                    name: 'Jacket',
                    price: 5,
                    type: 'jacket',
                    delay: 600),
                option(
                    image: 'dress.png',
                    name: 'Dress',
                    price: 5,
                    type: 'dress',
                    delay: 750),
                option(
                    image: 'tie.png',
                    name: 'Others',
                    price: 2,
                    type: 'others',
                    delay: 900),
                FadeAnimation(
                  delay: 900,
                  child: Text(
                    'Total Price \$$totalPrice',
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PickTimePage()));
          },
          child: FadeAnimation(
            delay: 1200,
            child: Container(
              height: 60,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Done',
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
