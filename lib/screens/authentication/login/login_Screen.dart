import 'dart:io';

import 'package:adorae/api/api.dart';
import 'package:adorae/screens/homepage.dart';
import 'package:adorae/screens/instgram.dart';
import 'package:adorae/screens/login_presenter.dart';
import 'package:adorae/services/auth_service.dart';

import 'package:adorae/services/facebook_signin.dart';
import 'package:adorae/screens/4_forgor_password_Screen.dart.dart';
import 'package:adorae/services/field_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toast/toast.dart';

import '../../home_screen.dart';
import '../signup/signup_Screen.dart';
import 'local widget/facebook_buton.dart';
import 'local widget/google_button.dart';
import 'local widget/instagram_button.dart';
import 'local widget/login_button.dart';
// import "com.facebook.FacebookSdk";
// import "com.facebook.appevents.AppEventsLogger";

class Login extends StatefulWidget {
  static const routeName = '/login-page';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Validator _validator = Validator();
  FacebookSignIn _facebookSignIn = FacebookSignIn();
  AuthServices _authServices = AuthServices();
  // final _loginformKey = GlobalKey<FormState>();
  // final _passformKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passController = TextEditingController();
  bool _obscurePass = true;
  LoginPresenter _presenter;

  Token token;
  bool _isLogin = true;
  String _userEmail = '';
  String _username = '';
  String _userPassword = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double fontsizetitle = height * 0.03;
    double fontsizeadorae = height * 0.035;
    double fontsizedes = height * 0.02;
    double fontsizeforgotpass = height * 0.02;
    double fontsizebuttons = height * 0.02;
    double fontsizetext = height * 0.015;

    double leftpadding = width * 0.09;
    double rightpadding = width * 0.09;
    // String emailValidate =
    //     Validator.emailValidate(_loginController.text.trim());
    // String passValidate = Validator.emailValidate(_passController.text.trim());
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: <Widget>[
            SizedBox(height: height * 0.02),
            Center(
              child: RichText(
                text: TextSpan(
                  text: ' Welcome ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: fontsizetitle,
                  ),
                  children: [
                    TextSpan(
                      text: ' to ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: fontsizetitle,
                      ),
                    ),
                    TextSpan(
                      text: ' Adorae ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: fontsizeadorae,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.017),
            Center(
              child: Text(
                "India's Fashion Social Network",
                style: TextStyle(
                  letterSpacing: 3,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: fontsizedes,
                ),
              ),
            ),

            Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: height * 0.05),
                    emailOrNumber(),
                    SizedBox(height: height * 0.05),
                    password(),
                    SizedBox(height: height * 0.02),
                  ],
                )),

            FlatButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ForgotPassword();
                }));
              },
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: fontsizeforgotpass),
              ),
            ),
            // SizedBox(height: 15),
            SizedBox(height: height * 0.02),
            LoginButton(onTap: () {
              if (_formKey.currentState.validate()) {
                setState(() {
                  PostApi().postLogin(
                      _loginController.text, _passController.text, context);
                });
              } else {
                showToast("Login failed");
              }
            }
                // _onLogin,
                ),
            SizedBox(height: height * 0.02),
            Center(
              child: Text(
                "OR",
                style: TextStyle(fontSize: fontsizeforgotpass),
              ),
            ),
            SizedBox(height: height * 0.02),
            InstagramButton(onTap: () {
              print('up');
              _presenter.performLogin();
              print('down');
            }),
            SizedBox(height: height * 0.01),
            FacebookButton(onTap: () {
              _facebookSignIn.signInWithFacebook();
            }),
            SizedBox(height: height * 0.01),
            GoogleButton(onTap: () => _authServices.googleSignIn(context)),
            SizedBox(height: height * 0.026),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: fontsizeforgotpass,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: RawMaterialButton(
                    constraints: BoxConstraints(),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return SignUp();
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Text(
                        "Sign Up here",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: fontsizetitle,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(width: 30),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text(
                    "I agree",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: fontsizetext,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: RawMaterialButton(
                    onPressed: () {},
                    child: Text(
                      "Terms & Conditions",
                      style: TextStyle(
                          color: Color(0xff3AAFA9), fontSize: fontsizebuttons),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text(
                    "and",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: fontsizetext,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: RawMaterialButton(
                    onPressed: () {},
                    child: Text(
                      "Privacy Policy",
                      style: TextStyle(
                          color: Color(0xff3AAFA9), fontSize: fontsizebuttons),
                    ),
                  ),
                ),
                Text(
                  "of Adorae",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: fontsizetext,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  emailOrNumber() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        validator:
            // (val) {
            //   if (val.isEmpty) {
            //     return "empty";
            //   } else {
            //     return null;
            //   }
            // },
            _validator.emailValidate,
        onSaved: (value) {
          _userEmail = value;
        },
        controller: _loginController,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.email_outlined),
          labelText: "Email/Username/Phone Number",
          labelStyle: TextStyle(color: Colors.grey[500], fontSize: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  void _togglePass() {
    setState(() {
      _obscurePass = !_obscurePass;
    });
  }

  password() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
        maxLines: 1,
        obscureText: _obscurePass,
        textInputAction: TextInputAction.next,
        validator: _validator.passwordValidate,
        onSaved: (value) {
          _userPassword = value;
        },
        controller: _passController,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock_open),
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
          labelText: "Password",
          labelStyle: TextStyle(
            color: Colors.grey[500],
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  _onLogin() async {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      setState(() {
        isLoading = true;
      });
      _formKey.currentState.save();
      print(_userEmail);
      print(_userPassword);
      try {
        AuthResult loginUser = await _authServices.loginWithEmailandPassword(
            _userEmail, _userPassword);
        if (loginUser != null) {
          print('inside try block');
          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
        } else {
          setState(() {
            isLoading = false;
          });
        }
      } on PlatformException catch (error) {
        print(error);
        print('New Error');

        var errorMessage = 'Authentication error';
        if (error.message == 'EMAIL_EXISTS') {
          errorMessage = 'This email address is already in use';
          showToast(errorMessage);
        } else if (error.message == 'INVALID_EMAIL') {
          errorMessage = 'This is not a valid email address';
          showToast(errorMessage);
        } else if (error.message == 'WEAK_PASSWORD') {
          errorMessage = 'This password is too weak.';
          showToast(errorMessage);
        } else if (error.message == 'ERROR_USER_NOT_FOUND') {
          errorMessage = 'Could not find a user with that email';
          showToast(errorMessage);
        } else if (error.message == 'INVALID_PASSWORD') {
          errorMessage = 'Invalid Password';
          showToast(errorMessage);
        }
      }
    }
  }
}

// void _onSignUp() async {
//   final isValid = _formKey.currentState.validate();
//   FocusScope.of(context).unfocus();
//   if (isValid) {
//     setState(() {
//       isLoading = true;
//     });
//     _formKey.currentState.save();

//     try {
//       User signupUser = await _authServices.signUpWithEmailandPassword(
//         _userEmail,
//         _userPassword,
//         _username,
//       );
//       if (signupUser != null) {
//         setState(() {
//           isLoading = false;
//         });
//         Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
//       } else {
//         setState(() {
//           isLoading = false;
//         });
//         print('Error during SignUp');
//       }
//     } on HttpException catch (error) {
//       var errorMessage = 'Authentication error';
//       if (error.toString().contains('EMAIL_EXISTS')) {
//         errorMessage = 'This email address is already in use';
//       } else if (error.toString().contains('INVALID_EMAIL')) {
//         errorMessage = 'This is not a valid email address';
//       } else if (error.toString().contains('WEAK_PASSWORD')) {
//         errorMessage = 'This password is too weak.';
//       } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
//         errorMessage = 'Could not find a user with that email';
//       } else if (error.toString().contains('INVALID_PASSWORD')) {
//         errorMessage = 'Invalid Password';
//       }
//       _errorDialog(errorMessage);
//     } catch (error) {
//       var errorMessage =
//           'Could not authenticate you. Please try again later.';
//       _errorDialog(errorMessage);
//     }
//   }
// }

void showToast(String msg) {
  Fluttertoast.showToast(
    msg: "$msg",
    textColor: Colors.white,
    // toastLength: Toast.LENGTH_SHORT,
    fontSize: 16,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.grey[700],
  );
}
