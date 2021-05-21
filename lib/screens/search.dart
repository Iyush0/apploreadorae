import 'dart:convert';

import 'package:adorae/api/api.dart';
import 'package:adorae/screens/37_filter_category_screen.dart';
import 'package:adorae/screens/home_screen.dart';
import 'package:adorae/widgets/custom-appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;

import 'authentication/login/login_Screen.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var _imageUrl, data=[];
  String _caption = "";
  String _location = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getdiscoverdetails();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Widget story(Widget icon) {
      return Column(
        children: [
          Stack(
            children: <Widget>[
              Container(
                margin:
                    EdgeInsets.only(left: width * 0.025, right: width * 0.01),
                height: height * 0.086,
                width: width * 0.15,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR78JoZvgPmDNOr0ggRxCfO4khzCO7lGXvhyHle3CmedCeFUdaAud4dJsuF1jhM0Ww1fdw&usqp=CAU",
                    ),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  color: Colors.grey[200],
                ),
                alignment: Alignment.center,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: icon,
              ),
            ],
          ),
          SizedBox(height: height * 0.01),
          Text(
            "test",
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: height * 0.017,
                color: Colors.black),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: width * 0.037, top: height * 0.04),
            child: Text(
              "Buttoners",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: height * 0.03,
                  color: Colors.black),
            ),
          ),
          SizedBox(height: height * 0.025),
          Container(
            height: height * 0.2,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: <Widget>[
                story(null),
                story(null),
                story(null),
                story(null),
                story(null),
                story(null),
              ],
            ),
          ),
          // SizedBox(height: height * 0.02),
          Padding(
            padding: EdgeInsets.only(left: width * 0.037, top: height * 0.006),
            child: Text(
              "Looks",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: height * 0.03,
                  color: Colors.black),
            ),
          ),
          SizedBox(height: height * 0.025),
          Row(
            children: <Widget>[
              tiles("Category", 15, height, width),
              tiles("Brands", 10, height, width),
              tiles("Price", 10, height, width),
              tiles("Colors", 10, height, width),
              Flexible(child: Container()),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return FilterCategoryScreen();
                  }));
                },
                child: Text(
                  "Filters",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: height * 0.026,
                      color: Color(0xff3AAFA9)),
                ),
              ),
              SizedBox(width: width * 0.013),
            ],
          ),
          SizedBox(height: height * 0.025),
          // Row(
          //   children: [
          Expanded(child: searchcards(height, width)),
          //   ],
          // ),
        ],
      ),
    );
  }

  Future<dynamic>_getdiscoverdetails() async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };

    var res = await http.get(
        "http://appl-env.eba-nifmmhk2.us-east-2.elasticbeanstalk.com/user/discover",
        headers: header);
    print(res.body.runtimeType);
    if (res.statusCode == 200) {
      print("discover details: " + res.body);
     return data = jsonDecode(res.body) as List;
      print("data discover length: " + data.length.toString());
      setState(() {
        // _imageUrl = data[index]['imageUrl'].toString();
        // print("image url: " + _imageUrl.toString());
      });
    } else {
      showToast("data does not exist");
    }
  }

  Widget searchcards(height, width) {
    return FutureBuilder(
      future: _getdiscoverdetails(),
      builder: (context,snapshot){
       return  StaggeredGridView.countBuilder(
         crossAxisCount: 2,
         crossAxisSpacing: 10,
         mainAxisSpacing: 12,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context, index) {
            // setState(() {
            print("posts length: " + data.length.toString());
            _imageUrl = data[index]['imageUrl'].toString();
            print("image url: " + _imageUrl.toString());
            // });
            return Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: width * 0.03, right: width * 0.039),
                  height: height * 0.2,
                  width: width * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(_imageUrl ??
                          "https://admina.s3.amazonaws.com/attach-1618578123263%24download4.jfif%24.jfif"),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.grey[200],
                  ),
                  alignment: Alignment.center,
                ),
              ],
            );
          },
           staggeredTileBuilder: (index) {
             return StaggeredTile.count(1, index.isEven ? 1 : 1.4);
           }
        );
      },
    );
  }

  Widget tiles(String text, double margin, height, width) {
    return Container(
      height: height * 0.037,
      width: width * 0.145,
      margin: EdgeInsets.only(left: margin),
      decoration: BoxDecoration(
          color: Colors.grey[350],
          // border: Border.all(
          // color: Colors.red[500],
          // ),
          borderRadius: BorderRadius.all(Radius.circular(13))),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 13.0, color: Colors.black),
        ),
      ),
    );
  }
}
