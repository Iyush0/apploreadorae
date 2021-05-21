import 'package:adorae/widgets/appbar_header_widget.dart';
import 'package:flutter/material.dart';

class AddPostFilter extends StatefulWidget {
  @override
  _AddPostFilterState createState() => _AddPostFilterState();
}

class _AddPostFilterState extends State<AddPostFilter> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarHeader(title: 'Filters'),
            Container(
              height: height * 0.6,
              width: width,
              child: Image.asset(
                'assets/images/pic.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
