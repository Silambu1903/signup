import 'package:flutter/material.dart';

import '../../model/itemCheckboxModel.dart';

class OccupationDetails extends StatefulWidget {
  OccupationDetails({Key? key}) : super(key: key);

  bool selectedOccupationType = false;
  bool salariedCheckboxVisibility = false;
  bool selfEmployedCheckboxVisibility = false;
  bool selfBusiness = false;
  bool selfProfession = false;
  bool othersOccupationType = false;
  bool othersSourceOfFunds = false;

  int? currentSelectedIndex;
  String? selectEducation = "Select";
  late MediaQueryData screenDimens;
  late double fontMultiplier;
  int groupValue = 1;
  int groupValueSalaried = 1;
  int groupValueSelfEmployed = 1;
  int groupValueBusiness = 1;
  int groupValueProfession = 1;
  int groupSourceOfFundsSalaried = 1;

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
            widget.selectEducation = newValue!;
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
                  return checkBoxSalariedItem(salaried[index], index);
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
                  return checkBoxBusinessItem(business[index], index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getProfessionCheckBox() {
    return Visibility(
      visible: widget.selfProfession,
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
                  return checkBoxProfessionItem(profession[index], index);
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
                  return checkBoxSelfEmployedItem(selfEmployed[index], index);
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
                widget.selfBusiness = false;
                widget.selfProfession = false;
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
              if (occupationType.name == 'Retired' ||
                  occupationType.name == 'Student' ||
                  occupationType.name == 'House Wife') {
                widget.salariedCheckboxVisibility = false;
                widget.selfBusiness = false;
                widget.selfProfession = false;
              }
              if (occupationType.name == 'Others') {
                widget.othersOccupationType = true;
                widget.salariedCheckboxVisibility = false;
                widget.selfBusiness = false;
                widget.selfProfession = false;
              }
              if (occupationType.name != 'Others') {
                widget.othersOccupationType = false;
              }
            });
          },
        ),
      ],
    );
  }

  Widget checkBoxSalariedItem(ItemCheck occupationType, int index) {
    return Row(
      children: [
        Text(occupationType.name!),
        Radio(
          value: index,
          groupValue: widget.groupValueSalaried,
          onChanged: (int? val) {
            setState(() {
              widget.groupValueSalaried = val!;
            });
          },
        ),
      ],
    );
  }

  Widget checkBoxSourceOfFundsItem(ItemCheck occupationType, int index) {
    return Row(
      children: [
        Text(occupationType.name!),
        Radio(
          value: index,
          groupValue: widget.groupSourceOfFundsSalaried,
          onChanged: (int? val) {
            setState(() {
              widget.groupSourceOfFundsSalaried = val!;
              if (occupationType.name == 'Others') {
                widget.othersSourceOfFunds = true;
              }
              if (occupationType.name != 'Others') {
                widget.othersSourceOfFunds = false;
              }
            });
          },
        ),
      ],
    );
  }

  Widget othersOccupationType() {
    return Visibility(
      visible: widget.othersOccupationType,
      child: Column(
        children: [
          getText('Please Specify'),
          getTextField('Please Specify'),
        ],
      ),
    );
  }

  Widget sourceOfFundsType() {
    return Visibility(
      visible: widget.othersSourceOfFunds,
      child: Column(
        children: [
          getText('Please Specify'),
          getTextField('Please Specify'),
        ],
      ),
    );
  }

  Widget checkBoxSelfEmployedItem(ItemCheck occupationType, int index) {
    return Row(
      children: [
        Text(occupationType.name!),
        Radio(
          value: index,
          groupValue: widget.groupValueSelfEmployed,
          onChanged: (int? val) {
            setState(() {
              widget.groupValueSelfEmployed = val!;
              if (occupationType.name == 'Business') {
                widget.selfBusiness = true;
              }
              if (occupationType.name != 'Business') {
                widget.selfBusiness = false;
              }
              if (occupationType.name == 'Profession') {
                widget.selfProfession = true;
              }
              if (occupationType.name != 'Profession') {
                widget.selfProfession = false;
              }
            });
          },
        ),
      ],
    );
  }

  Widget checkBoxBusinessItem(ItemCheck occupationType, int index) {
    return Row(
      children: [
        Text(occupationType.name!),
        Radio(
          value: index,
          groupValue: widget.groupValueBusiness,
          onChanged: (int? val) {
            setState(
              () {
                widget.groupValueBusiness = val!;
              },
            );
          },
        ),
      ],
    );
  }

  Widget checkBoxProfessionItem(ItemCheck occupationType, int index) {
    return Row(
      children: [
        Text(occupationType.name!),
        Radio(
          value: index,
          groupValue: widget.groupValueProfession,
          onChanged: (int? val) {
            setState(
              () {
                widget.groupValueProfession = val!;
              },
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
        getProfessionCheckBox(),
        othersOccupationType(),
        getText("Gross Annual Income"),
        getTextField('Gross Annual Income'),
        getText("Source of Funds"),
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
                    return checkBoxSourceOfFundsItem(
                        sourceOfFunds[index], index);
                  },
                ),
              ),
            ],
          ),
        ),
        sourceOfFundsType(),
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
                      'Save',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: widget.fontMultiplier * 3,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
