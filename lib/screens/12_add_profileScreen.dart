import 'package:adorae/screens/28_add_post_screen.dart';
import 'package:adorae/screens/13_add-to-homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpProfilePhoto extends StatefulWidget {
  @override
  _SignUpProfilePhotoState createState() => _SignUpProfilePhotoState();
}

class _SignUpProfilePhotoState extends State<SignUpProfilePhoto> {
  var imageFile;

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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          SizedBox(height: 70),
          Center(
            child: Text(
              "Add a profile photo",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 24,
              ),
            ),
          ),
          SizedBox(height: 20),
          CircleAvatar(
            child: Positioned(
              bottom: -14,
              right: 0,
              left: 0,
              height: height * 0.03,
              child: GestureDetector(
                onTap: () {
                  showChoiceDialogue(context);
                },
              ),
            ),
            radius: 52.0,
            backgroundColor: Colors.grey[200],
          ),
          SizedBox(height: 230),
          addButton(),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddtoHomeScreen.routeName);
            },
            child: Text(
              "Skip",
              style: TextStyle(
                color: Color(0xff3AAFA9),
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  saveProfilePhoto() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('profile photo', "");
  }

  Widget addButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 20.0),
      child: Container(
        alignment: Alignment.center,
        // height: 150,
        // width: 300,
        child: RaisedButton(
          onPressed: () {
            // if (_usernameformKey.currentState.validate()) {
            //   Navigator.of(context)
            //       .pushReplacement(MaterialPageRoute(builder: (context) {
            //     return SignUpProfilePhoto();
            //   }));
            // }
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(34.0)),
          padding: EdgeInsets.all(0.0),
          child: Ink(
            decoration: BoxDecoration(
                color: Color(0xff3AAFA9),
                borderRadius: BorderRadius.circular(34.0)),
            child: Container(
              constraints: BoxConstraints(maxWidth: 310.0, maxHeight: 60.0),
              alignment: Alignment.center,
              child: Text(
                "Add a photo",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
