import 'package:adorae/components/colors.dart';
import 'package:adorae/widgets/brand_gridview.dart';
import 'package:adorae/widgets/button.dart';
import 'package:flutter/material.dart';

class BrandCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        // Padding(
        //   padding: const EdgeInsets.only(right: 8),
        //   child: RaisedButton(
        //     color: Colors.white,
        //     textColor: Colors.blue,
        //     elevation: 8,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(30),
        //     ),
        //     onPressed: () {},
        //     child: Text('Reset All'),
        //   ),
        // ),
        // SizedBox(
        //   height: 10,
        // ),
        Container(
          height: height * 0.72,
          width: width,
          // color: Colors.red,
          child: BrandGridView(),
        ),
        // applyButton(),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: CommonButton(
            title: 'Apply',
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
