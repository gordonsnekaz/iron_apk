import 'package:flutter/material.dart';
import 'package:ironapk/login_screen.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      height: 400,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/logo.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        children: const [
                          Text(
                            "Welcome to the House of Ironing!",
                            style: TextStyle(
                                color: Color(0xff173C57),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Making your clothes make you.",
                            style: TextStyle(
                              color: Color(0xff4A4A4A),
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const LoginPage()))
                },
                child: Container(
                    padding: const EdgeInsets.only(
                      bottom: 60.0,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 90.0,
                        vertical: 15.0,
                      ),
                      decoration: BoxDecoration(
                          color: const Color(0xff009818),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Text(
                        "Get started",
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    )),
              )
            ],
          ),
        ));
  }
}
