import 'package:flutter/material.dart';
import 'package:signup/screens/sections/addressDetails.dart';
import 'package:signup/screens/sections/idCardDetails.dart';
import 'package:signup/screens/sections/occupationDetails.dart';
import 'package:signup/screens/sections/personalDetails.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);
  static String id = "/signUpScreen";
  static Map<dynamic, dynamic> userInformation = {};

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.dehaze,
                  size: 30.0,
                  color: Colors.black,
                ),
              )),
        ],
      ),
      body: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PersonalDetails(),
              AddressDetails(),
              IDCardDetails(),
              OccupationDetails(),
            ],
          ),
        ),
      ),
    ));
  }
}
