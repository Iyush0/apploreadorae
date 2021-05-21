import 'package:adorae/screens/4_forgor_password_Screen.dart.dart';
import 'package:adorae/widgets/appbar_header_widget.dart';
import 'package:adorae/widgets/custom-appbar.dart';
import 'package:flutter/material.dart';

class ChangePass extends StatefulWidget {
  @override
  _ChangePassState createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  final _oldpassController = TextEditingController();
  final _oldpassformKey = GlobalKey<FormState>();
  final _newpassController = TextEditingController();
  final _newpassformKey = GlobalKey<FormState>();
  final _confirmpassController = TextEditingController();
  final _confirmpassformKey = GlobalKey<FormState>();
  bool _obscurePass = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double leftpadding = width * 0.09;
    double rightpadding = width * 0.09;
    double fontsizeforgotpass = height * 0.02;
    return Scaffold(
      // appBar: followAppBar("Change Password", context),
      body: ListView(
        children: <Widget>[
          AppBarHeader(
            title: 'Change Password',
          ),
          SizedBox(
            height: height * 0.03,
          ),
          oldpassword(leftpadding, rightpadding),
          SizedBox(
            height: height * 0.03,
          ),
          newpassword(leftpadding, rightpadding),
          SizedBox(
            height: height * 0.03,
          ),
          confirmpassword(leftpadding, rightpadding),
          SizedBox(
            height: height * 0.06,
          ),
          changepassButton(),
          SizedBox(height: height * 0.02),
          FlatButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ForgotPassword();
              }));
            },
            child: Text(
              "Forgot Password?",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: fontsizeforgotpass),
            ),
          ),
          // SizedBox(height: 15),
          SizedBox(height: height * 0.02),
        ],
      ),
    );
  }

  void _togglePass() {
    setState(() {
      _obscurePass = !_obscurePass;
    });
  }

  Widget oldpassword(left, right) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, 0.0, right, 0.0),
      child: Form(
        key: _oldpassformKey,
        child: TextFormField(
          maxLines: 1,
          obscureText: _obscurePass,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          validator: (value) {
            if (value.isEmpty) {
              return "required";
            } else {}
          },
          controller: _oldpassController,
          decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: _togglePass,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 17.0, 0.0),
                child: IconButton(
                    onPressed: () {},
                    icon: _obscurePass
                        ? Icon(Icons.remove_red_eye)
                        : Icon(Icons.remove_red_eye_outlined)),
              ),
            ),
            // icon: Icon(
            //   Icons.lock_open,
            //   color: Colors.black,
            // ),
            // fillColor: Colors.grey[200],
            // filled: true,
            contentPadding:
                EdgeInsets.only(top: 18, bottom: 18, left: 15, right: 15),
            labelText: "Old Password",
            labelStyle: TextStyle(
              color: Colors.grey[500],
            ),
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 16.0, color: Colors.lightBlue.shade50),
              borderRadius: BorderRadius.circular(29.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget newpassword(left, right) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, 0.0, right, 0.0),
      child: Form(
        key: _newpassformKey,
        child: TextFormField(
          maxLines: 1,
          obscureText: _obscurePass,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          validator: (value) {
            if (value.isEmpty) {
              return "required";
            } else {}
          },
          controller: _newpassController,
          decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: _togglePass,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 17.0, 0.0),
                child: IconButton(
                    onPressed: () {},
                    icon: _obscurePass
                        ? Icon(Icons.remove_red_eye)
                        : Icon(Icons.remove_red_eye_outlined)),
              ),
            ),
            // icon: Icon(
            //   Icons.lock_open,
            //   color: Colors.black,
            // ),
            // fillColor: Colors.grey[200],
            // filled: true,
            contentPadding:
                EdgeInsets.only(top: 18, bottom: 18, left: 15, right: 15),
            labelText: "New Password",
            labelStyle: TextStyle(
              color: Colors.grey[500],
            ),
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 16.0, color: Colors.lightBlue.shade50),
              borderRadius: BorderRadius.circular(29.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget confirmpassword(left, right) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, 0.0, right, 0.0),
      child: Form(
        key: _confirmpassformKey,
        child: TextFormField(
          maxLines: 1,
          obscureText: _obscurePass,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          validator: (value) {
            if (value.isEmpty) {
              return "required";
            } else {}
          },
          controller: _confirmpassController,
          decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: _togglePass,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 17.0, 0.0),
                child: IconButton(
                    onPressed: () {},
                    icon: _obscurePass
                        ? Icon(Icons.remove_red_eye)
                        : Icon(Icons.remove_red_eye_outlined)),
              ),
            ),
            // icon: Icon(
            //   Icons.lock_open,
            //   color: Colors.black,
            // ),
            // fillColor: Colors.grey[200],
            // filled: true,
            contentPadding:
                EdgeInsets.only(top: 18, bottom: 18, left: 15, right: 15),
            labelText: "Confirm Password",
            labelStyle: TextStyle(
              color: Colors.grey[500],
            ),
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 16.0, color: Colors.lightBlue.shade50),
              borderRadius: BorderRadius.circular(29.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget changepassButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Container(
        alignment: Alignment.center,
        // height: 150,
        // width: 300,
        child: RaisedButton(
          onPressed: () {
            // Navigator.of(context)
            //     .pushReplacement(MaterialPageRoute(builder: (context) {
            //   return Home();
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
                "Change Password",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
