// import 'package:flutter/material.dart';

// class SizeConfig {
// double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     double fontsizetitle = height * 0.03;
//     double fontsizeadorae = height * 0.035;
//     double fontsizedes = height * 0.02;
//     double fontsizeforgotpass = height * 0.02;
//     double fontsizebuttons = height * 0.02;
//     double fontsizetext = height * 0.015;

//     double leftpadding = width * 0.09;
//     double rightpadding = width * 0.09;
//   static MediaQueryData _mediaQueryData;
//   static double screenWidth;
//   static double screenHeight;
//   static double defaultSize;
  

//   void init(BuildContext context) {
//     _mediaQueryData = MediaQuery.of(context);
//     screenWidth = _mediaQueryData.size.width;
//     screenHeight = _mediaQueryData.size.height;
//   }
// }

// // Get the proportionate height as per screen size
// double getProportionateScreenHeight(double inputHeight) {
//   double screenHeight = SizeConfig.screenHeight;
//   return (inputHeight / 812.0) * screenHeight;
// }

// // Get the proportionate width as per screen size
// double getProportionateScreenWidth(double inputWidth) {
//   double screenWidth = SizeConfig.screenWidth;
//   return (inputWidth / 375.0) * screenWidth;
// }