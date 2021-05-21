import 'package:adorae/widgets/appbar_header_widget.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarHeader(
              title: 'Help',
              
            ),
            buildRow(
              'Report a problem',
              () => null,
            ),
            buildRow(
              'Help Center',
              () => null,
            ),
            buildRow(
              'Support requests',
              () => null,
            ),
            buildRow(
              'Privacy & Security help',
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
          IconButton(onPressed: onTap, icon: Icon(Icons.arrow_forward_ios)),
        ],
      ),
    );
  }
}
