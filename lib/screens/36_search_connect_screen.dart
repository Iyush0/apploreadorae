import 'package:adorae/widgets/appbar_header_widget.dart';
import 'package:flutter/material.dart';

class ConnectWithFbScreen extends StatefulWidget {
  @override
  _ConnectWithFbScreenState createState() => _ConnectWithFbScreenState();
}

class _ConnectWithFbScreenState extends State<ConnectWithFbScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            AppBarHeader(title: 'Adorae'),
            name(),
            nextButton(),
          ],
        ),
      ),
    );
  }

  Widget name() {
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
            suffixIcon: Icon(Icons.search),
            // icon: Icon(
            //   Icons.email_outlined,
            //   color: Colors.black,
            // ),
            // fillColor: Colors.grey[200],
            // filled: true,
            contentPadding:
                EdgeInsets.only(top: 22, bottom: 22, left: 25, right: 15),
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

  Widget nextButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 20.0),
      child: Container(
        alignment: Alignment.center,
        // height: 150,
        // width: 300,
        child: RaisedButton(
          onPressed: () {
            // if (_nameformKey.currentState.validate()) {
            //   Navigator.of(context)
            //       .pushReplacement(MaterialPageRoute(builder: (context) {
            //     return SignUpNewPass();
            //   }));
            // }
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(34.0)),
          padding: EdgeInsets.all(0.0),
          child: Ink(
            decoration: BoxDecoration(
                color: Color(0xff3AAFA9),
                borderRadius: BorderRadius.circular(34.0)),
            child: Container(
              constraints: BoxConstraints(maxWidth: 310.0, maxHeight: 60.0),
              alignment: Alignment.center,
              child: Text(
                "Connect with Facebook",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
