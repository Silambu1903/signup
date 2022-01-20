import 'package:flutter/material.dart';

import '../../itemCheckboxModel.dart';

class OccupationDetails extends StatefulWidget {
  OccupationDetails({Key? key}) : super(key: key);

  bool selectedOccupationType = false;
  bool salariedCheckboxVisibility = false;
  bool selfEmployedCheckboxVisibility = false;
  bool selfBusiness =  false;
  int? currentSelectedIndex;
  String? selectEducation = "Select";
  late MediaQueryData screenDimens;
  late double fontMultiplier;
  int groupValue = 1;

  @override
  _OccupationDetailsState createState() => _OccupationDetailsState();
}

class _OccupationDetailsState extends State<OccupationDetails> {
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

  Widget getEducationDropDown() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: widget.selectEducation!,
        iconSize: 24,
        elevation: 16,
        hint: Text(widget.selectEducation!),
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
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

  Widget getBusinessCheckBox() {
    return Visibility(
      visible: widget.selfBusiness,
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
                  return checkBoxItem(business[index], index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getSelfEmployedCheckBox() {
    return Visibility(
      visible: widget.selfEmployedCheckboxVisibility,
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
                itemCount: selfEmployed.length,
                itemBuilder: (ctx, index) {
                  return checkBoxItem(selfEmployed[index], index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget checkBoxItem(ItemCheck occupationType, int index) {
    return Row(
      children: [
        Text(occupationType.name!),
        Radio(
          value: index,
          groupValue: widget.groupValue,
          onChanged: (int? val) {
            setState(() {
              widget.groupValue = val!;
              if (occupationType.name == 'Salaried') {
                widget.salariedCheckboxVisibility = true;
              }
              if (occupationType.name != 'Salaried') {
                widget.salariedCheckboxVisibility = false;
              }
              if (occupationType.name == 'Self Employed') {
                widget.selfEmployedCheckboxVisibility = true;
              }
              if (occupationType.name != 'Self Employed') {
                widget.selfEmployedCheckboxVisibility = false;
              }
              if (occupationType.name == 'Business') {

                widget.selfBusiness = true;
              }
              if (occupationType.name != 'Business') {

                widget.selfBusiness = false;
              }
            });
          },
        ),
      ],
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
          children: [
            Expanded(
              child: Container(
                height: mHeight * 0.08,
                color: const Color(0xfff2f4f2),
                child: const Center(
                  child: Text(
                    "Occupation Details",
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
        //todo:Education
        getText("Education"),
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
                  child: getEducationDropDown(),
                ),
              ),
            )
          ],
        ),
        //todo:Occupation
        getText("Occupation Type"),
        Padding(
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
                    return checkBoxItem(occupationType[index], index);
                  },
                ),
              ),
            ],
          ),
        ),
        getSalariedCheckBox(),
        getSelfEmployedCheckBox(),
        getBusinessCheckBox(),
        getText("Gross Annual Income"),
        getTextField('Gross Annual Income'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            children: [
              SizedBox(
                height: 50,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: sourceOfFunds.length,
                  itemBuilder: (ctx, index) {
                    return checkBoxItem(sourceOfFunds[index], index);
                  },
                ),
              ),
            ],
          ),
        ),

        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 40,
                  child: MaterialButton(
                    color: Colors.purple,
                    onPressed: () {},
                    child: Text(
                      'save',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: widget.fontMultiplier * 3,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
