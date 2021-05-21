import 'package:adorae/widgets/button.dart';
import 'package:flutter/material.dart';

import 'color_gridview.dart';

class ColorCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // RaisedButton(
        //   color: Colors.white,
        //   textColor: Colors.blue,
        //   elevation: 8,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(30),
        //   ),
        //   onPressed: () {},
        //   child: Text('Reset All'),
        // ),
        ColorGridView(),
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: CommonButton(
            title: 'Apply',
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
