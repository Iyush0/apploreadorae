import 'dart:convert';
import 'dart:io';

import 'package:adorae/models/file.dart';
import 'package:adorae/screens/31_tag_items_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage_path/storage_path.dart';

String currImagePath,currImageName;
class AddPostScreen extends StatefulWidget {
  static const routName = '/add-post';
  final String title;

  const AddPostScreen({Key key, this.title}) : super(key: key);
  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  List<FileModel> files=[];
  FileModel selectedModel;
  String image;
  @override
  void initState() {
    super.initState();
    getImagesPath();
  }

  getImagesPath() async {
    var imagePath = await StoragePath.imagesPath;
    var images = jsonDecode(imagePath) as List;
    files = images.map<FileModel>((e) => FileModel.fromJson(e)).toList();
    if (files != null && files.length > 0) {
      setState(() {
        selectedModel = files[0];
        image = files[0].files[0];
      });
    }
  }
  void setPreferences()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('postedImage', image.toString());
    prefs.setString('postedImagePath', currImagePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(currentIndex: 0, items: [
        BottomNavigationBarItem(
          icon: Text("My Item"),
          activeIcon: Text("Library"),
          title: Container(
            height: 0.0,
          ),
        ),
        BottomNavigationBarItem(
          icon: Text("Instagram"),
          activeIcon: Text("Insta"),
          title: Container(
            height: 0.0,
          ),
        ),
        BottomNavigationBarItem(
          icon: Text("Photo"),
          activeIcon: Text("Photo"),
          title: Container(
            height: 0.0,
          ),
        ),
      ]),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.clear),
                    SizedBox(width: 10),
                    DropdownButtonHideUnderline(
                        child: DropdownButton<FileModel>(
                      items: getItems(),
                      onChanged: (FileModel d) {
                        assert(d.files.length > 0);
                        image = d.files[0];
                        setState(() {
                          selectedModel = d;
                        });
                      },
                      value: selectedModel,
                    ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: (){
                      currImagePath = File(image).path;
                      currImageName  = image;
                      setPreferences();
                      print(currImagePath);
                      Navigator.of(context).pushNamed(TagItemsScreen.routeName);
                    },
                  ),
                )
              ],
            ),
            Divider(),
            Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: image != null
                    ? Image.file(File(image),
                        height: MediaQuery.of(context).size.height * 0.45,
                        width: MediaQuery.of(context).size.width)
                    : Container()),
            Divider(),
            selectedModel == null && selectedModel.files.length < 1
                ? Container()
                : Expanded(
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.38,
                      child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0,
                          ),
                          itemBuilder: (_, i) {
                            var file = selectedModel.files[i];
                            return GestureDetector(
                              child: Image.file(
                                File(file),
                                fit: BoxFit.cover,
                              ),
                              onTap: () {
                                setState(() {
                                  image = file;
                                });
                              },
                            );
                          },
                          itemCount: selectedModel.files.length),
                    ),
                )
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem> getItems() {
    return files
            .map((e) => DropdownMenuItem(
                  child: Text(
                    e.folder,
                    style: TextStyle(color: Colors.black),
                  ),
                  value: e,
                ))
            .toList() ??
        [];
  }
}
