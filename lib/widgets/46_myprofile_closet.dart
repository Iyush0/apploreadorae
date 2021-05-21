import 'package:adorae/screens/47_create_new_closet_screen.dart';
import 'package:adorae/screens/43_profile_screen.dart';
import 'package:flutter/material.dart';

class MyProfileCloset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 40),
          width: width,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildContainer(height / 8, width / 2.2, Colors.white,
                      'Winter', Colors.redAccent),
                  buildContainer(height / 8, width / 2.2, Colors.white,
                      'Casual Wear', Colors.deepPurpleAccent),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildContainer(height / 8, width / 2.2, Colors.white,
                      'Summer', Colors.lightBlueAccent),
                  buildContainer(height / 8, width / 2.2, Colors.white,
                      'Inspiration', Colors.lightGreenAccent),
                ],
              ),
            ],
          ),
        ),
        addCloset(context),
      ],
    );
  }

  buildContainer(double height, double width, Color color, String text,
      Color containerColor) {
    return Container(
      child: Center(
          child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color,
        ),
      )),
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
            image: AssetImage('assets/images/girl.jpeg'),
          )),
    );
  }

  Widget addCloset(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
      child: Container(
        alignment: Alignment.center,
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(CreateNewCloset.routeName);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(34.0)),
          padding: EdgeInsets.all(0.0),
          child: Ink(
            decoration: BoxDecoration(
                color: Color(0xff3AAFA9),
                borderRadius: BorderRadius.circular(34.0)),
            child: Container(
              constraints: BoxConstraints(maxWidth: 300.0, maxHeight: 60.0),
              alignment: Alignment.center,
              child: Text(
                "Create A New Closet",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
