import 'package:flutter/material.dart';

import 'package:adorae/widgets/appbar_header_widget.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = '/about-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            AppBarHeader(
              title: 'About',
            ),
            buildRow(
              'Data Policy',
              () => null,
            ),
            buildRow(
              'Terms of use',
              () => null,
            ),
            buildRow(
              'Open-Source libraries',
              () => null,
            ),
          ],
        ),
      ),
    );
  }

  buildRow(String text, Function onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: onTap,
            icon: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
