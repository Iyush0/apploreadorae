import 'package:adorae/screens/14_initial_suggestion_screen.dart';
import 'package:flutter/material.dart';

class AddtoHomeScreen extends StatefulWidget {
  static const routeName = '/add-to-home';
  @override
  _AddtoHomeScreenState createState() => _AddtoHomeScreenState();
}

class _AddtoHomeScreenState extends State<AddtoHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 70),
              Text(
                "Add to the home screen",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                ),
              ),
              Text(
                "We are low on space, High on Fashion",
                style: TextStyle(
                  color: Color(0xff3aafa9),
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 50),
              Icon(
                Icons.home_outlined,
                size: 300,
              ),
              SizedBox(height: 50),
              SizedBox(
                height: 60,
                width: 350,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: Color(0xff3aafa9),
                  onPressed: () {},
                  child: Center(
                    child: Text(
                      "Show Post",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(InitialSuggestionScreen.routeName);
                },
                child: Text('Not now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
