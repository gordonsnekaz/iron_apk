// ignore_for_file: sized_box_for_whitespace

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:ironapk/api_connection/api_connection.dart';
import 'package:ironapk/user/model/user.dart';

import 'login_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  //variables
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _addressController = TextEditingController();

  Future validateUserName() async {
    try{
      var response = await http.post(
        Uri.parse(API.validateEmail),
        body: {
          'user_number': _usernameController.text,
        }
      );

      if(response.statusCode == 200){ //connection is successfull
        var resonseBody = jsonDecode(response.body);

        if(resonseBody['emailFound']){
          Fluttertoast.showToast(msg: "Mobile number in use, try another mobile number!!!");
        }else{
          //save new user
          saveUserRecord();
        }
      }
    }catch(e){
      Fluttertoast.showToast(msg: "Error when validating");
    }
  }

  Future testDb() async{
    var result = await http.post(
        Uri.parse("http://192.168.43.175/IronApk/connection.php"),
         
    );
    print(result.body);
    Fluttertoast.showToast(msg: result.body);
  }

  Future saveUserRecord() async{
    User userModel = User(
      _addressController.text.trim(), 
      _usernameController.text.trim(), 
      _passwordController.text.trim(),
    );

    try{
      var response = await http.post(
        Uri.parse(API.signUp),
        body: {
          userModel.toJson()
        }
      );

      if(response.statusCode == 200){
        var responseBody = jsonDecode(response.body);

        if(responseBody['success']){
          Fluttertoast.showToast(msg: "Congrulations you have sign up successfully!!!");
        }else{
          Fluttertoast.showToast(msg: "Error when signing");
        }
      }
    }catch(e){
      Fluttertoast.showToast(msg: "Failed to save record");
    }
  }

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
                "Sign up",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "WELCOME TO House of Ironing!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Please fill in your details to create an account",
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
                    color: const Color(0xffffffff),
                    border: Border.all(color: const Color(0xff009818)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                          fillColor: Color(0xffffffff),
                          border: InputBorder.none,
                          hintText: "new password"),
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
                      controller: _addressController,
                      decoration: const InputDecoration(
                          fillColor: Color(0xffffffff),
                          border: InputBorder.none,
                          hintText: "confirm password"),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: GestureDetector(
                  onTap: () => {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()))
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: const Color(0xff009818),
                        borderRadius: BorderRadius.circular(8)),
                    child: const Center(
                      child: Text(
                        "Sign up",
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
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()))
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Already have account? ",
                        style: TextStyle(
                          color: Color(0xff4f4f4f),
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        " Sign in",
                        style: TextStyle(
                          color: Color(0xff2F80ED),
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
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
