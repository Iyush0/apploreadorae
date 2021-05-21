import 'package:adorae/widgets/appbar_header_widget.dart';
import 'package:flutter/material.dart';

class FollowRequest extends StatelessWidget {
  static const routeName = '/follow-req';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBarHeader(
                title: 'Follow Requests',
              ),
              SizedBox(
                height: 20,
              ),
              buildRowTile(),
              buildRowTile(),
              buildRowTile(),
              buildRowTile(),
              buildRowTile(),
              buildRowTile(),
              buildRowTile(),
              buildRowTile(),
            ],
          ),
        ),
      ),
    );
  }

  buildRowTile() {
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
              'Prete Lisy',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('krjhviRck'),
          ),
        ),
        RaisedButton(
          color: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(34.0)),
          onPressed: () {},
          child: Text(
            'Follow',
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        RaisedButton(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(34.0)),
          onPressed: () {},
          child: Text(
            'Delete',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
