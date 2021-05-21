import 'dart:convert';

import 'package:adorae/api/api.dart';
import 'package:adorae/components/colors.dart';
import 'package:adorae/screens/12_add_profileScreen.dart';
import 'package:adorae/screens/home_screen.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'authentication/login/login_Screen.dart';

class SignUpUsername extends StatefulWidget {
  @override
  _SignUpUsernameState createState() => _SignUpUsernameState();
}

class _SignUpUsernameState extends State<SignUpUsername> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _key = GlobalKey<AutoCompleteTextFieldState<String>>();
  var data;
  String name = "";
  String emailid = "";
  String age = "";
  String usernameS = "";
  String gender = "";
  String pass = "";
  var id = "";

  List<String> _usernameSuggestions = <String>[
    'category1',
    'category2',
    'category3',
  ];

  _getusernames() async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };

    var res = await http.get(
        "http://appl-env.eba-nifmmhk2.us-east-2.elasticbeanstalk.com/user/username",
        headers: header);
    print(res.body.runtimeType);
    if (res.statusCode == 200) {
      print("usernames suggestions: " + res.body);

      setState(() {
        data = jsonDecode(res.body) as List;
        print("data usernames get length: " + data.length.toString());
        for (int i = 0; i <= data.length - 1; i++) {
          _usernameSuggestions.add(data[i]['username'].toString());
          print("username suggestions: " + _usernameSuggestions[i]);
        }
      });
    } else {
      showToast("data does not exist");
    }
  }

  Widget username() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(23.0, 30.0, 23.0, 20.0),
      child: TextFormField(
        maxLines: 1,
        textInputAction: TextInputAction.next,
        obscureText: false,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value.isEmpty) {
            return "Required*";
          } else if (value.length < 4) {
            return 'Please enter atleast 4 characters';
          } else {
            return null;
          }
        },
        controller: _usernameController,
        decoration: InputDecoration(
          // icon: Icon(
          //   Icons.email_outlined,
          //   color: Colors.black,
          // ),
          // fillColor: Colors.grey[200],
          // filled: true,

          contentPadding:
              EdgeInsets.only(top: 22, bottom: 22, left: 15, right: 15),
          hintText: "Username",
          hintStyle: TextStyle(
            color: Colors.grey[500],
          ),
          border: OutlineInputBorder(
            borderSide:
                BorderSide(width: 16.0, color: Colors.lightBlue.shade50),
            borderRadius: BorderRadius.circular(29.0),
          ),
        ),
      ),
    );
  }

  saveUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', "${_usernameController.text}");
  }

  getusername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String stringValueU = prefs.getString('username');
    setState(() {
      usernameS = stringValueU;
      print(usernameS);
    });
    return stringValueU;
  }

  getGender() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String stringValueG = prefs.getString('gender');
    setState(() {
      gender = stringValueG;
      print(gender);
    });
    return stringValueG;
  }

  getAge() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String stringValueA = prefs.getString('age');
    setState(() {
      age = stringValueA;
      print(age);
    });
    return stringValueA;
  }

  getPass() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String stringValueP = prefs.getString('password');
    setState(() {
      pass = stringValueP;
      print(pass);
    });
    return stringValueP;
  }

  getemail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String stringValueE = prefs.getString('emailId');
    setState(() {
      emailid = stringValueE;
      print(emailid);
    });
    return stringValueE;
  }

  getname() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValueN = prefs.getString('name');
    setState(() {
      name = stringValueN;
      print(name);
    });
    return stringValueN;
  }

  getphone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValuePH = prefs.getString('phone');
    return stringValuePH;
  }

  @override
  void initState() {
    _getusernames();
    // postSignup();
    // getusername();
    getAge();
    getGender();
    getPass();
    getemail();
    getname();
    // TODO: implement initState
    super.initState();
  }

  postSignup({age, gender, username, email, name, password}) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };

    var _res = await http.post(
      'http://appl-env.eba-nifmmhk2.us-east-2.elasticbeanstalk.com/user/register',
      headers: header,
      body: json.encode({
        "age": "$age",
        "gender": "$gender",
        "username": "$username",
        "email": "$email",
        "auth": "password",
        "name": "$name",
        "password": "$password"
      }),
    );
    print("signup: " + _res.statusCode.toString());
    print("sing up body: " + _res.body);

    // print('discovering users');
    if (_res.statusCode == 200) {
      var data = jsonDecode(_res.body);
      print("sign up status code: " + data.toString());

      setState(() {
        id = data['userid'];
        print("users id: " + id);
      });
      // Navigator.of(context)
      //     .pushReplacement(MaterialPageRoute(builder: (context) {
      //   return HomeScreen();
      // }));
    } else {
      showToast("error sign up api");
    }
  }

  savePhone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('id', "$id");
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
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
            SizedBox(height: 70),
            Center(
              child: Text(
                "Create your username",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: 40),
            selectUsername(height, width),
            // username(),
            nextButton(() {
              var isValid = _formKey.currentState.validate();
              if (isValid) {
                saveUserName();

                postSignup(
                    age: age,
                    gender: gender,
                    username: _usernameController.text,
                    email: emailid,
                    name: name,
                    password: pass);
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return SignUpProfilePhoto();
                }));
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget selectUsername(height, width) {
    return Container(
      margin: EdgeInsets.fromLTRB(width * 0.1, 0.0, width * 0.1, 30.0),
      decoration: BoxDecoration(
        // color: Colors.black,
        border: Border.all(
          color: Colors.grey[500],
        ),
        borderRadius: BorderRadius.all(Radius.circular(29)),
      ),
      padding: EdgeInsets.fromLTRB(
          width * 0.021, height * 0.005, width * 0.017, height * 0.005),
      child: SimpleAutoCompleteTextField(
        controller: _usernameController,
        key: _key,
        suggestions: _usernameSuggestions,
        decoration: InputDecoration(
          border: InputBorder.none,
          // suffixIcon: InkWell(
          //   onTap: () {},
          //   child: Padding(
          //     padding: EdgeInsets.fromLTRB(0.0, 0.0, width * 0.01, 0.0),
          //     child: IconButton(
          //       onPressed: () {},
          //       icon: Icon(
          //         Icons.search,
          //         size: height * 0.04,
          //         color: Colors.grey[200],
          //       ),
          //     ),
          //   ),
          // ),
          contentPadding:
              EdgeInsets.fromLTRB(width * 0.01, 0.0, 0.0, height * 0.005),
          hintText: 'Username',
          hintStyle: TextStyle(
            color: Colors.grey[500],
            fontSize: height * 0.02,
          ),
        ),
      ),
    );
  }

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
