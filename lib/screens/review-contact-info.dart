import 'package:adorae/widgets/appbar_header_widget.dart';
import 'package:adorae/widgets/custom-appbar.dart';
import 'package:flutter/material.dart';

import '71_keep-going.dart';

class ReviewContactInfo extends StatefulWidget {
  @override
  _ReviewContactInfoState createState() => _ReviewContactInfoState();
}

class _ReviewContactInfoState extends State<ReviewContactInfo> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: followAppBar("Review your contact info", context),
      body: ListView(
        children: <Widget>[
          AppBarHeader(title: "Review your contact info"),
          Padding(
            padding: EdgeInsets.only(left: width * 0.15, top: height * 0.02),
            child: Text(
              """This information will be displayed on your profile publicly so
       people can contact you. You can edit or remove this
                               information at any time.""",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: height * 0.017,
                  color: Colors.grey[400]),
            ),
          ),
          SizedBox(
            height: height * 0.07,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: width * 0.07,
            ),
            child: Text(
              "Public business information",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: height * 0.025),
            ),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Row(
            children: [
              SizedBox(
                width: width * 0.07,
              ),
              Icon(
                Icons.email,
                color: Color(0xff3AAFA9),
              ),
              SizedBox(
                width: width * 0.03,
              ),
              Text(
                "michael@dummy.com",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: height * 0.025),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            children: [
              SizedBox(
                width: width * 0.07,
              ),
              Icon(
                Icons.phone,
                color: Color(0xff3AAFA9),
              ),
              SizedBox(
                width: width * 0.03,
              ),
              Text(
                "+01",
                style: TextStyle(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w700,
                    fontSize: height * 0.024),
              ),
              SizedBox(
                width: width * 0.01,
              ),
              Text(
                "9876543210",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: height * 0.025),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Row(
            children: [
              SizedBox(
                width: width * 0.07,
              ),
              Icon(
                Icons.location_on,
                color: Color(0xff3AAFA9),
              ),
              SizedBox(
                width: width * 0.03,
              ),
              Text(
                "Business address",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: height * 0.025),
              ),
              Flexible(child: Container()),
              IconButton(
                onPressed: () {
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (context) {
                  //   return NotifisPage();
                  // }));
                },
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.grey[400],
                  size: height * 0.02,
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.4,
          ),
          nextButton(height),
        ],
      ),
    );
  }

  Widget nextButton(height) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Container(
        alignment: Alignment.center,
        // height: 150,
        // width: 300,
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return KeepGoing();
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
                "Next",
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
