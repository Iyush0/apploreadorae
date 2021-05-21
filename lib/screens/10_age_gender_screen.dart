import 'package:adorae/api/api.dart';
import 'package:adorae/components/colors.dart';
import 'package:adorae/screens/11_create_username_screen.dart';
import 'package:adorae/services/field_validator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpAgeGender extends StatefulWidget {
  @override
  _SignUpAgeGenderState createState() => _SignUpAgeGenderState();
}

class _SignUpAgeGenderState extends State<SignUpAgeGender> {
  final _formKey = GlobalKey<FormState>();
  // final _ageformKey = GlobalKey<FormState>();
  // final _genderformKey = GlobalKey<FormState>();
  Validator _validator = Validator();
  final _ageController = TextEditingController();
  final _genderController = TextEditingController();
  var _selectedgender;
  var _inputAge = '';

  List<String> _gender = <String>[
    'female',
    'male',
    'others',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
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
                    "Add your age & gender",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                age(),
                gender(),
                nextButton(() {
                  var isValid = _formKey.currentState.validate();
                  if (isValid) {
                    saveAge();
                    saveGender();
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return SignUpUsername();
                    }));
                  }
                }),
                SizedBox(height: 40),
                Text(
                  "Don't worry age won't be a part of your public profile",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget age() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(23.0, 30.0, 23.0, 20.0),
      child: TextFormField(
        maxLines: 1,
        textInputAction: TextInputAction.next,
        obscureText: false,
        keyboardType: TextInputType.number,
        validator: _validator.ageValidate,
        onSaved: (value) {
          _inputAge = value;
        },
        controller: _ageController,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.only(top: 22, bottom: 22, left: 15, right: 15),
          hintText: "Age",
          hintStyle: TextStyle(
            color: Colors.grey[500],
          ),
          border: OutlineInputBorder(
            // borderSide:
            //     BorderSide(width: 16.0, color: Colors.lightBlue.shade50),
            borderRadius: BorderRadius.circular(29.0),
          ),
        ),
      ),
    );
  }

  Widget gender() {
    return Container(
      margin: EdgeInsets.fromLTRB(23.0, 0.0, 23.0, 0.0),
      decoration: BoxDecoration(
        // color: Colors.black,
        border: Border.all(
          color: Colors.grey[500],
        ),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      padding: const EdgeInsets.fromLTRB(23.0, 5.0, 23.0, 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                // underline: ,
                items: _gender
                    .map((value) => DropdownMenuItem(
                          child: Text(
                            value,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey[700]),
                          ),
                          value: value,
                        ))
                    .toList(),
                onChanged: (selectedgender) {
                  setState(() {
                    _selectedgender = selectedgender;
                  });
                },

                value: _selectedgender,
                hint: Text(
                  "Gender",
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                elevation: 0,
                isExpanded: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  saveAge() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('age', "${_ageController.text}");
  }

  saveGender() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('gender', "$_selectedgender");
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
  //           if (_formKey.currentState.validate() &&
  //               _formKey.currentState.validate()) {
  //             Navigator.of(context)
  //                 .pushReplacement(MaterialPageRoute(builder: (context) {
  //               return SignUpUsername();
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
