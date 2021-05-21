import 'package:adorae/screens/authentication/signup/signup_Screen.dart';
import 'package:adorae/screens/home_screen.dart';
import 'package:adorae/screens/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:google_sign_in/google_sign_in.dart';

AuthResult authResult;

class AuthServices {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  Firestore _firestore = Firestore.instance;

  Future<AuthResult> loginWithEmailandPassword(
      String email, String password) async {
    try {
      AuthResult _authResult = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      authResult = _authResult;
      print('sjfnfndf');
      print(authResult);
      return authResult;
      // FirebaseUser userCredential = await _firebaseAuth
      //     .signInWithEmailAndPassword(email: email, password: password);
      // user = userCredential.user;
      // print(user);
      // return user;
    } on PlatformException catch (error) {
      print(error);
      showToast(error.message);

      print('Error inside loginwithemailpassword');

      throw error.message;
    }
  }

  Future<AuthResult> signUpWithEmailandPassword(
      String email, String password, String userName) async {
    try {
      AuthResult _authResult = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      // await _firebaseAuth.currentUser.updateProfile(displayName: userName);
      // AuthResult = _authResult.user;
      FirebaseUser user = await _firebaseAuth.currentUser.call();

      await _firestore.collection('users').document(user.uid).setData(
        {
          'displayName': userName,
          'email': email,
        },
      );
      return authResult;
    } on PlatformException catch (error) {
      print(error);

      throw error.message;
    }
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  final gooleSignIn = GoogleSignIn();

  googleSignIn(context) async {
    GoogleSignInAccount googleSignInAccount = await gooleSignIn.signIn();
    if (googleSignInAccount != null) {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      AuthResult result = await auth.signInWithCredential(credential);
      FirebaseUser user = await auth.currentUser();
      print(user.email);

       Firestore.instance.collection("USERS").document(user.uid).setData({
         "email": user.email,
       });

      DocumentSnapshot data =
          await Firestore.instance.collection("USERS").document(user.uid).get();

      if (data.exists) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }));
      } else {
        Firestore.instance.collection("USERS").document(user.uid).setData({
          "email": user.email,
        });
        showToast("Please sign up first");
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return SignUp();
        }));
        // Navigator.of(context)
        //     .pushReplacement(MaterialPageRoute(builder: (context) {
        //   return SignUp();
        // }));
      }

      return Future.value(true);
    }
  }

  // Future<void> googleSignIn(context) async {
  //   GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
  //   if (googleSignInAccount != null) {
  //     GoogleSignInAuthentication googleSignInAuthentication =
  //         await googleSignInAccount.authentication;
  //     AuthCredential credential = GoogleAuthProvider.getCredential(
  //         idToken: googleSignInAuthentication.idToken,
  //         accessToken: googleSignInAuthentication.accessToken);
  //     AuthResult result = await _firebaseAuth.signInWithCredential(credential);
  //     FirebaseUser user = await _firebaseAuth.currentUser();
  //     print(user.email);

  //     Firestore.instance.collection("USERS").document(user.uid).setData({
  //       "email": user.email,
  //     });

  //     DocumentSnapshot data =
  //         await Firestore.instance.collection("USERS").document(user.uid).get();

  //     if (data.exists) {
  //       Navigator.of(context)
  //           .pushReplacement(MaterialPageRoute(builder: (context) {
  //         return HomeScreen();
  //       }));
  //     } else {
  //       Fluttertoast.showToast(msg: "Please sign up first");
  //       Navigator.of(context)
  //           .pushReplacement(MaterialPageRoute(builder: (context) {
  //         return SignUp();
  //       }));
  //     }

  //     return Future.value(true);
  //   }
  // }

  Future<bool> signOutUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();

    if (user.providerData[1].providerId == 'google.com') {
      await _googleSignIn.signOut();
    }

    await _firebaseAuth.signOut();
    return Future.value(true);
  }

  void showToast(String msg) {
    Fluttertoast.showToast(
      msg: "$msg",
      textColor: Colors.white,
      // toastLength: Toast.LENGTH_SHORT,
      fontSize: 16,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey[700],
    );
    //   try {
    //     GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    //     GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    //     AuthCredential credential = GoogleAuthProvider.getCredential(
    //       accessToken: googleAuth.accessToken,
    //       idToken: googleAuth.idToken,
    //     );
    //     AuthResult authResult =
    //         await _firebaseAuth.signInWithCredential(credential);
    //     AuthResult user = authResult;
    //     return user;
    //   } on PlatformException catch (error) {
    //     print(error);
    //     print('Inside Google SignIn');
    //     throw error.message;
    //   }
    // }
  }
}
