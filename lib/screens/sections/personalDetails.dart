import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signup/screens/signUpScreens.dart';

class PersonalDetails extends StatefulWidget {
  PersonalDetails({Key? key}) : super(key: key);

  String? firstName = "Mr";
  String? selectGender = "Select";
  String? selectYourStatus = "Select your Status";

  late MediaQueryData screenDimens;
  late double fontMultiplier;

  TextEditingController name = TextEditingController();
  TextEditingController surName = TextEditingController();
  TextEditingController fatherName = TextEditingController();
  TextEditingController motherName = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController nationality = TextEditingController();

  PickedFile? pickedFile;
  File? imageFileProfile;

  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  getFromCamera() async {
    widget.pickedFile = (await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1000,
      maxHeight: 1000,
    ));
    setState(() {
      widget.imageFileProfile = File(widget.pickedFile!.path);
    });
  }

  setImage() {
    return widget.imageFileProfile != null
        ? FileImage(widget.imageFileProfile!)
        : const AssetImage("assets/noimage.png");
  }

  Widget getTextField(String hint, TextEditingController controller) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 8, 0),
            child: TextField(
              controller: controller,
              onChanged: (value) {
                if (hint == "First Name") {
                  SignUpScreen.userInformation['FirstName'] = value;
                } else if (hint == 'SurName') {
                  SignUpScreen.userInformation['SurName'] = value;
                } else if (hint == 'Date of Birth') {
                  SignUpScreen.userInformation['DateOfBirth'] = value;
                } else if (hint == 'Father Name') {
                  SignUpScreen.userInformation['FatherName'] = value;
                } else if (hint == 'Mother Name') {
                  SignUpScreen.userInformation['MotherName'] = value;
                } else if (hint == 'Nationality') {
                  SignUpScreen.userInformation['Nationality'] = value;
                }
              },
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                hintText: hint,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget getTextFieldName(String hint, TextEditingController controller) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
            child: TextField(
              controller: controller,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(8.0)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(8.0)),
                ),
                hintText: hint,
                hintStyle: const TextStyle(color: Colors.grey),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget getText(String data) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 10, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            data,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: widget.fontMultiplier * 3,
            ),
          ),
        ],
      ),
    );
  }

  Widget getDropDown() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: widget.firstName!,
        iconSize: 24,
        elevation: 16,
        hint: Text(widget.firstName!),
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
        onChanged: (String? newValue) {
          setState(() {
            widget.firstName = newValue!;
            SignUpScreen.userInformation['First'] = widget.firstName;
          });
        },
        items: <String>['Mr', 'Mrs', 'Ms']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget getDobDropDown() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: widget.selectGender!,
        iconSize: 24,
        elevation: 16,
        hint: Text(widget.selectGender!),
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
        onChanged: (String? newValue) {
          setState(() {
            widget.selectGender = newValue!;
            SignUpScreen.userInformation['Gender'] = widget.selectGender;
          });
        },
        items: <String>['Select', 'Male', 'Female']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget getMartialDropDown() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: widget.selectYourStatus!,
        iconSize: 24,
        elevation: 16,
        hint: Text(widget.selectYourStatus!),
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
        onChanged: (String? newValue) {
          setState(() {
            widget.selectYourStatus = newValue!;
            SignUpScreen.userInformation['Status'] = widget.selectYourStatus;
          });
        },
        items: <String>[
          'Select your Status',
          'Single',
          'Marred',
          'Divorced',
          'Widow/Widower'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;
    double mHeight = MediaQuery.of(context).size.height;

    widget.screenDimens = MediaQuery.of(context);
    widget.fontMultiplier = widget.screenDimens.size.height * 0.01;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: mHeight * 0.08,
                decoration: const BoxDecoration(
                    color: Color(0xfff2f4f2),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0))),
                child: Center(
                  child: Text(
                    "Personal Details",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: widget.fontMultiplier * 3),
                  ),
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: SizedBox(
                        width: 90,
                        child: Center(
                            child: Text(
                          "Photo",
                          style: TextStyle(
                              fontSize: widget.fontMultiplier * 3,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ))),
                  )
                ],
              ),
              Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.deepPurple,
                            width: 2.0,
                          ),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: setImage(), fit: BoxFit.cover),
                        ),
                      ),
                      Positioned(
                        left: 65,
                        top: 10,
                        child: GestureDetector(
                          onTap: () {
                            getFromCamera();
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                                color: Colors.black, shape: BoxShape.circle),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.asset("assets/pencil.png"),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        //todo:firsName
        getText("FirstName"),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                height: 51,
                decoration: const BoxDecoration(
                    color: Color(0xfff2f4f2),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0))),
                child: Center(child: getDropDown()),
              ),
            ),
            Expanded(
              flex: 8,
              child: getTextFieldName("First Name", widget.name),
            ),
          ],
        ),
        // todo : SurName
        getText("SurName"),
        getTextField("SurName", widget.surName),
        //  todo : Gender
        getText("Gender"),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 8, 5, 0),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: getDobDropDown(),
                ),
              ),
            )
          ],
        ),
        //  todo : Date of Birth
        getText("Date Of Birth"),
        getTextField("Date Of Birth", widget.dateOfBirth),

        //  todo : Father Name
        getText("Father Name"),
        getTextField("Father Name", widget.fatherName),

        //  todo : Mother Name
        getText("Mother Name"),
        getTextField("Mother Name", widget.motherName),

        //  todo : Marital Status
        getText("Martial Status"),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 8, 5, 0),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: getMartialDropDown(),
                ),
              ),
            )
          ],
        ),

        //  todo : Nationality
        getText("Nationality"),
        getTextField("Nationality", widget.nationality),
      ],
    );
  }
}
