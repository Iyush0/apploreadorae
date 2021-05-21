import 'package:adorae/widgets/button.dart';
import 'package:adorae/screens/33_newpost_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '28_add_post_screen.dart';
import 'dart:io';

class ButtonChoiceScreen extends StatefulWidget {
  static const routeName = '/button-choice';

  @override
  _ButtonChoiceScreenState createState() => _ButtonChoiceScreenState();
}

class _ButtonChoiceScreenState extends State<ButtonChoiceScreen> {
  dynamic _image;

  dynamic _currImagePath;

  Future<String> getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _image = prefs.getString('postedImage');
    _currImagePath=prefs.getString('postedImagePath');
  }

  @override
  void initState() {
    // TODO: implement initState
    getStringValuesSF();
    super.initState();
    print(currImagePath);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: FutureBuilder(
        future: getStringValuesSF(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.done)
            {
              return SafeArea(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            color: Colors.black,
                            iconSize: 28,
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_back,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.clear),
                          ),
                        ],
                      ),
                      Container(
                        height: height * 0.6,
                        width: width,
                        child:Image.file(
                          File(currImageName??''),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Choose your Button's Color",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.black,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          buildCircleAvatar(Colors.black),
                          buildCircleAvatar(Colors.red),
                          buildCircleAvatar(Colors.yellow),
                          buildCircleAvatar(Colors.orange),
                          buildCircleAvatar(Colors.green),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: CommonButton(
                          title: 'Next',
                          onTap: () {
                            Navigator.of(context).pushNamed(NewPostScreen.routeName);
                          },
                        ),
                      ),
                    ],
                  ));
            }
          return Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }

  CircleAvatar buildCircleAvatar(Color color) {
    return CircleAvatar(
      backgroundColor: color,
    );
  }
}
