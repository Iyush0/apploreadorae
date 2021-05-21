import 'package:adorae/widgets/appbar_header_widget.dart';
import 'package:adorae/widgets/custom-appbar.dart';
import 'package:flutter/material.dart';

class Comments extends StatefulWidget {
  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: followAppBar("Comments", context),
      body: ListView(
        children: <Widget>[
          AppBarHeader(title: 'Comments'),
          commentTile(height, width),
          commentTile(height, width),
          commentTile(height, width),
          commentTile(height, width),
        ],
      ),
    );
  }

  Widget commentTile(height, width) {
    return Card(
      elevation: 0.0,
      child: ListTile(
        leading: Card(
          elevation: 0.0,
          color: Colors.grey[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.person,
              color: Colors.grey[400],
            ),
          ),
        ),
        title: Column(
          children: [
            Row(
              children: [
                Text(
                  "Roselt Gyll",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: height * 0.019),
                ),
                Flexible(child: Container()),
                Text(
                  " 2 days ago",
                  style: TextStyle(
                      color: Colors.grey[300],
                      fontWeight: FontWeight.w400,
                      fontSize: height * 0.017),
                ),
              ],
            ),
            SizedBox(height: height * 0.01),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
              style: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w500,
                  fontSize: height * 0.0188),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: width * 0.06,
                  child: IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.all(0.0),
                    icon: Icon(
                      Icons.favorite_outline_sharp,
                      size: height * 0.02,
                      color: Color(0xff3AAFA9),
                    ),
                  ),
                ),
                Text(
                  "6",
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w500,
                      fontSize: height * 0.019),
                ),
                SizedBox(width: width * 0.07),
                Text(
                  "Reply",
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w500,
                      fontSize: height * 0.019),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
