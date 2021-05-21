import 'package:flutter/material.dart';

class AppBarHeader extends StatelessWidget {
  final String title;
  final Function onTap;
  final Widget child;

  const AppBarHeader({Key key, @required this.title, this.onTap, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            iconSize: 32,
            onPressed: () {
              Navigator.of(context).pop();
            }),
        Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          child: child,
        ),
      ],
    );
  }
}
