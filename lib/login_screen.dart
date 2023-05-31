// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:ironapk/home_page.dart';
import 'package:ironapk/sign_up_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //variables
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: Color(0xfff5f8ff),
            title: Text(
              'Wrong credentials',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.red[400]),
            ),
            content: const Text(
              'Wrong login details, please enter correct details to login.',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff828282)),
            ),
          ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
          child: Expanded(
              child: ListView(
        children: [
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                height: 60,
                width: 60,
                child: const Image(
                  image: AssetImage('assets/logo.png'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Welcome back to",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "House of Ironing",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Please enter your login details",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
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
                          hintText: "mobile number"),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Container(
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
                          hintText: "password"),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(""),
                    Text(
                      "Forget password?",
                      style: TextStyle(
                          color: Color(0xff2F80ED),
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: GestureDetector(
                  onTap: () => {
                    if (_usernameController.text == "0773812106" &&
                        _passwordController.text == "admin")
                      {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage(username: 'Mufasa',)))
                      }
                    else
                      {
                        openDialog(),
                      }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: const Color(0xff009818),
                        borderRadius: BorderRadius.circular(8)),
                    child: const Center(
                      child: Text(
                        "Sign in",
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
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: GestureDetector(
                  onTap: () => {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    ),
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Create account",
                        style: TextStyle(
                          color: Color(0xff2F80ED),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ))
        ],
      ))),
    );
  }
}
