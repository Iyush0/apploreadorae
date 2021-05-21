import 'dart:ui';

import 'package:adorae/api/api.dart';
import 'package:adorae/widgets/appbar_header_widget.dart';
import 'package:adorae/widgets/custom-appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var imageFile;
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _websiteController = TextEditingController();
  final _bioController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  Future _openCamera(BuildContext context) async {
    var image = await ImagePicker().getImage(source: ImageSource.camera);

    setState(() {
      imageFile = image;
    });
    Navigator.of(context).pop();
  }

  Future _openGallery(BuildContext context) async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      imageFile = image;
    });
    Navigator.of(context).pop();
  }

  Future<void> showChoiceDialogue(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Select one'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text('Camera'),
                    onTap: () {
                      _openCamera(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: Text('Gallery'),
                    onTap: () {
                      _openGallery(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: followAppBar(
      //   "Edit Profile",
      //   context,
      //   action: FlatButton(
      //     onPressed: () {},
      //     child: Text(
      //       "OK",
      //       style:
      //           TextStyle(color: Color(0xff3AAFA9), fontSize: height * 0.025),
      //     ),
      //   ),
      // ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white.withOpacity(1.0),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                AppBarHeader(
                  title: 'Edit Profile',
                  child: TextButton(
                    onPressed: () {
                      if (imageFile == null) {
                        PostApi().postEditProfilewithoutPic(
                            _usernameController, null, _bioController, context);
                      } else {
                        PostApi().postEditProfilewithPic(_usernameController,
                            null, _bioController, imageFile, context);
                      }
                    },
                    child: Text(
                      'Ok',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                // appBar(),
                // SizedBox(
                //   height: height * 0.01,
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 320),
                  child: Container(
                    child: Text(
                      'Public',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: height * 0.023,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/girl.jpeg"),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        bottom: -14,
                        right: 0,
                        left: 0,
                        height: height * 0.03,
                        child: GestureDetector(
                          onTap: () {
                            showChoiceDialogue(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(60.0)),
                            ),
                            child: SvgPicture.asset(
                              "assets/Group 1498.svg",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  radius: 52.0,
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                textFields(
                    'Michael G Gutierres', _nameController, height, width),
                SizedBox(
                  height: height * 0.014,
                ),
                textFields('michgutier', _usernameController, height, width),
                SizedBox(
                  height: height * 0.014,
                ),
                textFields('Website', _websiteController, height, width),
                SizedBox(
                  height: height * 0.014,
                ),
                textFields('Hey', _bioController, height, width),
                SizedBox(
                  height: height * 0.03,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text(
                      'Private',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.023,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                textFields(
                    'michae@dummymail.com', _emailController, height, width),
                SizedBox(
                  height: height * 0.014,
                ),
                textFields(
                    'Phone Number', _phoneNumberController, height, width),
                SizedBox(
                  height: height * 0.022,
                ),
                RawMaterialButton(
                  onPressed: () {
                    showdeleteDialog(height, width);
                  },
                  child: Text(
                    "Delete Account",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.02,
                        color: Colors.black,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textFields(
      String text, TextEditingController _controller, height, width) {
    return TextFormField(
      maxLines: 1,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value.isEmpty) {
          return "required";
        } else {
          return null;
        }
      },
      controller: _controller,
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.fromLTRB(width * 0.04, 0, 0.0, height * 0.01),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: width * 0.016, color: Colors.grey),
            borderRadius: BorderRadius.circular(29.0),
          ),
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: text),
    );
  }

  void showdeleteDialog(height, width) {
    showGeneralDialog(
      barrierLabel: "DELETE",
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: height * 0.35,
            width: width * 0.85,
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
              child: Column(
                children: [
                  SizedBox(height: height * 0.025),
                  Center(
                    child: Text(
                      """Do you want to delete this
              account?""",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: height * 0.027,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  SizedBox(height: height * 0.015),
                  Center(
                    child: Text(
                      "You cannot undo this action",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: height * 0.02,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  ListTile(
                    leading: Padding(
                      padding: EdgeInsets.only(left: width * 0.15),
                      child: _checked
                          ? Icon(
                              Icons.check_box_outline_blank,
                              color: Colors.grey[400],
                            )
                          : Icon(
                              Icons.check_box_outlined,
                              color: Color(0xff3AAFA9),
                            ),
                    ),
                    title: GestureDetector(
                      onTap: () {
                        setState(() {
                          _checked = true;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Text(
                          "Permanently Delete",
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: height * 0.017,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  deleteButton(height),
                  cancelButton(height, context),
                ],
              ),
            ),
            margin: EdgeInsets.only(bottom: 240, left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }

  Widget deleteButton(height) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        //   return ReviewContactInfo();
        // }));
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        child: Ink(
          decoration: BoxDecoration(
              color: Color(0xffFEE2E2),
              borderRadius: BorderRadius.circular(34.0)),
          child: Container(
            constraints: BoxConstraints(maxWidth: 150.0, maxHeight: 35.0),
            alignment: Alignment.center,
            child: Text(
              "Delete",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.red,
                  fontSize: height * 0.02,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }

  Widget cancelButton(height, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        //   return ReviewContactInfo();
        // }));
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        child: Ink(
          decoration: BoxDecoration(
              color: Color(0xffF9FAFB),
              borderRadius: BorderRadius.circular(34.0)),
          child: Container(
            constraints: BoxConstraints(maxWidth: 150.0, maxHeight: 35.0),
            alignment: Alignment.center,
            child: Text(
              "Cancel",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: height * 0.02,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
