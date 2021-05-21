import 'package:adorae/api/api.dart';
import 'package:adorae/components/colors.dart';
import 'package:adorae/screens/9_create_password_Screen.dart';
import 'package:adorae/services/field_validator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpName extends StatefulWidget {
  @override
  _SignUpNameState createState() => _SignUpNameState();
}

class _SignUpNameState extends State<SignUpName> {
  Validator _validator = Validator();
  final _nameformKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 338.0, top: 15),
            child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 40,
                ),
                onPressed: () {
                  Navigator.of(context)..pop();
                }),
          ),
          SizedBox(height: 70),
          Center(
            child: Text(
              """Looks like you're new
       on Adoare! """,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 24,
              ),
            ),
          ),
          SizedBox(height: 40),
          Form(
            key: _nameformKey,
            child: Column(
              children: [
                name(),
                nextButton(() {
                  var isValid = _nameformKey.currentState.validate();
                  if (isValid) {
                    saveName();
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return SignUpNewPass();
                    }));
                  }
                }),
              ],
            ),
          )
        ],
      ),
    );
  }

  name() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(23.0, 30.0, 23.0, 20.0),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        obscureText: false,
        keyboardType: TextInputType.name,
        validator: _validator.nameValidate,
        controller: _nameController,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.only(top: 22, bottom: 22, left: 15, right: 15),
          hintText: "Name",
          hintStyle: TextStyle(
            color: Colors.grey[500],
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  saveName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', "${_nameController.text}");
  }

  nextButton(Function onTap) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: SizedBox(
        height: 60,
        width: 350,
        child: RaisedButton(
          color: kPrimaryColor,
          onPressed: onTap,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Text(
            "Next",
            style: TextStyle(
                color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
