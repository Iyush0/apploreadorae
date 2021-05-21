
import 'package:flutter/material.dart';

import 'business-name.dart';

class SwitchProfessional extends StatefulWidget {
  @override
  _SwitchProfessionalState createState() => _SwitchProfessionalState();
}

class _SwitchProfessionalState extends State<SwitchProfessional> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.black,
              size: height * 0.04,
            ),
            onPressed: () {
              Navigator.of(context)..pop();
            }),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: height * 0.05,
          ),
          cards(
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.person,
                color: Color(0xff3AAFA9),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: width * 0.08,
                  top: height * 0.02,
                  bottom: height * 0.01),
              child: Text("Get Professional Account",
                  style: TextStyle(
                      color: Color(0xff23706C),
                      fontSize: height * 0.026,
                      fontWeight: FontWeight.w700)),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: width * 0.02, bottom: height * 0.015),
              child: Text(
                "Increase Your Business by Switching to Professional Account",
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: true),
                style: TextStyle(
                    color: Color(0xff63CDC8),
                    fontSize: height * 0.017,
                    fontWeight: FontWeight.w400),
              ),
            ),
            height,
            width,
          ),
          SizedBox(
            height: height * 0.05,
          ),
          cards(
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.person,
                color: Color(0xff3AAFA9),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: width * 0.099,
                  top: height * 0.02,
                  bottom: height * 0.01),
              child: Text("Learn About Followers",
                  style: TextStyle(
                      color: Color(0xff23706C),
                      fontSize: height * 0.026,
                      fontWeight: FontWeight.w700)),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: width * 0.02, bottom: height * 0.015),
              child: Text(
                "Increase Your Business by Switching to Professional Account",
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: true),
                style: TextStyle(
                    color: Color(0xff63CDC8),
                    fontSize: height * 0.017,
                    fontWeight: FontWeight.w400),
              ),
            ),
            height,
            width,
          ),
          SizedBox(
            height: height * 0.05,
          ),
          cards(
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.person,
                color: Color(0xff3AAFA9),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: width * 0.17,
                  top: height * 0.02,
                  bottom: height * 0.01),
              child: Text("Reach More People",
                  style: TextStyle(
                      color: Color(0xff23706C),
                      fontSize: height * 0.026,
                      fontWeight: FontWeight.w700)),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: width * 0.02, bottom: height * 0.015),
              child: Text(
                "Increase Your Business by Switching to Professional Account",
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: true),
                style: TextStyle(
                    color: Color(0xff63CDC8),
                    fontSize: height * 0.017,
                    fontWeight: FontWeight.w400),
              ),
            ),
            height,
            width,
          ),
          SizedBox(
            height: height * 0.05,
          ),
          cards(
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.person,
                color: Color(0xff3AAFA9),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: width * 0.08,
                  top: height * 0.02,
                  bottom: height * 0.01),
              child: Text("Get New Contact Option",
                  style: TextStyle(
                      color: Color(0xff23706C),
                      fontSize: height * 0.026,
                      fontWeight: FontWeight.w700)),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: width * 0.02, bottom: height * 0.015),
              child: Text(
                "Increase Your Business by Switching to Professional Account",
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: true),
                style: TextStyle(
                    color: Color(0xff63CDC8),
                    fontSize: height * 0.017,
                    fontWeight: FontWeight.w400),
              ),
            ),
            height,
            width,
          ),
          SizedBox(
            height: height * 0.05,
          ),
          continueButton(height),
        ],
      ),
    );
  }

  Widget cards(Widget icon, Widget title, Widget text, height, width) {
    return Container(
      margin: EdgeInsets.only(left: width * 0.1, right: width * 0.1),
      decoration: BoxDecoration(
          color: Color(0xffE4FFFE),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: ListTile(
        leading: icon,
        title: Column(
          children: <Widget>[
            title,
            text,
          ],
        ),
      ),
    );
  }

  Widget continueButton(height) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Container(
        alignment: Alignment.center,
        // height: 150,
        // width: 300,
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return EnterBusinessName();
            }));
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(34.0)),
          padding: EdgeInsets.all(0.0),
          child: Ink(
            decoration: BoxDecoration(
                color: Color(0xff3AAFA9),
                borderRadius: BorderRadius.circular(34.0)),
            child: Container(
              constraints: BoxConstraints(maxWidth: 280.0, maxHeight: 50.0),
              alignment: Alignment.center,
              child: Text(
                "Continue",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: height * 0.024,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
