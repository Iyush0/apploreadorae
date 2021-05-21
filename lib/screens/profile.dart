// import 'package:flutter/material.dart';

// import '53_settings-page.dart';

// class Profile extends StatefulWidget {
//   @override
//   _ProfileState createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       bottomNavigationBar: RaisedButton(
//         onPressed: () {
//           fashionFreakDialog(height, width);
//         },
//         child: Text("fashion freak dialog"),
//       ),
//       appBar: AppBar(
//         actions: [
//           IconButton(
//               icon: Icon(Icons.settings),
//               onPressed: () {
//                 Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (context) {
//                   return SettingPage();
//                 }));
//               })
//         ],
//       ),
//       body: Center(child: Text("profile page/")),
//     );
//   }

//   void fashionFreakDialog(height, width) {
//     showGeneralDialog(
//       barrierLabel: "Fashion Freak",
//       barrierDismissible: true,
//       barrierColor: Colors.black.withOpacity(0.9),
//       transitionDuration: Duration(milliseconds: 700),
//       context: context,
//       pageBuilder: (_, __, ___) {
//         return Align(
//           alignment: Alignment.bottomCenter,
//           child: Container(
//             height: height * 0.4,
//             width: width * 0.9,
//             child: Material(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(32.0),
//               ),
//               child: Column(
//                 children: [
//                   SizedBox(height: 20.0),
//                   Icon(
//                     Icons.check_circle_outline,
//                     size: 40,
//                     color: Color(0xff3aafa9),
//                   ),
//                   SizedBox(height: height * 0.03),
//                   Center(
//                     child: Text(
//                       "Fashion Freak",
//                       style: TextStyle(
//                           fontSize: height * 0.027,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.black),
//                     ),
//                   ),
//                   Padding(
//                     padding:
//                         EdgeInsets.only(left: width * 0.02, top: height * 0.02),
//                     child: Text(
//                       """Lorem ipsum dolor sit amet, consectetur adipiscing elit.
//       Phasellus lobortis elit ac dictum luctus. Proin 
//                 non vestibulum ante sodales vitae.""",
//                       style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w600,
//                           color: Color(0xff7f7f7f)),
//                     ),
//                   ),
//                   SizedBox(height: height * 0.03),
//                   Center(
//                     child: Text(
//                       "How can you earn?",
//                       style: TextStyle(
//                           fontSize: height * 0.02,
//                           decoration: TextDecoration.underline,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(
//                         left: width * 0.02,
//                         top: height * 0.02,
//                         bottom: height * 0.02),
//                     child: Text(
//                       """Lorem ipsum dolor sit amet, consectetur adipiscing elit.
//                 Phasellus lobortis elit ac dictum luctus.""",
//                       style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w600,
//                           color: Color(0xff7f7f7f)),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             margin: EdgeInsets.only(bottom: 240, left: 20, right: 20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(40),
//             ),
//           ),
//         );
//       },
//       transitionBuilder: (_, anim, __, child) {
//         return SlideTransition(
//           position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
//           child: child,
//         );
//       },
//     );
//   }
// }
