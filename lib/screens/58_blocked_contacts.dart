import 'package:adorae/widgets/appbar_header_widget.dart';
import 'package:adorae/widgets/custom-appbar.dart';
import 'package:flutter/material.dart';

class BlockedContacts extends StatefulWidget {
  @override
  _BlockedContactsState createState() => _BlockedContactsState();
}

class _BlockedContactsState extends State<BlockedContacts> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: followAppBar("Blocked Contacts", context),
      body: ListView(
        children: <Widget>[
          AppBarHeader(
            title: 'Blocked Contacts',
          ),
          SizedBox(height: height * 0.03),
          blockList(height, width),
          blockList(height, width),
          blockList(height, width),
          blockList(height, width),
        ],
      ),
    );
  }

  Widget blockList(height, width) {
    return ListTile(
      leading: Container(
        child: Card(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.white70,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.person_outline_outlined,
              color: Colors.grey,
            ),
          ),
        ),
      ),
      title: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: width * 0.4),
            child: Text(
              "user",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: height * 0.025),
            ),
          ),
          SizedBox(height: height * 0.01),
          Padding(
            padding: EdgeInsets.only(right: width * 0.4),
            child: Text(
              "dfghj",
              style: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w500,
                  fontSize: height * 0.02),
            ),
          ),
        ],
      ),
      trailing: unblockButton(),
    );
  }

  Widget unblockButton() {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(34.0)),
      color: Colors.black,
      onPressed: () {},
      child: Text(
        "Unblock",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
