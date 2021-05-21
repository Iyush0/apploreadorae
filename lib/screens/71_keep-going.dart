import 'package:adorae/widgets/appbar_header_widget.dart';
import 'package:adorae/widgets/custom-appbar.dart';
import 'package:flutter/material.dart';

class KeepGoing extends StatefulWidget {
  @override
  _KeepGoingState createState() => _KeepGoingState();
}

class _KeepGoingState extends State<KeepGoing> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: followAppBar("Keep going, michgutier", context),
      body: ListView(
        children: <Widget>[
          AppBarHeader(title: "Keep going, michgutier"),
          Padding(
            padding: EdgeInsets.only(left: width * 0.2, top: height * 0.02),
            child: Text(
              """Continue setting up your profile so that you can
      connect faster with people who care about
                               what you do.""",
              style: TextStyle(
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                  fontSize: height * 0.017,
                  color: Colors.grey[400]),
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
                Icons.person_search_rounded,
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
          Row(
            children: [
              SizedBox(
                width: width * 0.07,
              ),
              Icon(
                Icons.screen_share,
                color: Color(0xff3AAFA9),
              ),
              SizedBox(
                width: width * 0.03,
              ),
              Text(
                "Share Photos and Videos",
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
            height: height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.07),
            child: Text(
              "Completed",
              style: TextStyle(
                // height: 1.5,
                fontWeight: FontWeight.w700,
                fontSize: height * 0.026,
                color: Colors.black,
              ),
            ),
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
                Icons.person,
                color: Color(0xff3AAFA9),
              ),
              SizedBox(
                width: width * 0.03,
              ),
              Text(
                "Complete Your Profile",
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
                  Icons.check,
                  color: Color(0xff3AAFA9),
                  size: height * 0.03,
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
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            //   return ReviewContactInfo();
            // }));
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
