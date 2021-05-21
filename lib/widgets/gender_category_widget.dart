import 'package:adorae/components/colors.dart';
import 'package:adorae/widgets/button.dart';
import 'package:flutter/material.dart';

import 'category_gridview.dart';

class GenderCategory extends StatefulWidget {
  @override
  _GenderCategoryState createState() => _GenderCategoryState();
}

class _GenderCategoryState extends State<GenderCategory> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Gender',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: RaisedButton(
                      color: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Female',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: SizedBox(
                      width: 65,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        onPressed: () {},
                        child: Text('Male'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: RaisedButton(
                      color: Colors.white,
                      textColor: Colors.blue,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      onPressed: () {},
                      child: Text('Reset All'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: height * 0.64,
              width: width,
              // color: Colors.red,
              child: CategoryGridView(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: CommonButton(
                title: 'Apply',
                onTap: () {},
              ),
            ),
            // applyButton(),
          ],
        ),
      ),
    );
  }
}
