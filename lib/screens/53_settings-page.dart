import 'package:adorae/screens/61_about_Screen.dart';
import 'package:adorae/screens/62_account_Screen.dart';
import 'package:adorae/screens/60_help_screen.dart';
import 'package:adorae/widgets/appbar_header_widget.dart';
import 'package:adorae/widgets/custom-appbar.dart';
import 'package:flutter/material.dart';

import 'change-password.dart';
import 'notifs.dart';
import '57_privacy-security.dart';

class SettingPage extends StatefulWidget {
  static const routeName = '/settings';
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: followAppBar("Settings",context),
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: <Widget>[
          AppBarHeader(
            title: 'Settings',
          ),
          SizedBox(height: height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FlatButton(
                onPressed: () {
                  showinviteDialog(height, width);
                },
                child: Text(
                  "Follow and Invite Friends",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: height * 0.02,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Flexible(child: Container()),
              IconButton(
                onPressed: () {
                  showinviteDialog(height, width);
                },
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.black,
                  size: height * 0.02,
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.003),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FlatButton(
                onPressed: () {},
                child: Text(
                  "Your Activity",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: height * 0.02,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Flexible(child: Container()),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.black,
                  size: height * 0.02,
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.003),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return NotifisPage();
                  }));
                },
                child: Text(
                  "Notifications",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: height * 0.02,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Flexible(child: Container()),
              IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return NotifisPage();
                  }));
                },
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.black,
                  size: height * 0.02,
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.003),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ChangePass();
                  }));
                },
                child: Text(
                  "Change Password",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: height * 0.02,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Flexible(child: Container()),
              IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ChangePass();
                  }));
                },
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.black,
                  size: height * 0.02,
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.003),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return PrivacySecurity();
                  }));
                },
                child: Text(
                  "Privacy & Security",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: height * 0.02,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Flexible(child: Container()),
              IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return PrivacySecurity();
                  }));
                },
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.black,
                  size: height * 0.02,
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.003),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FlatButton(
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.only(right: width * 0.068),
                  child: Text(
                    "Ads",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: height * 0.02,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              Flexible(child: Container()),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.black,
                  size: height * 0.02,
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.003),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FlatButton(
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.only(left: width * 0.0),
                  child: Text(
                    "Account",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: height * 0.02,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              Flexible(child: Container()),
              IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return AccountScreen();
                  }));
                },
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.black,
                  size: height * 0.02,
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.003),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FlatButton(
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.only(right: width * 0.041),
                  child: Text(
                    "Help",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: height * 0.02,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              Flexible(child: Container()),
              IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return HelpScreen();
                  }));
                },
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.black,
                  size: height * 0.02,
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.003),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FlatButton(
                onPressed: () {},
                child: Text(
                  "About",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: height * 0.02,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Flexible(child: Container()),
              IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return AboutScreen();
                  }));
                },
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.black,
                  size: height * 0.02,
                ),
              ),
            ],
          ),
          // SizedBox(height: height * 0.01),
          Divider(
            height: height * 0.01,
            color: Colors.grey[400],
          ),
          SizedBox(height: height * 0.005),
          Padding(
            padding: EdgeInsets.only(left: width * 0.045, top: 0.0),
            child: Text(
              "Facebook",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: height * 0.03,
                  color: Colors.black),
            ),
          ),
          SizedBox(height: height * 0.003),
          Padding(
            padding: EdgeInsets.only(left: width * 0.045),
            child: Text(
              "Account Centre",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.5,
                  fontSize: height * 0.019,
                  color: Color(0xff3AAFA9)),
            ),
          ),
          SizedBox(height: height * 0.01),
          Padding(
            padding: EdgeInsets.only(left: width * 0.045, right: width * 0.045),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis imperdiet quam quis lorem convallis tempor. Nam dapibus, purus quis tincidunt iaculis",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.5,
                  fontSize: height * 0.017,
                  color: Colors.grey[400]),
            ),
          ),
          SizedBox(height: height * 0.005),
          Divider(
            height: height * 0.02,
            color: Colors.grey[400],
          ),
          SizedBox(height: height * 0.005),
          Padding(
            padding: EdgeInsets.only(left: width * 0.045, top: 0.0),
            child: Text(
              "Logins",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: height * 0.03,
                  color: Colors.black),
            ),
          ),
          SizedBox(height: height * 0.01),
          Padding(
            padding: EdgeInsets.only(left: width * 0.045),
            child: Text(
              "Add Accounts",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.5,
                  fontSize: height * 0.02,
                  color: Color(0xff3AAFA9)),
            ),
          ),
          SizedBox(height: height * 0.005),
          Padding(
            padding: EdgeInsets.only(left: width * 0.045),
            child: Text(
              "Logout",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.5,
                  fontSize: height * 0.02,
                  color: Color(0xff3AAFA9)),
            ),
          ),
          SizedBox(height: height * 0.05),
        ],
      ),
    );
  }

  void showinviteDialog(height, width) {
    showGeneralDialog(
      barrierLabel: "Invite Friends",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: height * 0.5,
            width: width,
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: height * 0.037,
                  ),
                  Center(
                    child: Text(
                      "Invite Friends",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: height * 0.034,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.045,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.037,
                      ),
                      Container(
                        child: Card(
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70, width: 1),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.person_outline_outlined,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          "Instagram",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: height * 0.027,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.037,
                      ),
                      Container(
                        child: Card(
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70, width: 1),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.person_outline_outlined,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          "Whatsapp",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: height * 0.027,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.037,
                      ),
                      Container(
                        child: Card(
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70, width: 1),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.person_outline_outlined,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          "Copy Link",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: height * 0.027,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.037,
                      ),
                      Container(
                        child: Card(
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70, width: 1),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.person_outline_outlined,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          "Others",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: height * 0.027,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            margin: EdgeInsets.only(),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }
}
