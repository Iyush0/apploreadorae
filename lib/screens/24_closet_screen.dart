import 'package:adorae/widgets/button.dart';
import 'package:adorae/screens/home_screen.dart';
import 'package:adorae/widgets/appbar_header_widget.dart';
import 'package:adorae/widgets/choose_closet_widget.dart';
import 'package:adorae/widgets/closet_header.dart';
import 'package:flutter/material.dart';

class ClosetScreen extends StatelessWidget {
  static const routeName = '/closet-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarHeader(
              title: 'Closet',
            ),
            ClosetHeader(),
            ChooseCloset(),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: CommonButton(
                  title: 'Create A New Closet',
                  onTap: () {
                    Navigator.of(context).pushNamed(HomeScreen.routeName);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
