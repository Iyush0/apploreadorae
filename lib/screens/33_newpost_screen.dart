import 'dart:convert';
import 'package:adorae/api/api.dart';
import 'package:adorae/screens/home_screen.dart';
import 'package:dio/dio.dart';
import 'package:adorae/screens/34_advanced_Setting_screen.dart';
import 'package:adorae/widgets/newpost_addlocation_widget.dart';
import 'package:adorae/widgets/newpostcaption_widget.dart';
import 'package:adorae/widgets/occasions_chips_widget.dart';
import 'package:adorae/widgets/recent_new_chip_widget.dart';
import 'package:adorae/widgets/styles_chips_widget.dart';
import 'package:flutter/material.dart';
import '28_add_post_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

class NewPostScreen extends StatefulWidget {
  static const routeName = '/newpost';
  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  dynamic _image,_currImagePath;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(currImagePath);
  }
  Map<String, String> header = {
    'Content-Type': 'application/json',
  };
  Future<void> postImage() async{
    print(userId);
    print(currImagePath);
    var responseData;
    final url = Uri.parse('http://appl-env.eba-nifmmhk2.us-east-2.elasticbeanstalk.com/user/postpicture');
    try{
      var request = http.MultipartRequest('POST',url);
      request.headers.addAll(header);
      request.files.add(await http.MultipartFile.fromPath('attach', currImagePath));
      request.fields.addAll({
        'content': '{"postCaption":"${captionController.text.toString()}","hashtagid":"id","location":"goa","userid":"$userId"}'
      });
      final response = await request.send();
      print(response.statusCode);
      if(response.statusCode==200)
        {
          var res = await response.stream.bytesToString();
           responseData = json.decode(res);
          Navigator.of(context)
              .pushNamed(HomeScreen.routeName);
        }
      else
        {
          if (responseData['error'] == true) {
            print(
                'An error occured while updating profile: ${responseData['message']}');
            return;
          }
        }
    }
    catch(e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    iconSize: 32,
                    onPressed: () {
                      // Navigator.of(context).pop();
                    },
                  ),
                  Text(
                    'New Post',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      postImage();
                    },
                    child: Text(
                      'Share',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              NewPostCaption(),
              NewPostAddLocation(),
              addHashTag(),
              StyleChips(),
              SizedBox(
                height: 10,
              ),
              OccasionChips(),
              SizedBox(
                height: 10,
              ),
              RecentAndNewChip(),
              Divider(),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(AdvancedSettingScreen.routeName);
                },
                child: Text('Advanced Settings'),
              ),
              submitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget submitButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
      child: Container(
        alignment: Alignment.center,
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
              constraints: BoxConstraints(maxWidth: 300.0, maxHeight: 60.0),
              alignment: Alignment.center,
              child: Text(
                "Publish",
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

  Widget addHashTag() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      child: Form(
        // key:
        child: TextFormField(
          maxLines: 1,
          textInputAction: TextInputAction.next,
          obscureText: false,
          keyboardType: TextInputType.name,

          // controller:
          decoration: InputDecoration(
            // icon: Icon(
            //   Icons.email_outlined,
            //   color: Colors.black,
            // ),
            // fillColor: Colors.grey[200],
            // filled: true,

            contentPadding:
                EdgeInsets.only(top: 18, bottom: 18, left: 15, right: 15),
            hintText: "Add #Hashtags",
            hintStyle: TextStyle(
              color: Colors.grey[500],
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 16.0,
                // color: Colors.lightBlue.shade50,
              ),
              borderRadius: BorderRadius.circular(36.0),
            ),
          ),
        ),
      ),
    );
  }
}
