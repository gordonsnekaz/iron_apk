import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final headings = <String>[
    'T-Shirt',
    'Skirt',
    'Troursers',
    'Short',
    'Blazer',
  ];

  final prices = <double>[
    0.10,
    0.10,
    0.20,
    0.10,
    0.30,
  ];

  final imagesStrings = <String>[
    'assets/t-shirt.png',
    'assets/skirt.png',
    'assets/trousers.jpg',
    'assets/short.png',
    'assets/blazer.jpg'
  ];

  final items = <int>[
    0,
    0,
    0,
    0,
    0
  ];

  final totals = <double>[
    0.00,
    0.00,
    0.00,
    0.00,
    0.00
  ];

  double sum = 0.00;

  Future placeOrder() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: Color(0xfff5f8ff),
            title: const Text(
              'Order successfully placed',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff009818)),
            ),
            content: Text(
              "${headings[0]} - ${items[0]}\n ${headings[1]} - ${items[1]}\n ${headings[2]} - ${items[2]}\n ${headings[3]} - ${items[3]}\n ${headings[4]} - ${items[4]}\n\n\n Total: \$${sum.toStringAsFixed(2)}",
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff828282)),
            ),
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: const Text(
                "Welcome to the",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff4A4A4A),
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15,),
              child: const Text(
                "House of Ironing",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff009818),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: const Color(0xffA3A3A3),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff4A4A4A)),
                  ),
                  Text(
                    '\$ ${sum.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffDE0000),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GestureDetector(
                onTap: () => {
                  //place order
                  placeOrder()
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: const Color(0xff009818),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                    child: Text(
                      "Place order",
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  itemCount: headings.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 0.4))),
                      margin: EdgeInsets.symmetric(vertical: 6.0),
                      child: GestureDetector(
                        onTap: () {
                          
                        },
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Row(children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: Color(0xffA3A3A3),
                                          width: 2.0,
                                          style: BorderStyle.solid,
                                        ),
                                        image: DecorationImage(
                                            fit: BoxFit.fitHeight,
                                            image: AssetImage(
                                                imagesStrings[index]))),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        headings[index],
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff4A4A4A)),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '\$${prices[index].toStringAsFixed(2)}',
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xffDE0000)),
                                      ),
                                    ],
                                  ),
                                ]),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => {
                                      if(items[index] > 0){
                                        setState((){
                                          totals[index] = prices[index] * (items[index] - 1);
                                          items[index] = items[index] - 1;
                                          sum = totals.fold(0, (a, b) => a + b);
                                        })
                                      }
                                    },
                                    child: const Icon(
                                      Icons.remove,
                                      color: Color(0xff4A4A4A),
                                      size: 16,
                                    ),
                                  ),
                                  const SizedBox(width: 4,),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: const Color(0xff4A4A4A), width: 0.6
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                                    child: Row(
                                      children: [
                                        Text(
                                          '${items[index]}   -   ',
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff4A4A4A)),
                                        ),
                                        Text(
                                          '\$ ${totals[index].toStringAsFixed(2)}',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff009818)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  GestureDetector(
                                    onTap: () => {
                                      setState((){
                                        totals[index] = prices[index] * (items[index] + 1);
                                        items[index] = items[index] + 1;
                                        sum = totals.fold(0, (a, b) => a + b);
                                      })
                                    },
                                    child: const Icon(
                                      Icons.add,
                                      color: Color(0xff4A4A4A),
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
            ),
          ],
        ),
      ),
    );
  }
}
