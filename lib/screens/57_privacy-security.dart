import 'package:adorae/widgets/appbar_header_widget.dart';
import 'package:adorae/widgets/custom-appbar.dart';
import 'package:flutter/material.dart';

import '58_blocked_contacts.dart';

class PrivacySecurity extends StatefulWidget {
  @override
  _PrivacySecurityState createState() => _PrivacySecurityState();
}

class _PrivacySecurityState extends State<PrivacySecurity> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: followAppBar("Privacy & Security",context),
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: <Widget>[
          AppBarHeader(
            title: 'Privacy & Security',
          ),
          SizedBox(height: height * 0.02),
          Padding(
            padding: EdgeInsets.only(left: width * 0.07),
            child: Text(
              "Account Privacy",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: height * 0.028,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.073, top: height * 0.02),
            child: Text(
              "Private Account",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: height * 0.024,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.073, top: height * 0.02),
            child: Text(
              """When your account is private, only people you approve can see your
photos and videos on Instagram. Your existing followers won't be""",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: height * 0.017,
                  color: Colors.grey[400]),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.07, top: height * 0.05),
            child: Text(
              "Activity Status",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: height * 0.027,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.073, top: height * 0.02),
            child: Text(
              "Show Activity Status",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: height * 0.022,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.073, top: height * 0.02),
            child: Text(
              """Allow accounts you follow and anyone you message to see when you 
were last active on instagram apps. When this is turned off, you won't be""",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: height * 0.017,
                  color: Colors.grey[400]),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.07, top: height * 0.05),
            child: Text(
              "Story Sharing",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: height * 0.027,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.073, top: height * 0.02),
            child: Text(
              "Allow Sharing",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: height * 0.022,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.073, top: height * 0.02),
            child: Text(
              "Let people share your story as messages",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: height * 0.017,
                  color: Colors.grey[400]),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.07, top: height * 0.05),
            child: Text(
              "Closet Status",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: height * 0.027,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.073, top: height * 0.02, bottom: height * 0.03),
            child: Text(
              "Add Closet Status",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: height * 0.022,
                  color: Colors.black),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: width * 0.035,
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return BlockedContacts();
                  }));
                },
                child: Text(
                  "Blocked Contacts",
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
                    return BlockedContacts();
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: width * 0.035,
              ),
              FlatButton(
                onPressed: () {
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (context) {
                  //   return BlockedContacts();
                  // }));
                },
                child: Text(
                  "Login Activity",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: height * 0.02,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Flexible(child: Container()),
              IconButton(
                onPressed: () {
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (context) {
                  //   return BlockedContacts();
                  // }));
                },
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.black,
                  size: height * 0.02,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: width * 0.035,
              ),
              FlatButton(
                onPressed: () {
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (context) {
                  //   return BlockedContacts();
                  // }));
                },
                child: Text(
                  "Comments",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: height * 0.02,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Flexible(child: Container()),
              IconButton(
                onPressed: () {
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (context) {
                  //   return Comme();
                  // }));
                },
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.black,
                  size: height * 0.02,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.07, top: height * 0.02),
            child: Text(
              "Privacy & Security help",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: height * 0.027,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: width * 0.75),
            child: RawMaterialButton(
              onPressed: () {},
              child: Text(
                "Support",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: height * 0.02,
                    color: Color(0xff3AAFA9)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
