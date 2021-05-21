import 'package:adorae/services/field_validator.dart';
import 'package:adorae/widgets/button.dart';
import 'package:adorae/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'authentication/login/login_Screen.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  Validator _validator = Validator();
  final _emailformKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  // var emailValid = RegExp(
  //     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  void showToast(String msg) {
    Fluttertoast.showToast(
      msg: "$msg",
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      fontSize: 16,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey[700],
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: <Widget>[
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
          SizedBox(height: height * 0.07),
          Center(
            child: Text(
              ' Forgot Password ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          Center(
            child: Text(
              """Don't worry! Just fill in your email we'll send 
         you a link to reset your password""",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 19,
              ),
            ),
          ),
          SizedBox(height: height * 0.04),
          email(),
          SizedBox(height: height * 0.01),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: CommonButton(
                title: 'Recover Password',
                onTap: () {
                  Navigator.of(context).pushNamed(Login.routeName);
                }),
          ),
        ],
      ),
    );
  }

  Widget email() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(23.0, 0.0, 23.0, 0.0),
      child: Form(
        key: _emailformKey,
        child: TextFormField(
          maxLines: 1,
          textInputAction: TextInputAction.next,
          obscureText: false,
          keyboardType: TextInputType.emailAddress,
          validator: _validator.emailValidate,
          controller: _emailController,
          decoration: InputDecoration(
            icon: Icon(
              Icons.email_outlined,
              color: Colors.black,
            ),
            // fillColor: Colors.grey[200],
            // filled: true,

            contentPadding:
                EdgeInsets.only(top: 22, bottom: 22, left: 15, right: 15),
            labelText: "Email",
            labelStyle: TextStyle(
              color: Colors.grey[500],
            ),
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 16.0, color: Colors.lightBlue.shade50),
              borderRadius: BorderRadius.circular(29.0),
            ),
          ),
        ),
      ),
    );
  }
}
