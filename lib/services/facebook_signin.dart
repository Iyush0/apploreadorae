import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FacebookSignIn {
  FirebaseAuth auth = FirebaseAuth.instance;
  final FacebookLogin _fbLogin = FacebookLogin();

  Future<void> signInWithFacebook() async {
    try {
      final facebookLoginResult =
          await _fbLogin.logInWithReadPermissions(["email", "public_profile"]);
      FacebookLoginStatus status = facebookLoginResult.status;
      print(facebookLoginResult.toString());
      switch (status) {
        case FacebookLoginStatus.loggedIn:
          AuthCredential credential = FacebookAuthProvider.getCredential(
              accessToken: facebookLoginResult.accessToken.token);

          Fluttertoast.showToast(
              msg: "Please Wait... Don\'t Press Back Button",
              timeInSecForIosWeb: 10);
          await auth.signInWithCredential(credential).then((result) async {
            print(result.toString());
            // await _reusableFunctions.createUserInFirestore();
          });
          // .catchError((error) async {
          //   FirebaseAuthException e = error;

          //   if (e.code == "account-exists-with-different-credential") {
          //     Fluttertoast.showToast(
          //         msg: "Linking your account with facebook",
          //         timeInSecForIosWeb: 10);
          //     await onEmailExistsWithDifferentCredentials(e);
          //   }
          // });
          break;
        case FacebookLoginStatus.cancelledByUser:
          Fluttertoast.showToast(
              msg: "Facebook Login Cancelled by user", timeInSecForIosWeb: 10);
          break;
        case FacebookLoginStatus.error:
          Fluttertoast.showToast(
              msg: "Facebook Some error occurred ", timeInSecForIosWeb: 10);
          break;
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Catching error ${e.toString()}", timeInSecForIosWeb: 10);
    }
  }

  // onEmailExistsWithDifferentCredentials(error) async {
  //   auth.fetchSignInMethodsForEmail(error.email).then((providers) async {
  //     print("all providers for email $providers");
  //     AuthCredential googleCredential;

  //     googleCredential = await getGoogleSignInCredentials();

  //     if (googleCredential != null) {
  //       auth.signInWithCredential(googleCredential).then((userCred) async {
  //         await userCred.user.linkWithCredential(error.credential);
  //       });
  //     } else {
  //       Fluttertoast.showToast(
  //           msg: "Please Use different login method", timeInSecForIos: 7);
  //     }
  //   });
  // }

  // getGoogleSignInCredentials() async {
  //   final GoogleSignIn _googleSignIn = GoogleSignIn();
  //   final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  //   final GoogleSignInAuthentication googleAuth =
  //   await googleUser.authentication;

  //   final AuthCredential credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );
  //   return credential;
  // }
}
