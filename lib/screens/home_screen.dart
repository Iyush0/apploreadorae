import 'package:adorae/screens/28_add_post_screen.dart';
import 'package:adorae/screens/43_profile_screen.dart';
import 'package:adorae/screens/blogs.dart';
import 'package:adorae/screens/search.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'homepage.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _indexselected = 0;

  final List<Widget> _widgetOptions = [
    HomePage(),
    Search(),
    BlogsScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        onPressed: () {
          Navigator.of(context).pushNamed(AddPostScreen.routName);
        },
        // tooltip: 'add post',
        child: SvgPicture.asset("assets/icons/Group 1436.svg"),
      ),
      body: Center(
        child: _widgetOptions[_indexselected],
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 6,
        elevation: 6,
        shape: CircularNotchedRectangle(),
        child: Row(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home_outlined),
              // color: Colors.white,
              onPressed: () {
                setState(() {
                  _indexselected = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              // color: Colors.white,
              onPressed: () {
                setState(() {
                  _indexselected = 1;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.ac_unit),
              // color: Colors.white,
              onPressed: () {
                setState(() {
                  _indexselected = 2;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              // color: Colors.white,
              onPressed: () {
                setState(() {
                  _indexselected = 3;
                });
              },
            ),
          ],
        ),
        // color: Colors.white,
      ),
    );
  }
}
