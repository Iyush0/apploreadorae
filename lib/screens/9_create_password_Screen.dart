import 'package:adorae/api/api.dart';
import 'package:adorae/components/colors.dart';
import 'package:adorae/screens/10_age_gender_screen.dart';
import 'package:adorae/services/field_validator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpNewPass extends StatefulWidget {
  @override
  _SignUpNewPassState createState() => _SignUpNewPassState();
}

class _SignUpNewPassState extends State<SignUpNewPass> {
  Validator _validator = Validator();
  final _passformKey = GlobalKey<FormState>();
  final _passController = TextEditingController();

  bool _obscurePass = true;
  var _userPass = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
              "Create new password",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 24,
              ),
            ),
          ),
          SizedBox(height: 40),
          password(),
          nextButton(() {
            var isValid = _passformKey.currentState.validate();
            if (isValid) {
              savePass();
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return SignUpAgeGender();
              }));
            }
          }),
        ],
      ),
    );
  }

  void _togglePass() {
    setState(() {
      _obscurePass = !_obscurePass;
    });
  }

  Widget password() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(23.0, 30.0, 23.0, 0.0),
      child: Form(
        key: _passformKey,
        child: TextFormField(
          obscureText: _obscurePass,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          validator: _validator.passwordValidate,
          onSaved: (value) {
            _userPass = value;
          },
          controller: _passController,
          decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: _togglePass,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 17.0, 0.0),
                child: IconButton(
                    onPressed: () {},
                    icon: _obscurePass
                        ? Icon(Icons.remove_red_eye)
                        : Icon(Icons.remove_red_eye_outlined)),
              ),
            ),
            contentPadding:
                EdgeInsets.only(top: 22, bottom: 22, left: 15, right: 15),
            hintText: "Password",
            hintStyle: TextStyle(
              color: Colors.grey[500],
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }

  savePass() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('password', "${_passController.text}");
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
  // Widget nextButton() {
  //   return Padding(
  //     padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 20.0),
  //     child: Container(
  //       alignment: Alignment.center,
  //       // height: 150,
  //       // width: 300,
  //       child: RaisedButton(
  //         onPressed: () {
  //           if (_passformKey.currentState.validate()) {
  //             Navigator.of(context)
  //                 .pushReplacement(MaterialPageRoute(builder: (context) {
  //               return SignUpAgeGender();
  //             }));
  //           }
  //         },
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(34.0)),
  //         padding: EdgeInsets.all(0.0),
  //         child: Ink(
  //           decoration: BoxDecoration(
  //               color: Color(0xff3AAFA9),
  //               borderRadius: BorderRadius.circular(34.0)),
  //           child: Container(
  //             constraints: BoxConstraints(maxWidth: 310.0, maxHeight: 60.0),
  //             alignment: Alignment.center,
  //             child: Text(
  //               "Next",
  //               textAlign: TextAlign.center,
  //               style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 21,
  //                   fontWeight: FontWeight.w900),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
