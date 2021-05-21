import 'package:adorae/screens/27_follow_request.dart';
import 'package:adorae/widgets/appbar_header_widget.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  static const routeName = '/notification';
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarHeader(
                title: 'Notifications',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(FollowRequest.routeName);
                  },
                  child: Text(
                    'Follow Requests',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, bottom: 16),
                child: Text(
                  'Suggestions For You',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    buildRowTile(
                      'Tracy L. Ramirez',
                      'trcyRam',
                      'Follow',
                    ),
                    buildRowTile(
                      'Tracy L. Ramirez',
                      'trcyRam',
                      'Follow',
                    ),
                    buildRowTile(
                      'Tracy L. Ramirez',
                      'trcyRam',
                      'Follow',
                    ),
                    buildRowTile(
                      'Tracy L. Ramirez',
                      'trcyRam',
                      'Follow',
                    ),
                    buildRowTile(
                      'Tracy L. Ramirez',
                      'trcyRam',
                      'Follow',
                    ),
                    buildRowTile(
                      'Tracy L. Ramirez',
                      'trcyRam',
                      'Follow',
                    ),
                    buildRowTile(
                      'Tracy L. Ramirez',
                      'trcyRam',
                      'Following',
                    ),
                    buildRowTile(
                      'Tracy L. Ramirez',
                      'trcyRam',
                      'Follow',
                    ),
                    buildRowTile(
                      'Tracy L. Ramirez',
                      'trcyRam',
                      'Following',
                    ),
                    buildRowTile(
                      'Tracy L. Ramirez',
                      'trcyRam',
                      'Following',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildRowTile(
    String title,
    String subtitle,
    String title2,
  ) {
    return Row(
      children: [
        Expanded(
          child: ListTile(
            leading: CircleAvatar(
              // foregroundColor: Colors.blue,
              backgroundColor: Colors.white,
              radius: 30,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(subtitle),
          ),
        ),
        RaisedButton(
          color: Color(0xff3AAFA9),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(34.0)),
          onPressed: () {},
          child: Text(
            title2,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
