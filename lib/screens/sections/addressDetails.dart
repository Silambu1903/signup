import 'package:flutter/material.dart';

class AddressDetails extends StatefulWidget {
  AddressDetails({Key? key}) : super(key: key);

  String? selectYourStatus = "Select your Status";
  String? selectPropertyType = "Select Property Type";
  String? selectLanguage = "Select Language";
  String? selectModeCommunication = "Select Preferred Node of communication";
  String? selectEducation = "Select";
  bool checked = false;
  bool visibility = false;

  @override
  _AddressDetailsState createState() => _AddressDetailsState();
}

class _AddressDetailsState extends State<AddressDetails> {
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

  Widget getSelectLanguageDropDown() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: widget.selectLanguage!,
        iconSize: 24,
        elevation: 16,
        hint: Text(widget.selectLanguage!),
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
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
    );
  }

  Widget getPrefferedModeDropDown() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: widget.selectModeCommunication!,
        iconSize: 24,
        elevation: 16,
        hint: Text(widget.selectModeCommunication!),
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
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
    );
  }

  Widget getPropertyTypeDropDown() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: widget.selectPropertyType!,
        iconSize: 24,
        elevation: 16,
        hint: Text(widget.selectPropertyType!),
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
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

  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;
    double mHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: mHeight * 0.08,
                color: const Color(0xfff2f4f2),
                child: const Center(
                  child: Text(
                    "Address Details",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 8, 0, 10),
              child: Text(
                "Current Address",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 18),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 15, 0, 10),
              child: Text(
                "Apartment",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 15),
              ),
            ),
          ],
        ),
        currentAddress(),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Checkbox(
                value: widget.checked,
                onChanged: (value) {
                  setState(() {
                    widget.checked = value!;
                    value
                        ? widget.visibility = true
                        : widget.visibility = false;
                  });
                },
              ),
            ),
            const Expanded(
              child: Text(
                'Permanent Address Is Different From Current Address',
                style: TextStyle(color: Colors.black),
              ),
            ), //
          ],
        ),
        permanentAddress(),
        Row(
          children: [
            Expanded(
              child: Container(
                height: mHeight * 0.08,
                color: const Color(0xfff2f4f2),
                child: const Center(
                  child: Text(
                    "Contact Details",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
        //todo:Personal Mobile
        getText("Personal Mobile"),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 8, 0, 0),
                height: 58,
                decoration: const BoxDecoration(
                    color: Color(0xfff2f4f2),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0))),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: mWidth * 0.02,
                        height: mHeight * 0.02,
                        child: const Icon(Icons.phone_android),
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        "+91",
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: getTextFieldName("Phone Number"),
            ),
          ],
        ),
        //todo:Phone Landline-(With STD Code)
        getText("Phone Landline-(With STD Code)"),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 8, 0, 0),
                height: 58,
                decoration: const BoxDecoration(
                    color: Color(0xfff2f4f2),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0))),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: mWidth * 0.02,
                      height: mHeight * 0.02,
                      child: const Icon(Icons.call),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: getTextFieldName("Home Landline"),
            ),
          ],
        ),
        //todo:Email
        getText("Email"),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 8, 0, 0),
                height: 58,
                decoration: const BoxDecoration(
                    color: Color(0xfff2f4f2),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0))),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: mWidth * 0.02,
                      height: mHeight * 0.02,
                      child: const Icon(Icons.email),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: getTextFieldName("Email"),
            ),
          ],
        ),
        //todo:Select Language
        getText("Select Language"),
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
                  child: getSelectLanguageDropDown(),
                ),
              ),
            )
          ],
        ),
        //todo:preferred Mode of communnication
        getText("Preferred Mode of communication"),
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
                  child: getPrefferedModeDropDown(),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
