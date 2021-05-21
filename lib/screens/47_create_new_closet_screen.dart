import 'package:flutter/material.dart';

class CreateNewCloset extends StatefulWidget {
  static const routeName = '/create-new-closet';
  @override
  _CreateNewClosetState createState() => _CreateNewClosetState();
}

class _CreateNewClosetState extends State<CreateNewCloset> {
  final _usernameformKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
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
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Text(
                    'Create New Closet',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(),
              ],
            ),
            closetName(),
            addCloset(),
          ],
        ),
      ),
    );
  }

  Widget closetName() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(23.0, 50.0, 23.0, 20.0),
      child: Form(
        key: _usernameformKey,
        child: TextFormField(
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          validator: null,
          controller: _usernameController,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(top: 22, bottom: 22, left: 25, right: 15),
            hintText: "Enter closet name",
            hintStyle: TextStyle(
              color: Colors.grey[500],
            ),
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 16.0, color: Colors.lightBlue.shade50),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget addCloset() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
      child: Container(
        alignment: Alignment.center,
        child: RaisedButton(
          onPressed: () {
            // Navigator.of(context)
            //     .pushReplacement(MaterialPageRoute(builder: (context) {
            //   return Home();
            // }));
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
                "Add",
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
