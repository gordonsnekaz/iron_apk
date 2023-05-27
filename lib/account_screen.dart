import 'package:flutter/material.dart';
import 'package:ironapk/landing_screen.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            children: [
              const SizedBox(
                height: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Profile",
                    style: TextStyle(
                      color: Color(0xff009818),
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff009818),
                          Color(0xffffffff),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: const Text(
                      "MGM",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "@gordons",
                    style: TextStyle(
                      color: Color(0xff009818),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "General settings",
                style: TextStyle(
                    color: Color(0xffA3A3A3),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                thickness: 0.8,
                color: Color(0xff828282),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  border: Border.all(color: Color(0xff009818)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                        fillColor: Color(0xffffffff),
                        border: InputBorder.none,
                        hintText: "@gordons"),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  border: Border.all(color: Color(0xff009818)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                        fillColor: Color(0xffffffff),
                        border: InputBorder.none,
                        hintText: "**********"),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "App settings",
                style: TextStyle(
                    color: Color(0xffA3A3A3),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                thickness: 0.8,
                color: Color(0xff828282),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.notifications_outlined,
                        color: Color(0xff4F4F4F),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Enable notifications")
                    ],
                  ),
                  const Icon(
                    Icons.toggle_on_outlined,
                    color: Color(0xff4F4F4F),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.brightness_3_outlined,
                        color: Color(0xff4F4F4F),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Dark mode")
                    ],
                  ),
                  const Icon(
                    Icons.toggle_on_outlined,
                    color: Color(0xff4F4F4F),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
