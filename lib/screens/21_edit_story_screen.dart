import 'package:adorae/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:text_editor/text_editor.dart';

import 'home_screen.dart';

class UploadEditStoryScreen extends StatefulWidget {
  static const routName = 'edit-story';
  UploadEditStoryScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _UploadEditStoryScreenState createState() => _UploadEditStoryScreenState();
}

class _UploadEditStoryScreenState extends State<UploadEditStoryScreen> {
  final fonts = [
    'OpenSans',
    'Billabong',
    'GrandHotel',
    'Oswald',
    'Quicksand',
    'BeautifulPeople',
    'BeautyMountains',
    'BiteChocolate',
    'BlackberryJam',
    'BunchBlossoms',
    'CinderelaRegular',
    'Countryside',
    'Halimun',
    'LemonJelly',
    'QuiteMagicalRegular',
    'Tomatoes',
    'TropicalAsianDemoRegular',
    'VeganStyle',
  ];
  TextStyle _textStyle = TextStyle(
    fontSize: 50,
    color: Colors.white,
    fontFamily: 'Halimun',
  );
  String _text = 'Caption';
  TextAlign _textAlign = TextAlign.center;

  void _tapHandler(text, textStyle, textAlign) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: Duration(
        milliseconds: 400,
      ), // how long it takes to popup dialog after button click
      pageBuilder: (_, __, ___) {
        // your widget implementation
        return Container(
          color: Colors.black.withOpacity(0.4),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              // top: false,
              child: Container(
                child: TextEditor(
                  fonts: fonts,
                  text: text,
                  textStyle: textStyle,
                  textAlingment: textAlign,
                  // paletteColors: [
                  //   Colors.black,
                  //   Colors.white,
                  //   Colors.blue,
                  //   Colors.red,
                  //   Colors.green,
                  //   Colors.yellow,
                  //   Colors.pink,
                  //   Colors.cyanAccent,
                  // ],
                  // decoration: EditorDecoration(
                  //   doneButton: Icon(Icons.close, color: Colors.white),
                  //   fontFamily: Icon(Icons.title, color: Colors.white),
                  //   colorPalette: Icon(Icons.palette, color: Colors.white),
                  //   alignment: AlignmentDecoration(
                  //     left: Text(
                  //       'left',
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //     center: Text(
                  //       'center',
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //     right: Text(
                  //       'right',
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //   ),
                  // ),
                  onEditCompleted: (style, align, text) {
                    setState(() {
                      _text = text;
                      _textStyle = style;
                      _textAlign = align;
                    });
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Container(
              height: height,
              width: width,
              child: Image.asset(
                'assets/images/pic.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: height * 0.04,
              left: width * 0.8,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(HomeScreen.routeName);
                },
                child: Text(
                  'Done',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () => _tapHandler(_text, _textStyle, _textAlign),
                child: Text(
                  _text,
                  style: _textStyle,
                  textAlign: _textAlign,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
