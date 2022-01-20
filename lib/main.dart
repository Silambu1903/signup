import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signup/theme/mytheme.dart';

import 'itemCheckboxModel.dart';

void main() {
  runApp(const MyAppTheme());
}

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);
  String? firstName = "Mr";
  String? selectGender = "Select";
  String? selectYourStatus = "Select your Status";
  String? selectPropertyType = "Select Property Type";
  String? selectLanguage = "Select Language";
  String? selectModeCommunication = "Select Preferred Node of communication";
  String? selectEducation = "Select";
  PickedFile? pickedFile;
  File? imageFileAadhaarFront;
  File? imageFileAadhaarRear;
  File? imageFilePanFront;
  File? imageFilePanRear;
  File? imageFileDrivingFront;
  File? imageFileDrivingRear;
  File? imageFilePassportFront;
  File? imageFilePassportRear;
  File? imageFileVoterFront;
  File? imageFileVoterRear;
  File? imageFileFamilyFront;
  File? imageFileFamilyRear;
  bool visibility = false;
  bool checked = false;
  bool selectedOccupationType = false;
  bool salariedCheckboxVisibility = false;
  int? currentSelectedIndex;

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget getTextField(String hint) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 8, 0),
            child: TextField(
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

  Widget getTextFieldName(String hint) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 5, 0),
            child: TextField(
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

  Widget getTextFieldNoKeyword() {
    return Row(
      children: const [
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 8, 5, 5),
            child: TextField(
              enableInteractiveSelection: false,
              showCursor: true,
              //add this line
              readOnly: true,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget currentAddress() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 2, 5, 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black38,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    //  todo : House No
                    getText("House No."),
                    getTextField("House No."),
                    //  todo : Level/Floor
                    getText("Level/Floor"),
                    getTextField("Level/Floor"),
                    //  todo :Block
                    getText("Block"),
                    getTextField("Block"),
                    //  todo :Apartment Premises Name
                    getText("Apartment Premises Name"),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: getTextField("Apartment Premises Name"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        //  todo :Door No.
        getText("Door No."),
        getTextField("Door No."),
        //  todo :Plot No.
        getText("Plot No."),
        getTextField("Plot No."),
        //  todo :Street Name
        getText("Street Name"),
        getTextField("Street Name"),
        //  todo :Colony Name
        getText("Colony Name"),
        getTextField("Colony Name"),
        //  todo :Area/Locality
        getText("Area/Locality"),
        getTextField("Area/Locality"),
        //  todo :Landmark
        getText("Landmark"),
        getTextField("Landmark"),
        //  todo :Taluk
        getText("Taluk"),
        getTextField("Taluk"),
        //  todo :City
        getText("City"),
        getTextField("City"),
        //  todo :District
        getText("District"),
        getTextField("District"),
        //  todo :State
        getText("State"),
        getTextField("State"),
        //  todo :Country
        getText("Country"),
        getTextField("Country"),
        //  todo :PinCode
        getText("PinCode"),
        getTextField("PinCode"),
        //  todo :Property Type
        getText("Property Type"),
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
                  child: getPropertyTypeDropDown(),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget permanentAddress() {
    return Visibility(
      visible: widget.visibility,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(10, 2, 5, 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black38,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    children: [
                      //  todo : House No
                      getText("House No."),
                      getTextField("House No."),
                      //  todo : Level/Floor
                      getText("Level/Floor"),
                      getTextField("Level/Floor"),
                      //  todo :Block
                      getText("Block"),
                      getTextField("Block"),
                      //  todo :Apartment Premises Name
                      getText("Apartment Premises Name"),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: getTextField("Apartment Premises Name"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          //  todo :Door No.
          getText("Door No."),
          getTextField("Door No."),
          //  todo :Plot No.
          getText("Plot No."),
          getTextField("Plot No."),
          //  todo :Street Name
          getText("Street Name"),
          getTextField("Street Name"),
          //  todo :Colony Name
          getText("Colony Name"),
          getTextField("Colony Name"),
          //  todo :Area/Locality
          getText("Area/Locality"),
          getTextField("Area/Locality"),
          //  todo :Landmark
          getText("Landmark"),
          getTextField("Landmark"),
          //  todo :Taluk
          getText("Taluk"),
          getTextField("Taluk"),
          //  todo :City
          getText("City"),
          getTextField("City"),
          //  todo :District
          getText("District"),
          getTextField("District"),
          //  todo :State
          getText("State"),
          getTextField("State"),
          //  todo :Country
          getText("Country"),
          getTextField("Country"),
          //  todo :PinCode
          getText("PinCode"),
          getTextField("PinCode"),
          //  todo :Property Type
          getText("Property Type"),
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
                    child: getPropertyTypeDropDown(),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget getPropertyTypeDropDown() {
    return Expanded(
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: widget.selectPropertyType!,
          iconSize: 24,
          elevation: 16,
          hint: Text(widget.selectPropertyType!),
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal),
          onChanged: (String? newValue) {
            setState(() {
              widget.selectPropertyType != newValue!;
            });
          },
          items: <String>[
            'Select Property Type',
            'Own',
            'Rented',
            'Leased',
            'Ancestal',
            'Parental',
            'Company'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget getSelectLanguageDropDown() {
    return Expanded(
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: widget.selectLanguage!,
          iconSize: 24,
          elevation: 16,
          hint: Text(widget.selectLanguage!),
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal),
          onChanged: (String? newValue) {
            setState(() {
              widget.selectLanguage != newValue!;
            });
          },
          items: <String>['Select Language', 'Tamil', 'English', 'Hindi']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget getPrefferedModeDropDown() {
    return Expanded(
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: widget.selectModeCommunication!,
          iconSize: 24,
          elevation: 16,
          hint: Text(widget.selectModeCommunication!),
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal),
          onChanged: (String? newValue) {
            setState(() {
              widget.selectModeCommunication != newValue!;
            });
          },
          items: <String>[
            'Select Preferred Node of communication',
            'Sms',
            'Whatsapp',
            'Email'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget getEducationDropDown() {
    return Expanded(
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: widget.selectEducation!,
          iconSize: 24,
          elevation: 16,
          hint: Text(widget.selectEducation!),
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal),
          onChanged: (String? newValue) {
            setState(() {
              widget.selectEducation != newValue!;
            });
          },
          items: <String>[
            'Select',
            'Lower Primary (Upto 5)',
            'Higher Primary (6-8)',
            'Lower Secondary',
            'Higher Secondary',
            'Diploma',
            'Under Graduate (Bachelor' 's)',
            'Post Graduate (Master'
                's)'
                'Doctorate (PHD)'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget getText(String data) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            data,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget getSalariedCheckBox() {
    return Visibility(
      visible: widget.salariedCheckboxVisibility,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          children: [
            SizedBox(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: occupationType.length,
                itemBuilder: (ctx, index) {
                  return checkBoxItem(salaried[index], index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;
    double mHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      // todo: AppBar
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
      // todo: Content
      body: Card(
        child: SingleChildScrollView(
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              children: [],
            ),
          ),
        ),
      ),
    ));
  }

  Widget checkBoxItem(ItemCheck occupationType, int index) {
    return Row(
      children: [
        Text(occupationType.name!),
        Checkbox(
          value: occupationType.isChecked,
          onChanged: (value) {
            setState(() {
              occupationType.isChecked = value;
              widget.salariedCheckboxVisibility = value!;
            });
          },
        ),
      ],
    );
  }
}
