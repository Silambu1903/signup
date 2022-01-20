import 'package:flutter/material.dart';

class PersonalDetails extends StatefulWidget {
  PersonalDetails({Key? key}) : super(key: key);

  String? firstName = "Mr";
  String? selectGender = "Select";
  String? selectYourStatus = "Select your Status";

  late MediaQueryData screenDimens;
  late double fontMultiplier;

  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
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
            padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
            child: SizedBox(
              height: 58,
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
            widget.firstName != newValue!;
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
            widget.selectGender != newValue!;
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
            widget.selectYourStatus != newValue!;
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
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: SizedBox(
                        width: 90,
                        child: Center(
                            child: Text(
                          "Photo",
                          style: TextStyle(fontSize: 18, color: Colors.black),
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
                            width: 5.0,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: SizedBox(
                          width: 80,
                          height: 80,
                          child: CircleAvatar(
                            child: Image.asset("assets/noimage.png"),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 65,
                        top: 10,
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
                height: 58,
                decoration: const BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0))),
                child: Center(child: getDropDown()),
              ),
            ),
            Expanded(
              flex: 8,
              child: getTextFieldName("First Name"),
            ),
          ],
        ),
        // todo : SurName
        getText("SurName"),
        getTextField("SurName"),
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
        getTextField("Date Of Birth"),

        //  todo : Father Name
        getText("Father Name"),
        getTextField("Father Name"),

        //  todo : Mother Name
        getText("Mother Name"),
        getTextField("Mother Name"),

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
        getTextField("Nationality"),
      ],
    );
  }
}
