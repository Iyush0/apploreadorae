import 'package:adorae/components/colors.dart';
import 'package:adorae/screens/7_phone_email_screen.dart';
import 'package:adorae/services/auth_service.dart';
import 'package:adorae/services/facebook_signin.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../login/login_Screen.dart';

class SignUp extends StatefulWidget {
  static const routeName = '/signup-screen';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  AuthServices _authServices = AuthServices();
  FacebookSignIn _facebookSignIn = FacebookSignIn();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: <Widget>[
          Container(
            height: height * 0.3,
            width: width,
            color: kPrimaryColor,
            child: Column(
              children: [
                SizedBox(height: 50),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: ' Welcome ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 24,
                      ),
                      children: [
                        TextSpan(
                          text: ' to ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 24,
                          ),
                        ),
                        TextSpan(
                          text: ' Adorae ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w200,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 27),
                Center(
                  child: Text(
                    "India's Fashion Social Network",
                    style: TextStyle(
                      letterSpacing: 3,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(height: height * 0.03),
              continueInstagram(() {}),
              SizedBox(height: height * 0.02),
              continueFacebook(() {
                _facebookSignIn.signInWithFacebook();
              }),
              SizedBox(height: height * 0.02),
              continueGoogle(() {
                _authServices.googleSignIn(context);
              }),
              SizedBox(height: height * 0.04),
            ],
          ),
          Center(
            child: Text(
              "OR",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: height * 0.03),
          FlatButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return SignUpEmailorPhone();
              }));
            },
            child: Text(
              "Sign up with Phone or Email",
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: height * 0.1),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 19,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Login.routeName);
                },
                child: Text(
                  "Login here",
                  style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 10),
              Text(
                "I agree",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
              ),
              RawMaterialButton(
                onPressed: () {},
                child: Text(
                  "Terms & Conditions",
                  style: TextStyle(color: kPrimaryColor, fontSize: 14),
                ),
              ),
              Text(
                "and",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
              ),
              RawMaterialButton(
                onPressed: () {},
                child: Text(
                  "Privacy Policy",
                  style: TextStyle(color: Color(0xff3AAFA9), fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Text(
                  "of Adorae",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showToast(String msg) {
    // Fluttertoast.showToast(
    //   msg: "$msg",
    //   textColor: Colors.white,
    //   toastLength: Toast.LENGTH_SHORT,
    //   fontSize: 16,
    //   gravity: ToastGravity.BOTTOM,
    //   backgroundColor: Colors.grey[700],
    // );
  }

  // FirebaseAuth auth = FirebaseAuth.instance;
  // final gooleSignIn = GoogleSignIn();

  // googleSignIn() async {
  //   GoogleSignInAccount googleSignInAccount = await gooleSignIn.signIn();
  //   if (googleSignInAccount != null) {
  //     GoogleSignInAuthentication googleSignInAuthentication =
  //         await googleSignInAccount.authentication;
  //     AuthCredential credential = GoogleAuthProvider.getCredential(
  //         idToken: googleSignInAuthentication.idToken,
  //         accessToken: googleSignInAuthentication.accessToken);
  //     AuthResult result = await auth.signInWithCredential(credential);
  //     FirebaseUser user = await auth.currentUser();
  //     print(user.email);

  //     Firestore.instance.collection("USERS").document(user.uid).setData({
  //       "email": user.email,
  //     });

  //     DocumentSnapshot data =
  //         await Firestore.instance.collection("USERS").document(user.uid).get();

  //     if (data.exists) {
  //       showToast("account already exists");
  //       // Navigator.of(context)
  //       //     .pushReplacement(MaterialPageRoute(builder: (context) {
  //       //   return Home();
  //       // }));
  //     } else {
  //       // showToast("Please sign up first");
  //       Navigator.of(context)
  //           .pushReplacement(MaterialPageRoute(builder: (context) {
  //         return SignUp();
  //       }));
  //     }

  //     return Future.value(true);
  //   }
  // }

  Widget continueInstagram(Function onTap) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Container(
        alignment: Alignment.center,
        // height: 150,
        // width: 300,
        child: RaisedButton(
          onPressed: onTap,
          // Navigator.of(context)
          //     .pushReplacement(MaterialPageRoute(builder: (context) {
          //   return HomePage();
          // }));

          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(34.0)),
          padding: EdgeInsets.all(0.0),
          child: Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xff9236A1),
                    Color(0xffFD1D1D),
                    Color(0xffFC8F3C),
                  ],
                ),
                // color: Color(0xff3AAFA9),
                borderRadius: BorderRadius.circular(34.0)),
            child: Container(
              constraints: BoxConstraints(maxWidth: 350.0, maxHeight: 60.0),
              alignment: Alignment.center,
              child: Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  FaIcon(
                    FontAwesomeIcons.instagram,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Continue with Instagram",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget continueFacebook(Function onTap) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Container(
        alignment: Alignment.center,
        child: RaisedButton(
          onPressed: onTap,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(34.0)),
          padding: EdgeInsets.all(0.0),
          child: Ink(
            decoration: BoxDecoration(
                color: Color(0xff6184CD),
                borderRadius: BorderRadius.circular(34.0)),
            child: Container(
              constraints: BoxConstraints(maxWidth: 350.0, maxHeight: 60.0),
              alignment: Alignment.center,
              child: Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Continue with Facebook",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget continueGoogle(Function onPress) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Container(
        alignment: Alignment.center,
        // height: 150,
        // width: 300,
        child: RaisedButton(
          onPressed: onPress,
          // googleSignIn(),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(34.0)),
          padding: EdgeInsets.all(0.0),
          child: Ink(
            decoration: BoxDecoration(
                color: Color(0xffE9E9E9),
                borderRadius: BorderRadius.circular(34.0)),
            child: Container(
              constraints: BoxConstraints(maxWidth: 350.0, maxHeight: 60.0),
              alignment: Alignment.center,
              child: Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Continue with Google",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 21,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
