import 'dart:convert';

import 'package:adorae/api/api.dart';
import 'package:adorae/components/colors.dart';
import 'package:adorae/screens/8_create_profile.dart';
import 'package:adorae/services/field_validator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'authentication/login/login_Screen.dart';

class SignUpEmailorPhone extends StatefulWidget {
  @override
  _SignUpEmailorPhoneState createState() => _SignUpEmailorPhoneState();
}

class _SignUpEmailorPhoneState extends State<SignUpEmailorPhone> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> _phoneformkey = GlobalKey<FormState>();
  Validator _validator = Validator();
  // final _emailformKey = GlobalKey<FormState>();
  // final _phoneformKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  var _email = '';
  var data;
  var _phoneNumber = '';
  List<String> email = <String>[
    'example@gmail.com',
    'newuser@gmail.com',
  ];

  @override
  void initState() {
    getDetails(_emailController.text, BuildContext);
    // TODO: implement initState
    super.initState();
  }

  Widget emailInput() {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(23.0, 60.0, 23.0, 0.0),
            child: TextFormField(
              onChanged: (val) {
                for (int i; i <= email.length; i++) {
                  if (email[i] == val) {
                    print("email already exists");
                    return "email already exists";
                  } else {
                    return null;
                  }
                }
              },
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              validator: (val) {
                if (val.isEmpty) {
                  return "Please enter email";
                } else if (email.contains(val)) {
                  return "email already exists";
                } else {
                  return null;
                }
              },
              // _validator.emailValidate,
              onSaved: (value) {
                _email = value;
              },
              controller: _emailController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  top: 20,
                  right: 15,
                  bottom: 20,
                  left: 25,
                ),
                hintText: "Email/Phone",
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          nextButton(() async {
            print("my email: " + _emailController.text);
            var isValid = _formkey.currentState.validate();

            if (isValid) {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString('emailId', '${_emailController.text}');
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return SignUpName();
              }));
              // PostApi().postData(_emailController.text);

            }
          }),
        ],
      ),
    );
  }

  getDetails(emailcontr, context) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };

    var res = await http.get(
        'http://appl-env.eba-nifmmhk2.us-east-2.elasticbeanstalk.com/user/details/',
        headers: header);
    print(res.body.runtimeType);
    print(res.body);

    if (res.statusCode == 200) {
      print('details');
      print(res.body);
      print("details: " + res.statusCode.toString());
      data = jsonDecode(res.body) as List;
      setState(() {
        print("email list length: " + "${data.length - 1}");
        for (int i = 0; i <= data.length - 1; i++) {
          email.add(data[i]['email'].toString());
        }

        print("details: " + data.toString());
        print("emailids: " + email.toString());
      });
    } else {
      // showToast("email does not exist");
      print('details fail');
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return
        // DefaultTabController(
        // length: 2,
        // child:
        Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        // top: false,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 338.0, top: 15),
              child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.of(context)..pop();
                  }),
            ),
            SizedBox(height: height * 0.07),
            Center(
              child: Text(
                """    Enter phone number or     
             email address """,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: height * 0.08),
            // Text(
            //   "Email Address",
            //   style: TextStyle(
            //     color: Colors.black,
            //     fontWeight: FontWeight.w900,
            //     fontSize: 18,
            //   ),
            // ),
            // the tab bar with two items
            // SizedBox(
            //   height: height * 0.07,
            //   child: AppBar(
            //     backgroundColor: Colors.white,
            //     // toolbarHeight: 70.0,
            //     flexibleSpace: TabBar(
            //       indicatorColor: Colors.black,
            //       tabs: [
            //         Tab(
            //           icon: Text(
            //             "Email Address",
            //             style: TextStyle(
            //               color: Colors.black,
            //               fontWeight: FontWeight.w900,
            //               fontSize: 18,
            //             ),
            //           ),
            //         ),
            //     Tab(
            //       icon: Text(
            //         "Phone Number",
            //         style: TextStyle(
            //           color: Colors.black,
            //           fontWeight: FontWeight.w900,
            //           fontSize: 18,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // ),
            // ),
            // Expanded(
            //   child: TabBarView(
            //     children: [
            Container(
              child: emailInput(),
            ),
            //     Container(
            //       child: phone(),
            //     ),
            //   ],
            // ),
            // ),
          ],
        ),
      ),
      // ),
    );
  }

  // Widget phone() {
  //   return Form(
  //     key: _phoneformkey,
  //     child: Column(
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.fromLTRB(23.0, 60.0, 23.0, 0.0),
  //           child: TextFormField(
  //             textInputAction: TextInputAction.next,
  //             keyboardType: TextInputType.phone,
  //             maxLength: 10,
  //             validator: (val) {
  //               if (val.isEmpty) {
  //                 return "Please enter phone number";
  //               } else {
  //                 return null;
  //               }
  //             },
  //             // _validator.numberValidate,
  //             onSaved: (value) {
  //               _phoneNumber = value;
  //             },
  //             controller: _phoneController,
  //             decoration: InputDecoration(
  //               contentPadding: EdgeInsets.only(
  //                 top: 20,
  //                 right: 15,
  //                 bottom: 20,
  //                 left: 25,
  //               ),
  //               hintText: "Phone Number",
  //               hintStyle: TextStyle(
  //                 color: Colors.grey[500],
  //               ),
  //               border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(30),
  //               ),
  //             ),
  //           ),
  //         ),
  //         nextButton(() {
  //           var isValidP = _phoneformkey.currentState.validate();
  //           if (isValidP) {
  //             // saveEmail();
  //             savePhone();
  //             Navigator.of(context)
  //                 .pushReplacement(MaterialPageRoute(builder: (context) {
  //               return SignUpName();
  //             }));
  //           }
  //         }),
  //       ],
  //     ),
  //   );
  // }

  // savePhone() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('phone', "${_phoneController.text}");
  // }

  nextButton(Function onTap) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: SizedBox(
        height: 60,
        width: 350,
        child: RaisedButton(
          color: kPrimaryColor,
          onPressed: onTap,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Text(
            "Next",
            style: TextStyle(
                color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
