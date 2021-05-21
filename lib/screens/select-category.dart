import 'package:adorae/widgets/appbar_header_widget.dart';
import 'package:adorae/widgets/custom-appbar.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';

import '69_are-you-business.dart';

class SelectCategory extends StatefulWidget {
  static const routeName = '/select-categories';
  @override
  _SelectCategoryState createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  List<String> _category = <String>[
    'category1',
    'category2',
    'category3',
  ];

  final _categoryformKey = GlobalKey<FormState>();
  final key = GlobalKey<AutoCompleteTextFieldState<String>>();

  var _selectedcategory;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: followAppBar("Select Category", context),
      body: ListView(
        children: <Widget>[
          AppBarHeader(title: 'Select Category'),
          Padding(
            padding: EdgeInsets.only(left: width * 0.075, top: height * 0.02),
            child: Text(
              """Choose a category that best describes what you do. You'll have the
                   options to display or hide this on your profile.""",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: height * 0.017,
                  color: Colors.grey[400]),
            ),
          ),
          SizedBox(
            height: height * 0.07,
          ),
          selectcategory(height, width),
          SizedBox(
            height: height * 0.5,
          ),
          doneButton(height),
        ],
      ),
    );
  }

  Widget selectcategory(height, width) {
    return Container(
      margin: EdgeInsets.fromLTRB(width * 0.1, 0.0, width * 0.1, 30.0),
      decoration: BoxDecoration(
        // color: Colors.black,
        border: Border.all(
          color: Colors.grey[500],
        ),
        borderRadius: BorderRadius.all(Radius.circular(29)),
      ),
      padding: EdgeInsets.fromLTRB(
          width * 0.021, height * 0.005, width * 0.017, height * 0.005),
      child: SimpleAutoCompleteTextField(
        key: key,
        suggestions: [
          "Artists",
          "Musician/Band",
          "Blogger",
          "Clothing(Brand)",
          "Community",
          "Cello ",
          "Digital Creator",
          "Education",
        ],
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, width * 0.01, 0.0),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: height * 0.04,
                  color: Colors.grey[200],
                ),
              ),
            ),
          ),
          contentPadding:
              EdgeInsets.fromLTRB(width * 0.01, height * 0.02, 0.0, 0.0),
          hintText: 'Select Category',
          hintStyle: TextStyle(
            color: Colors.grey[500],
            fontSize: height * 0.02,
          ),
        ),
      ),
    );
  }

  Widget doneButton(height) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Container(
        alignment: Alignment.center,
        // height: 150,
        // width: 300,
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return AreYouBusiness();
            }));
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(34.0)),
          padding: EdgeInsets.all(0.0),
          child: Ink(
            decoration: BoxDecoration(
                color: Color(0xff3AAFA9),
                borderRadius: BorderRadius.circular(34.0)),
            child: Container(
              constraints: BoxConstraints(maxWidth: 280.0, maxHeight: 50.0),
              alignment: Alignment.center,
              child: Text(
                "Done",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: height * 0.024,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
