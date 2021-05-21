import 'package:adorae/screens/28_add_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
TextEditingController captionController = TextEditingController();
class NewPostCaption extends StatefulWidget {
  @override
  _NewPostCaptionState createState() => _NewPostCaptionState();
}

class _NewPostCaptionState extends State<NewPostCaption> {

  dynamic _image,_currImagePath;
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
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getStringValuesSF(),
      builder: (context,snapshot){
        return Column(
          children: [
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                // border: Border.all(),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20),
                    child: Container(
                      height: 160,
                      width: 150,
                      decoration: BoxDecoration(
                        // border: Border.all(),
                      ),
                      child: Image.file(File(currImageName ??'')),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width / 2,
                      child: TextField(
                        controller: captionController,
                        decoration: InputDecoration(
                          hintText: 'Write a caption...',
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tag People',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
          ],
        );
      }

    );
  }
}
