import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class IDCardDetails extends StatefulWidget {
  IDCardDetails({Key? key}) : super(key: key);

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

  @override
  _IDCardDetailsState createState() => _IDCardDetailsState();
}

class _IDCardDetailsState extends State<IDCardDetails> {
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

  getFromCamera(int index) async {
    widget.pickedFile = (await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1000,
      maxHeight: 1000,
    ));
    setState(() {
      if (index == 1) {
        widget.imageFileAadhaarFront = File(widget.pickedFile!.path);
      } else if (index == 2) {
        widget.imageFileAadhaarRear = File(widget.pickedFile!.path);
      } else if (index == 3) {
        widget.imageFilePanFront = File(widget.pickedFile!.path);
      } else if (index == 4) {
        widget.imageFilePanRear = File(widget.pickedFile!.path);
      } else if (index == 5) {
        widget.imageFileDrivingFront = File(widget.pickedFile!.path);
      } else if (index == 6) {
        widget.imageFileDrivingRear = File(widget.pickedFile!.path);
      } else if (index == 7) {
        widget.imageFilePassportFront = File(widget.pickedFile!.path);
      } else if (index == 8) {
        widget.imageFilePassportRear = File(widget.pickedFile!.path);
      } else if (index == 9) {
        widget.imageFileVoterFront = File(widget.pickedFile!.path);
      } else if (index == 10) {
        widget.imageFileVoterRear = File(widget.pickedFile!.path);
      } else if (index == 11) {
        widget.imageFileFamilyFront = File(widget.pickedFile!.path);
      } else if (index == 12) {
        widget.imageFileFamilyRear = File(widget.pickedFile!.path);
      }
    });
  }

  setImage(int index) {
    if (index == 1) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: widget.imageFileAadhaarFront != null
            ? Image.file(widget.imageFileAadhaarFront!, fit: BoxFit.cover)
            : const Center(child: Text('Choose File')),
      );
    } else if (index == 2) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          child: widget.imageFileAadhaarRear != null
              ? Image.file(widget.imageFileAadhaarRear!, fit: BoxFit.cover)
              : const Center(child: Text('Choose File')),
        ),
      );
    } else if (index == 3) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          child: widget.imageFilePanFront != null
              ? Image.file(widget.imageFilePanFront!, fit: BoxFit.cover)
              : const Center(child: Text('Choose File')),
        ),
      );
    } else if (index == 4) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          child: widget.imageFilePanRear != null
              ? Image.file(widget.imageFilePanRear!, fit: BoxFit.cover)
              : const Center(child: Text('Choose File')),
        ),
      );
    } else if (index == 5) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          child: widget.imageFileDrivingFront != null
              ? Image.file(widget.imageFileDrivingFront!, fit: BoxFit.cover)
              : const Center(child: Text('Choose File')),
        ),
      );
    } else if (index == 6) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          child: widget.imageFileDrivingRear != null
              ? Image.file(widget.imageFileDrivingRear!, fit: BoxFit.cover)
              : const Center(child: Text('Choose File')),
        ),
      );
    } else if (index == 7) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          child: widget.imageFilePassportFront != null
              ? Image.file(widget.imageFilePassportFront!, fit: BoxFit.cover)
              : const Center(child: Text('Choose File')),
        ),
      );
    } else if (index == 8) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          child: widget.imageFilePassportRear != null
              ? Image.file(widget.imageFilePassportRear!, fit: BoxFit.cover)
              : const Center(child: Text('Choose File')),
        ),
      );
    } else if (index == 9) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          child: widget.imageFileVoterFront != null
              ? Image.file(widget.imageFileVoterFront!, fit: BoxFit.cover)
              : const Center(child: Text('Choose File')),
        ),
      );
    } else if (index == 10) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          child: widget.imageFileVoterRear != null
              ? Image.file(widget.imageFileVoterRear!, fit: BoxFit.cover)
              : Center(child: const Text('Choose File')),
        ),
      );
    } else if (index == 11) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          child: widget.imageFileFamilyFront != null
              ? Image.file(widget.imageFileFamilyFront!, fit: BoxFit.cover)
              : const Center(child: Text('Choose File')),
        ),
      );
    } else if (index == 12) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          child: widget.imageFileFamilyRear != null
              ? Image.file(widget.imageFileFamilyRear!, fit: BoxFit.cover)
              : const Center(child: Text('Choose File')),
        ),
      );
    }
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
                margin: EdgeInsets.only(top: 10),
                color: const Color(0xfff2f4f2),
                child: const Center(
                  child: Text(
                    "ID Details",
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
        getText("Aadhaar Card"),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 8, 0, 0),
                height: 51,
                decoration: const BoxDecoration(
                    color: Color(0xfff2f4f2),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0))),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Center(
                      child: Text(
                        "AA",
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: getTextFieldName("Aadhaar Card Number"),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  getText("Aadhaar Card Front Image"),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        getFromCamera(1);
                      },
                      child: Container(
                        height: mHeight * 0.35,
                        decoration: const BoxDecoration(
                            color: Color(0xfff2f4f2),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Center(
                          child: setImage(1),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  getText("Aadhaar Card Rear Image"),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                    child: GestureDetector(
                      onTap: () {
                        getFromCamera(2);
                      },
                      child: Container(
                        height: mHeight * 0.35,
                        decoration: const BoxDecoration(
                            color: Color(0xfff2f4f2),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Center(
                          child: setImage(2),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        getText("Pan Card"),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 8, 0, 0),
                height: 51,
                decoration: const BoxDecoration(
                    color: Color(0xfff2f4f2),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0))),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Center(
                      child: Text(
                        "P",
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: getTextFieldName("Pan Card Number"),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  getText("Pan Card Front Image"),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        getFromCamera(3);
                      },
                      child: Container(
                        height: mHeight * 0.35,
                        decoration: const BoxDecoration(
                            color: Color(0xfff2f4f2),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Center(
                          child: setImage(3),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  getText("Pan Card Rear Image"),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                    child: GestureDetector(
                      onTap: () {
                        getFromCamera(4);
                      },
                      child: Container(
                        height: mHeight * 0.35,
                        decoration: const BoxDecoration(
                            color: Color(0xfff2f4f2),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Center(
                          child: setImage(4),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        getText("Driving Licence"),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 8, 0, 0),
                height: 51,
                decoration: const BoxDecoration(
                    color: Color(0xfff2f4f2),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0))),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Center(
                      child: Text(
                        "D",
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: getTextFieldName("Driving Licence Number"),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Wrap(
                    children: [getText("Driving Licence\nFront Image")],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        getFromCamera(5);
                      },
                      child: Container(
                        height: mHeight * 0.35,
                        decoration: const BoxDecoration(
                            color: Color(0xfff2f4f2),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Center(
                          child: setImage(5),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  getText("Driving Licence \nRear Image"),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                    child: GestureDetector(
                      onTap: () {
                        getFromCamera(6);
                      },
                      child: Container(
                        height: mHeight * 0.35,
                        decoration: const BoxDecoration(
                            color: Color(0xfff2f4f2),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Center(
                          child: setImage(6),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        getText("Passport"),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 8, 0, 0),
                height: 51,
                decoration: const BoxDecoration(
                    color: Color(0xfff2f4f2),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0))),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Center(
                      child: Text(
                        "P",
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: getTextFieldName("Passport Number"),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  getText("Passport Front Image"),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        getFromCamera(7);
                      },
                      child: Container(
                        height: mHeight * 0.35,
                        decoration: const BoxDecoration(
                            color: Color(0xfff2f4f2),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Center(
                          child: setImage(7),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  getText("Passport Rear Image"),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                    child: GestureDetector(
                      onTap: () {
                        getFromCamera(8);
                      },
                      child: Container(
                        height: mHeight * 0.35,
                        decoration: const BoxDecoration(
                            color: Color(0xfff2f4f2),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Center(
                          child: setImage(8),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        getText("Family Card "),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 8, 0, 0),
                height: 51,
                decoration: const BoxDecoration(
                    color: Color(0xfff2f4f2),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0))),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Center(
                      child: Text(
                        "F",
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: getTextFieldName("Family Card Number"),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  getText("Family Card Front Image"),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        getFromCamera(9);
                      },
                      child: Container(
                        height: mHeight * 0.35,
                        decoration: const BoxDecoration(
                            color: Color(0xfff2f4f2),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Center(
                          child: setImage(9),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  getText("Family Card Rear Image"),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                    child: GestureDetector(
                      onTap: () {
                        getFromCamera(10);
                      },
                      child: Container(
                        height: mHeight * 0.35,
                        decoration: const BoxDecoration(
                            color: Color(0xfff2f4f2),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Center(
                          child: setImage(10),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        getText("Voter Card "),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 8, 0, 0),
                height: 51,
                decoration: const BoxDecoration(
                    color: Color(0xfff2f4f2),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0))),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Center(
                      child: Text(
                        "F",
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: getTextFieldName("Voter Card Number"),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  getText("Voter Card Front Image"),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        getFromCamera(11);
                      },
                      child: Container(
                        height: mHeight * 0.35,
                        decoration: const BoxDecoration(
                            color: Color(0xfff2f4f2),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Center(
                          child: setImage(11),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  getText("Voter Card Rear Image"),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                    child: GestureDetector(
                      onTap: () {
                        getFromCamera(12);
                      },
                      child: Container(
                        height: mHeight * 0.35,
                        decoration: const BoxDecoration(
                            color: Color(0xfff2f4f2),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Center(
                          child: setImage(12),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
