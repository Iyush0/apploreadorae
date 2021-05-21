import 'package:adorae/screens/26_notifications_screen.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget appBar({PreferredSizeWidget bottom, context}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0.0,
    title: Text(
      "Adorae",
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w300,
        fontSize: 30,
      ),
    ),
    centerTitle: true,
    leading: IconButton(
      icon: Icon(
        Icons.notifications_none_outlined,
        color: Colors.grey[600],
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(NotificationScreen.routeName);
      },
    ),
    bottom: bottom,
    actions: <Widget>[
      IconButton(
        icon: Icon(
          Icons.chat_outlined,
          color: Colors.grey[600],
        ),
        onPressed: () {},
      ),
    ],
  );
}

Widget customAppBar(String title) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0),
    child: AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/Path 743.svg")),
      title: RichText(
        text: TextSpan(
          text: title,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25.0, color: Colors.black),
        ),
      ),
      centerTitle: true,
      actions: <Widget>[],
    ),
  );
}

Widget followAppBar(String title, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/Path 743.svg")),
      title: RichText(
        text: TextSpan(
          text: title,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25.0, color: Colors.black),
        ),
      ),
      centerTitle: true,
      actions: <Widget>[],
    ),
  );
}
