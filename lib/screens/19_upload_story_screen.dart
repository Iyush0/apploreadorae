import 'package:adorae/screens/21_edit_story_screen.dart';
import 'package:adorae/screens/22_story_control_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '20_Upload_story_send_screen.dart';

class UploadStoryScreen extends StatefulWidget {
  static const routeName = '/upload-story';

  @override
  _UploadStoryScreenState createState() => _UploadStoryScreenState();
}

class _UploadStoryScreenState extends State<UploadStoryScreen> {
  String path;

  CameraController controller;

  Future<void> initialControllerFuture;

  bool isDisabled = false;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.high);
    initialControllerFuture = controller.initialize();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            child: CameraPreview(controller),
          ),
          Positioned(
            top: height * 0.8,
            left: 20,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(StoryControl.routeName);
              },
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              iconSize: 30,
            ),
          ),
          Positioned(
            top: height * 0.88,
            left: 20,
            right: 20,
            child: Container(
              // decoration: BoxDecoration(border: Border.all()),
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/girl.jpeg'),
                    radius: 30,
                  ),
                  RaisedButton(
                    elevation: 0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(UploadStorySendScreen.routeName);
                      // showModalSheet(height * 0.6, double.infinity, context);
                    },
                    child: Row(
                      children: [
                        Text('Send To'),
                        Icon(Icons.arrow_forward_ios_sharp),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: height * 0.06,
            left: 10,
            right: 10,
            child: Container(
              width: width,
              // decoration: BoxDecoration(border: Border.all()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildRowTile(
                    Icon(Icons.clear),
                    () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Container(
                    width: width * 0.6,
                    // decoration: BoxDecoration(border: Border.all()),
                    child: FittedBox(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          buildRowTile(
                            Icon(Icons.label),
                            () {},
                          ),
                          buildRowTile(
                            Icon(Icons.gif_outlined),
                            () {},
                          ),
                          buildRowTile(
                            Icon(Icons.download_sharp),
                            () {},
                          ),
                          buildRowTile(
                            Icon(Icons.coronavirus_sharp),
                            () {},
                          ),
                          buildRowTile(
                            Icon(Icons.edit),
                            () {
                              Navigator.of(context)
                                  .pushNamed(UploadEditStoryScreen.routName);
                            },
                          ),
                          buildRowTile(
                            Icon(Icons.sort_by_alpha),
                            () {},
                          ),
                          buildRowTile(
                            Icon(Icons.view_array_outlined),
                            () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  buildRowTile(Icon icon, Function onPressed) {
    return IconButton(
      iconSize: 40,
      color: Colors.white,
      onPressed: onPressed,
      icon: icon,
    );
  }
}
