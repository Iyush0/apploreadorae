import 'package:adorae/components/colors.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const CommonButton({Key key, this.title, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 300,
      child: RaisedButton(
        color: kPrimaryColor,
        onPressed: onTap,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(34.0)),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
