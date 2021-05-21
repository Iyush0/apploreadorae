import 'package:adorae/widgets/appbar_header_widget.dart';
import 'package:adorae/widgets/custom-appbar.dart';
import 'package:flutter/material.dart';
import 'review-contact-info.dart';

class AreYouBusiness extends StatefulWidget {
  @override
  _AreYouBusinessState createState() => _AreYouBusinessState();
}

class _AreYouBusinessState extends State<AreYouBusiness> {
  bool _selectedb = false;
  bool _selectedc = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: followAppBar("Are you a Business?", context),
      body: ListView(
        children: <Widget>[
          AppBarHeader(title: 'Are you a Business?'),
          Padding(
            padding: EdgeInsets.only(left: width * 0.075, top: height * 0.02),
            child: Text(
              """Based on a category that you have selected you may to be a business.
                                     You can edit this at any time.""",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: height * 0.017,
                  color: Colors.grey[400]),
            ),
          ),
          SizedBox(
            height: height * 0.07,
          ),
          businesscards(
              Text(
                "Business",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: height * 0.025),
              ),
              Text(
                "Best for retailers, local businesses, brands, organisations and service providers.",
                style: TextStyle(
                    color: Colors.grey[350],
                    fontWeight: FontWeight.w400,
                    fontSize: height * 0.017),
              ),
              height,
              width),
          SizedBox(
            height: height * 0.03,
          ),
          creatorcards(
              Text(
                "Creator",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: height * 0.025),
              ),
              Text(
                "Best for public figures, content producers, artists and influencers.",
                style: TextStyle(
                    color: Colors.grey[350],
                    fontWeight: FontWeight.w400,
                    fontSize: height * 0.017),
              ),
              height,
              width),
          SizedBox(
            height: height * 0.33,
          ),
          nextButton(height),
        ],
      ),
    );
  }

  Widget businesscards(Widget title, Widget text, height, width) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedb = true;
          if (_selectedb == true) {
            _selectedc = false;
          } else {
            _selectedc = true;
          }
        });
      },
      child: Container(
        padding: EdgeInsets.only(top: height * 0.02, bottom: height * 0.02),
        margin: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]),
            // color: Color(0xffE4FFFE),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: ListTile(
          leading: _selectedb
              ? Icon(
                  Icons.radio_button_checked,
                  color: Color(0xff3AAFA9),
                )
              : Icon(
                  Icons.radio_button_off,
                  color: Colors.grey[350],
                ),
          title: title,
          subtitle: text,
        ),
      ),
    );
  }

  Widget creatorcards(Widget title, Widget text, height, width) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedc = true;
          if (_selectedc == true) {
            _selectedb = false;
          } else {
            _selectedb = true;
          }
        });
      },
      child: Container(
        padding: EdgeInsets.only(top: height * 0.02, bottom: height * 0.02),
        margin: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]),
            // color: Color(0xffE4FFFE),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: ListTile(
          leading: _selectedc
              ? Icon(
                  Icons.radio_button_checked,
                  color: Color(0xff3AAFA9),
                )
              : Icon(
                  Icons.radio_button_off,
                  color: Colors.grey[350],
                ),
          title: title,
          subtitle: text,
        ),
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
              return ReviewContactInfo();
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
