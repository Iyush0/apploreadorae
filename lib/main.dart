import 'package:adorae/screens/11_create_username_screen.dart';
import 'package:adorae/screens/37_filter_category_screen.dart';
import 'package:adorae/screens/43_profile_screen.dart';
import 'package:adorae/screens/49_editprofile_screen.dart';
import 'package:adorae/screens/authentication/login/login_Screen.dart';
import 'package:adorae/screens/home_screen.dart';
import 'package:adorae/screens/search.dart';
import 'package:camera/camera.dart';

import 'package:flutter/material.dart';

import 'package:adorae/components/routes.dart';

List<CameraDescription> cameras;

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Login.routeName,
      // home: SignUpUsername(),
      routes: routes,
    );
  }
}
