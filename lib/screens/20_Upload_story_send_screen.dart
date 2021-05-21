import 'dart:ui';

import 'package:adorae/components/colors.dart';
import 'package:flutter/material.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

class UploadStorySendScreen extends StatefulWidget {
  static const routeName = '/send-story';
  @override
  _UploadStorySendScreenState createState() => _UploadStorySendScreenState();
}

class _UploadStorySendScreenState extends State<UploadStorySendScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 75.0;

  @override
  void initState() {
    super.initState();

    _fabHeight = _initFabHeight;
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .6;
    return Material(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SlidingUpPanel(
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightClosed,
            parallaxEnabled: true,
            parallaxOffset: .5,
            body: _body(),
            panelBuilder: (sc) => _panel(sc),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0)),
            onPanelSlide: (double pos) => setState(() {
              _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                  _initFabHeight;
            }),
          ),
          Positioned(
            top: 0,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).padding.top,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _panel(ScrollController sc) {
    return ListView(
      controller: sc,
      children: <Widget>[
        // SizedBox(
        //   height: 12.0,
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 2,
              decoration: BoxDecoration(
                border: Border.all(),
                color: Colors.grey[300],
                // borderRadius: BorderRadius.all(
                //   Radius.circular(30.0),
                // ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16.0,
        ),
        // SizedBox(
        //   height: 36.0,
        // ),
        searchField(),
        Padding(
          padding: const EdgeInsets.only(left: 23, bottom: 8),
          child: Text(
            'Stories',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/girl.jpeg')),
          title: Text(
            'Your Story',
          ),
          trailing: RaisedButton(
            color: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: () {},
            child: Text(
              'Share',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        ListTile(
          leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/girl.jpeg')),
          title: Text('Inner Circle'),
          trailing: RaisedButton(
            color: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: () {},
            child: Text(
              'Share',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 23, top: 14, bottom: 10),
          child: Text(
            'Messages',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 400,
          child: ListView(
            children: [
              buildListTile('Tracy L. Ramirez', 'trcyRam'),
              buildListTile('Tracy L. Ramirez', 'trcyRam'),
              buildListTile('Tracy L. Ramirez', 'trcyRam'),
              buildListTile('Tracy L. Ramirez', 'trcyRam'),
              buildListTile('Tracy L. Ramirez', 'trcyRam'),
              buildListTile('Tracy L. Ramirez', 'trcyRam'),
              buildListTile('Tracy L. Ramirez', 'trcyRam'),
              buildListTile('Tracy L. Ramirez', 'trcyRam'),
            ],
          ),
        ),
      ],
    );
  }

  buildListTile(String title, String subtitle) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 30,
        backgroundImage: AssetImage('assets/images/profile.jpg'),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: RaisedButton(
        color: Colors.black,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(34.0)),
        onPressed: () {},
        child: Text(
          'Send',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget searchField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(23.0, 30.0, 23.0, 20.0),
      child: Form(
        key: _formKey,
        child: TextFormField(
          maxLines: 1,
          textInputAction: TextInputAction.next,
          obscureText: false,
          keyboardType: TextInputType.name,
          // validator: (value) {
          //   if (value.isEmpty) {
          //     return "required";
          //   } else {}
          // },
          controller: _nameController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            suffixIcon: Icon(Icons.people_alt),
            contentPadding:
                EdgeInsets.only(top: 12, bottom: 12, left: 25, right: 15),
            hintText: "Search",
            hintStyle: TextStyle(
              color: Colors.grey[500],
            ),
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 16.0, color: Colors.lightBlue.shade50),
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
        ),
      ),
    );
  }

  _body() {
    return Container(
      child: Column(children: [
        Container(
          child: Image.asset('assets/images/pic.jpg'),
        ),
      ]),
    );
  }
}
