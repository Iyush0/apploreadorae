 //import 'package:adorae/screens/homepage.dart';
//import 'package:adorae/screens/home_screen.dart';
 //import 'package:adorae/services/forgot-password.dart';
// import 'package:adorae/widgets/home.dart';
//// import 'package:adorae/auth/sign-up.dart';
 //import 'package:cloud_firestore/cloud_firestore.dart';
/* import 'package:firebase_auth/firebase_auth.dart';
 import 'package:flutter/material.dart';

 import 'package:font_awesome_flutter/font_awesome_flutter.dart';
 import 'package:google_sign_in/google_sign_in.dart';

 import 'instgram.dart';
 import 'login_presenter.dart';
  import "com.facebook.FacebookSdk";
  import "com.facebook.appevents.AppEventsLogger";*/

 /*class Login extends StatefulWidget {
   static const routeName = '/login-page';
  @override
   _LoginState createState() => _LoginState();
}*/

 /*class _LoginState extends State<Login> {
   final _loginformKey = GlobalKey<FormState>();
   final _loginController = TextEditingController();
   final _passformKey = GlobalKey<FormState>();
   final _passController = TextEditingController();
   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

   bool _obscurePass = true;
   LoginPresenter _presenter;
   bool _IsLoading;
   Token token;

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
//                       ),
//                     ),
//                     TextSpan(
//                       text: ' Adorae ',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w300,
//                         fontSize: fontsizeadorae,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: height * 0.017),
//             Center(
//               child: Text(
//                 "India's Fashion Social Network",
//                 style: TextStyle(
//                   letterSpacing: 3,
//                   color: Colors.black,
//                   fontWeight: FontWeight.w300,
//                   fontSize: fontsizedes,
//                 ),
//               ),
//             ),
//             SizedBox(height: height * 0.05),
//             emailOrNumber(leftpadding, rightpadding),
//             SizedBox(height: height * 0.05),
//             password(leftpadding, rightpadding),
//             SizedBox(height: height * 0.02),
//             FlatButton(
//               onPressed: () {
//                 Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (context) {
//                   return ForgotPassword();
//                 }));
//               },
//               child: Text(
//                 "Forgot Password?",
//                 style: TextStyle(
//                     decoration: TextDecoration.underline,
//                     fontSize: fontsizeforgotpass),
//               ),
//             ),
//             // SizedBox(height: 15),
//             SizedBox(height: height * 0.02),
//             loginButton(),
//             SizedBox(height: height * 0.02),
//             Center(
//               child: Text(
//                 "OR",
//                 style: TextStyle(fontSize: fontsizeforgotpass),
//               ),
//             ),
//             SizedBox(height: height * 0.02),
//             loginInstagram(height, width),
//             SizedBox(height: height * 0.01),
//             loginFacebook(height, width),
//             SizedBox(height: height * 0.01),
//             loginGoogle(height, width),
//             SizedBox(height: height * 0.026),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // SizedBox(width: 60),
//                 Padding(
//                   padding: const EdgeInsets.all(0.0),
//                   child: Text(
//                     "Don't have an account? ",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.w300,
//                       fontSize: fontsizeforgotpass,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(0.0),
//                   child: RawMaterialButton(
//                     constraints: BoxConstraints(),
//                     onPressed: () {
//                       Navigator.of(context)
//                           .push(MaterialPageRoute(builder: (context) {
//                         return SignUp();
//                       }));
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.all(0.0),
//                       child: Text(
//                         "Sign Up here",
//                         style: TextStyle(
//                             decoration: TextDecoration.underline,
//                             fontSize: fontsizetitle,
//                             fontWeight: FontWeight.w600),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // SizedBox(width: 30),
//                 Padding(
//                   padding: const EdgeInsets.all(0.0),
//                   child: Text(
//                     "I agree",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.w300,
//                       fontSize: fontsizetext,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(0.0),
//                   child: RawMaterialButton(
//                     onPressed: () {},
//                     child: Text(
//                       "Terms & Conditions",
//                       style: TextStyle(
//                           color: Color(0xff3AAFA9), fontSize: fontsizebuttons),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(0.0),
//                   child: Text(
//                     "and",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.w300,
//                       fontSize: fontsizetext,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(0.0),
//                   child: RawMaterialButton(
//                     onPressed: () {},
//                     child: Text(
//                       "Privacy Policy",
//                       style: TextStyle(
//                           color: Color(0xff3AAFA9), fontSize: fontsizebuttons),
//                     ),
//                   ),
//                 ),
//                 Text(
//                   "of Adorae",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.w300,
//                     fontSize: fontsizetext,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget emailOrNumber(left, right) {
//     return Padding(
//       padding: EdgeInsets.fromLTRB(left, 0.0, right, 0.0),
//       child: Form(
//         key: _loginformKey,
//         child: TextFormField(
//           maxLines: 1,
//           textInputAction: TextInputAction.next,
//           obscureText: false,
//           keyboardType: TextInputType.name,
//           validator: (value) {
//             if (value.isEmpty) {
//               return "required";
//             } else {}
//           },
//           controller: _loginController,
//           decoration: InputDecoration(
//             icon: Icon(
//               Icons.email_outlined,
//               color: Colors.black,
//             ),
//             // fillColor: Colors.grey[200],
//             // filled: true,

//             contentPadding:
//                 EdgeInsets.only(top: 18, bottom: 18, left: 15, right: 16),
//             labelText: "Email/Username/Phone Number",
//             labelStyle: TextStyle(color: Colors.grey[500], fontSize: 15),
//             border: OutlineInputBorder(
//               borderSide:
//                   BorderSide(width: 14.0, color: Colors.lightBlue.shade50),
//               borderRadius: BorderRadius.circular(29.0),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _togglePass() {
//     setState(() {
//       _obscurePass = !_obscurePass;
//     });
//   }

//   Widget password(left, right) {
//     return Padding(
//       padding: EdgeInsets.fromLTRB(left, 0.0, right, 0.0),
//       child: Form(
//         key: _passformKey,
//         child: TextFormField(
//           maxLines: 1,
//           obscureText: _obscurePass,
//           textInputAction: TextInputAction.next,
//           keyboardType: TextInputType.name,
//           validator: (value) {
//             if (value.isEmpty) {
//               return "required";
//             } else {}
//           },
//           controller: _passController,
//           decoration: InputDecoration(
//             suffixIcon: InkWell(
//               onTap: _togglePass,
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(0.0, 0.0, 17.0, 0.0),
//                 child: IconButton(
//                     onPressed: () {},
//                     icon: _obscurePass
//                         ? Icon(Icons.remove_red_eye)
//                         : Icon(Icons.remove_red_eye_outlined)),
//               ),
//             ),
//             icon: Icon(
//               Icons.lock_open,
//               color: Colors.black,
//             ),
//             // fillColor: Colors.grey[200],
//             // filled: true,

//             contentPadding:
//                 EdgeInsets.only(top: 18, bottom: 18, left: 15, right: 15),
//             labelText: "Password",
//             labelStyle: TextStyle(
//               color: Colors.grey[500],
//             ),
//             border: OutlineInputBorder(
//               borderSide:
//                   BorderSide(width: 16.0, color: Colors.lightBlue.shade50),
//               borderRadius: BorderRadius.circular(29.0),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget loginButton() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
//       child: Container(
//         alignment: Alignment.center,
//         // height: 150,
//         // width: 300,
//         child: RaisedButton(
//           onPressed: () {
//             Navigator.of(context).pushNamed(HomePage.routeName);
//           },
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(34.0)),
//           padding: EdgeInsets.all(0.0),
//           child: Ink(
//             decoration: BoxDecoration(
//                 color: Color(0xff3AAFA9),
//                 borderRadius: BorderRadius.circular(34.0)),
//             child: Container(
//               constraints: BoxConstraints(maxWidth: 280.0, maxHeight: 50.0),
//               alignment: Alignment.center,
//               child: Text(
//                 "Login",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 21,
//                     fontWeight: FontWeight.w900),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget loginInstagram(height, width) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
//       child: Container(
//         alignment: Alignment.center,
//         // height: 150,
//         // width: 300,
//         child: RaisedButton(
//           onPressed: () {
//             _presenter.perform_login();
//             // Navigator.of(context)
//             //     .pushReplacement(MaterialPageRoute(builder: (context) {
//             //   return HomePage();
//             // }));
//           },
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(34.0)),
//           padding: EdgeInsets.all(0.0),
//           child: Ink(
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topRight,
//                   end: Alignment.bottomLeft,
//                   colors: [
//                     Color(0xff9236A1),
//                     Color(0xffFD1D1D),
//                     Color(0xffFC8F3C),
//                   ],
//                 ),
//                 // color: Color(0xff3AAFA9),
//                 borderRadius: BorderRadius.circular(34.0)),
//             child: Container(
//               constraints: BoxConstraints(maxWidth: 280.0, maxHeight: 50.0),
//               alignment: Alignment.center,
//               child: Row(
//                 children: [
//                   SizedBox(
//                     width: width * 0.05,
//                   ),
//                   FaIcon(
//                     FontAwesomeIcons.instagram,
//                     color: Colors.white,
//                   ),
//                   SizedBox(
//                     width: width * 0.05,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(right: width * 0.02),
//                     child: Text(
//                       "Login with Instagram",
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: height * 0.025,
//                           fontWeight: FontWeight.w900),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget loginFacebook(height, width) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
//       child: Container(
//         alignment: Alignment.center,
//         // height: 150,
//         // width: 300,
//         child: RaisedButton(
//           onPressed: () {
//             // Navigator.of(context)
//             //     .pushReplacement(MaterialPageRoute(builder: (context) {
//             //   return HomePage();
//             // }));
//           },
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(34.0)),
//           padding: EdgeInsets.all(0.0),
//           child: Ink(
//             decoration: BoxDecoration(
//                 // gradient: LinearGradient(
//                 //   begin: Alignment.topRight,
//                 //   end: Alignment.bottomLeft,
//                 //   colors: [
//                 //     Color(0xff9236A1),
//                 //     Color(0xffFD1D1D),
//                 // Color(0xffFC8F3C),
//                 // ],
//                 // ),
//                 color: Color(0xff6184CD),
//                 borderRadius: BorderRadius.circular(34.0)),
//             child: Container(
//               constraints: BoxConstraints(maxWidth: 280.0, maxHeight: 50.0),
//               alignment: Alignment.center,
//               child: Row(
//                 children: [
//                   SizedBox(
//                     width: width * 0.05,
//                   ),
//                   FaIcon(
//                     FontAwesomeIcons.facebook,
//                     color: Colors.white,
//                   ),
//                   SizedBox(
//                     width: width * 0.05,
//                   ),
//                   Text(
//                     "Login with Facebook",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: height * 0.025,
//                         fontWeight: FontWeight.w900),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget loginGoogle(height, width) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
//       child: Container(
//         alignment: Alignment.center,
//         // height: 150,
//         // width: 300,
//         child: RaisedButton(
//           onPressed: () => googleSignIn(),
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(34.0)),
//           padding: EdgeInsets.all(0.0),
//           child: Ink(
//             decoration: BoxDecoration(
//                 // gradient: LinearGradient(
//                 //   begin: Alignment.topRight,
//                 //   end: Alignment.bottomLeft,
//                 //   colors: [
//                 //     Color(0xff9236A1),
//                 //     Color(0xffFD1D1D),
//                 // Color(0xffFC8F3C),
//                 // ],
//                 // ),
//                 color: Color(0xffE9E9E9),
//                 borderRadius: BorderRadius.circular(34.0)),
//             child: Container(
//               constraints: BoxConstraints(maxWidth: 280.0, maxHeight: 50.0),
//               alignment: Alignment.center,
//               child: Row(
//                 children: [
//                   SizedBox(
//                     width: width * 0.05,
//                   ),
//                   FaIcon(
//                     FontAwesomeIcons.google,
//                     color: Colors.green,
//                   ),
//                   SizedBox(
//                     width: width * 0.05,
//                   ),
//                   Text(
//                     "Login with Google",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: height * 0.025,
//                         fontWeight: FontWeight.w900),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void showToast(String msg) {
//     // Fluttertoast.showToast(
//     //   msg: "$msg",
//     //   textColor: Colors.white,
//     //   toastLength: Toast.LENGTH_SHORT,
//     //   fontSize: 16,
//     //   gravity: ToastGravity.BOTTOM,
//     //   backgroundColor: Colors.grey[700],
//     // );
//   }

//   FirebaseAuth auth = FirebaseAuth.instance;
//   final gooleSignIn = GoogleSignIn();

//   googleSignIn() async {
//     GoogleSignInAccount googleSignInAccount = await gooleSignIn.signIn();
//     if (googleSignInAccount != null) {
//       GoogleSignInAuthentication googleSignInAuthentication =
//           await googleSignInAccount.authentication;
//       AuthCredential credential = GoogleAuthProvider.getCredential(
//           idToken: googleSignInAuthentication.idToken,
//           accessToken: googleSignInAuthentication.accessToken);
//       AuthResult result = await auth.signInWithCredential(credential);
//       FirebaseUser user = await auth.currentUser();
//       print(user.email);

//       Firestore.instance.collection("USERS").document(user.uid).setData({
//         "email": user.email,
//       });

//       DocumentSnapshot data =
//           await Firestore.instance.collection("USERS").document(user.uid).get();

//       if (data.exists) {
//         Navigator.of(context)
//             .pushReplacement(MaterialPageRoute(builder: (context) {
//           return HomePage();
//         }));
//       } else {
//         showToast("Please sign up first");
//         // Navigator.of(context)
//         //     .pushReplacement(MaterialPageRoute(builder: (context) {
//         //   return SignUp();
//         // }));
//       }

//       return Future.value(true);
//     }
//   }
//   // Entry point action to User Authentication

//   // Widget authAction(BuildContext context) {
//   //   return FutureBuilder(
//   //       future: googleSignIn(context),
//   //       initialData: {},
//   //       builder: (BuildContext context, AsyncSnapshot snapshot) {
//   //         return snapshot.data ? checkUserWidget() : SizedBox();
//   //       });
//   // }

//   // void getDetails() async {
//   //   final firestoreInstance = Firestore.instance;
//   //   var firebaseUser = await FirebaseAuth.instance.currentUser();

//   // }

//   // void navigateToUserDetails() {}

//   Future<bool> signOutUser() async {
//     FirebaseUser user = await auth.currentUser();

//     if (user.providerData[1].providerId == 'google.com') {
//       await gooleSignIn.signOut();
//     }

//     await auth.signOut();
//     return Future.value(true);
//   }
// }
*/