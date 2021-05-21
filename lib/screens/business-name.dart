import 'package:flutter/material.dart';

import 'business-add.dart';

class EnterBusinessName extends StatefulWidget {
  @override
  _EnterBusinessNameState createState() => _EnterBusinessNameState();
}

class _EnterBusinessNameState extends State<EnterBusinessName> {
  final _businessnameformKey = GlobalKey<FormState>();
  final _businessController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.black,
                size: height * 0.04,
              ),
              onPressed: () {
                Navigator.of(context)..pop();
              }),
        ],
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: height * 0.15,
          ),
          Center(
            child: Text(
              "Enter Business Name",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 24,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          businessname(height, width),
          SizedBox(
            height: height * 0.05,
          ),
          nextButton(height),
        ],
      ),
    );
  }

  Widget businessname(height, width) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          width * 0.06, height * 0.03, width * 0.06, height * 0.03),
      child: Form(
        key: _businessnameformKey,
        child: TextFormField(
          maxLines: 1,
          textInputAction: TextInputAction.next,
          obscureText: false,
          keyboardType: TextInputType.name,
          validator: (value) {
            if (value.isEmpty) {
              return "required";
            } else {}
          },
          controller: _businessController,
          decoration: InputDecoration(
            // icon: Icon(
            //   Icons.email_outlined,
            //   color: Colors.black,
            // ),
            // fillColor: Colors.grey[200],
            // filled: true,

            contentPadding: EdgeInsets.only(
              top: height * 0.03,
              bottom: height * 0.03,
              left: width * 0.03,
            ),
            hintText: "Business",
            hintStyle: TextStyle(
              color: Colors.grey[500],
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  width: width * 0.016, color: Colors.lightBlue.shade50),
              borderRadius: BorderRadius.circular(29.0),
            ),
          ),
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
              return EnterBusinessAddress();
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
