import 'package:adorae/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FacebookButton extends StatelessWidget {
  final Function onTap;

  const FacebookButton({Key key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
      child: Container(
        alignment: Alignment.center,
        child: RaisedButton(
          onPressed: onTap,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(34.0)),
          padding: EdgeInsets.all(0.0),
          child: Ink(
            decoration: BoxDecoration(
                color: kfbButtonColor,
                borderRadius: BorderRadius.circular(34.0)),
            child: Container(
              constraints: BoxConstraints(maxWidth: 280.0, maxHeight: 50.0),
              alignment: Alignment.center,
              child: Row(
                children: [
                  SizedBox(
                    width: width * 0.05,
                  ),
                  FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Text(
                    "Login with Facebook",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
