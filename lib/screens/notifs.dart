import 'package:adorae/widgets/appbar_header_widget.dart';
import 'package:adorae/widgets/custom-appbar.dart';
import 'package:flutter/material.dart';

class NotifisPage extends StatefulWidget {
  @override
  _NotifisPageState createState() => _NotifisPageState();
}

class _NotifisPageState extends State<NotifisPage> {
  bool _selecteddisabled = false;
  bool _selectedfollow = false;
  bool _selectedall = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      // appBar: followAppBar("Notifications", context),
      body: ListView(
        children: <Widget>[
          AppBarHeader(
            title: 'Noifications',
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.08),
            child: Text(
              "Push Notifications",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: height * 0.027,
                  fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Row(
            children: [
              RawMaterialButton(
                onPressed: () {
                  setState(() {
                    _selecteddisabled = true;
                    if (_selecteddisabled == true) {
                      _selectedfollow = false;
                      _selectedall = false;
                    } else {
                      _selecteddisabled = false;
                    }
                  });
                },
                child: Text(
                  "Disabled",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: height * 0.022,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Flexible(child: Container()),
              _selecteddisabled
                  ? Icon(
                      Icons.check,
                      color: Color(0xff3AAFA9),
                    )
                  : SizedBox(),
              SizedBox(
                width: width * 0.03,
              ),
            ],
          ),
          Divider(
            height: height * 0.02,
            color: Colors.grey[300],
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.08),
                child: RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      _selectedfollow = true;
                      if (_selectedfollow == true) {
                        _selecteddisabled = false;
                        _selectedall = false;
                      } else {
                        _selectedfollow = false;
                      }
                    });
                  },
                  child: Text(
                    "From user I follow",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: height * 0.022,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              Flexible(child: Container()),
              _selectedfollow
                  ? Icon(
                      Icons.check,
                      color: Color(0xff3AAFA9),
                    )
                  : SizedBox(),
              SizedBox(
                width: width * 0.03,
              ),
            ],
          ),
          Divider(
            height: height * 0.02,
            color: Colors.grey[300],
          ),
          SizedBox(
            height: height * 0.045,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.08),
                child: RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      _selectedall = true;
                      if (_selectedall == true) {
                        _selecteddisabled = false;
                        _selectedfollow = false;
                      } else {
                        _selectedall = false;
                      }
                    });
                  },
                  child: Text(
                    "From all users",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: height * 0.022,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              Flexible(child: Container()),
              _selectedall
                  ? Icon(
                      Icons.check,
                      color: Color(0xff3AAFA9),
                    )
                  : SizedBox(),
              SizedBox(
                width: width * 0.03,
              ),
            ],
          ),
          Divider(
            height: height * 0.02,
            color: Colors.grey[300],
          ),
          SizedBox(
            height: height * 0.03,
          ),
          // SizedBox(
          //   height: height * 0.03,
          // ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.08),
            child: Text(
              "Email",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: height * 0.027,
                  fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.08),
            child: Text(
              "Recieve marketing emails?",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: height * 0.022,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
    );
  }
}
