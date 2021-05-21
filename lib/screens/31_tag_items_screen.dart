import 'package:adorae/screens/32_button_choice.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import '28_add_post_screen.dart';

class TagItemsScreen extends StatefulWidget {
  static const routeName = '/tag-item';
  @override
  _TagItemsScreenState createState() => _TagItemsScreenState();
}

class _TagItemsScreenState extends State<TagItemsScreen> {
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
      body: SafeArea(
        child: FutureBuilder(
          future: getStringValuesSF(),
          builder: (context,snapshot){
            return Container(
              child: Column(
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
                        onPressed: () {},
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(ButtonChoiceScreen.routeName);
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: height * 0.6,
                    width: width,
                    child: Image.file(
                      File(currImageName??''),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 50,
                    ),
                    child: Text(
                      """            Tap To 
Start Tagging Items""",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
