import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:signup/screens/sections/addressDetails.dart';
import 'package:signup/screens/sections/idCardDetails.dart';
import 'package:signup/screens/sections/occupationDetails.dart';
import 'package:signup/screens/sections/personalDetails.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);
  static String id = "/signUpScreen";
  bool prev = false;
  bool nex = true;
  int pageIndex = 0;
  PageController controller = PageController(initialPage: 0);
  static Map<dynamic, dynamic> userInformation = {};

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
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
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15), topLeft: Radius.circular(15)),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: PageView(
                controller: widget.controller,
                onPageChanged: (int index) {
                  setState(() {
                    widget.pageIndex = index;
                  });
                },
                children: [
                  SingleChildScrollView(
                    child: PersonalDetails(),
                  ),
                  SingleChildScrollView(
                    child: AddressDetails(),
                  ),
                  SingleChildScrollView(
                    child: IDCardDetails(),
                  ),
                  SingleChildScrollView(
                    child: OccupationDetails(),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Visibility(
                    visible: widget.prev,
                    child: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          height: MediaQuery.of(context).size.height * 0.14,
                          color: Colors.deepPurple,
                          onPressed: () {
                            setState(() {
                              if (widget.pageIndex == 1) {
                                widget.prev = false;
                              }
                            });
                            widget.controller.previousPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeIn);
                          },
                          child: const Text(
                            "Previous",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: widget.nex,
                    child: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.14,
                          child: MaterialButton(
                            color: Colors.deepPurple,
                            onPressed: () {
                              setState(
                                () {
                                  if (widget.pageIndex < 1) {
                                    widget.prev = true;
                                  }
                                },
                              );

                              widget.controller.nextPage(
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeInOut);
                            },
                            child: Text(
                              widget.pageIndex == 3 ? "Submit" : "Next",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
