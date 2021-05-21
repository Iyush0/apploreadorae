import 'dart:convert';

import 'package:adorae/api/api.dart';
import 'package:adorae/screens/19_upload_story_screen.dart';
import 'package:adorae/screens/23_product_detail_screen.dart';
import 'package:adorae/screens/43_profile_screen.dart';
import 'package:adorae/screens/friends_profile_screen.dart';
import 'package:adorae/screens/home_screen.dart';
import 'package:adorae/widgets/custom-appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import '26_notifications_screen.dart';
import 'authentication/login/login_Screen.dart';
import 'comments.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home-page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GetApi api = GetApi();
  int i=0;
  bool _tapped = false;
  var totalNoOfPosts;
  Color _like = Colors.grey[400];
  var data=[], _imageUrl, _mycaption;
  UserDetails postOwnerDetails;
  getPostDetails(String uid)async{
     postOwnerDetails= await api.getDetailsById(uid);
     if(postOwnerDetails==null)
       {
         print("No data");
       }
     else
       {

         print(postOwnerDetails);

       }
  }
  Future<dynamic>_getdiscoverdetails() async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var res = await http.get(
        "http://appl-env.eba-nifmmhk2.us-east-2.elasticbeanstalk.com/user/discover",
        headers: header);
    if (res.statusCode == 200) {
       totalNoOfPosts = data.length;
      return data = jsonDecode(res.body) ;
    } else {
      showToast("data does not exist");
    }
  }
  @override
  void initState() {
    // TODO: implement initState
   print(userId);
   _getdiscoverdetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Widget story(Widget icon) {
      return Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: width * 0.015, right: width * 0.01),
            height: height * 0.97,
            width: width * 0.2,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR78JoZvgPmDNOr0ggRxCfO4khzCO7lGXvhyHle3CmedCeFUdaAud4dJsuF1jhM0Ww1fdw&usqp=CAU",
                ),
              ),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: Colors.grey[200],
            ),
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: icon,
          )
        ],
      );
    }

    return Scaffold(
      // bottomNavigationBar: CustomBottomAppBar(),
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.grey[600],
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(NotificationScreen.routeName);
                  },
                ),
                Text(
                  'Adorae',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 30,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.chat_outlined,
                    color: Colors.grey[600],
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            Divider(
              color: Colors.black,
              // height: 1.0,
              thickness: 1.0,
            ),
            SizedBox(height: height * 0.02),
            Container(
              height: height * 0.08,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: <Widget>[
                  story(
                    IconButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(UploadStoryScreen.routeName);
                      },
                      icon: Icon(Icons.add),
                    ),
                  ),
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

            SizedBox(height: height * 0.02),
           cards(
             "prie9",
             "Mumbai",
             150,
             200,
             9,
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR78JoZvgPmDNOr0ggRxCfO4khzCO7lGXvhyHle3CmedCeFUdaAud4dJsuF1jhM0Ww1fdw&usqp=CAU",
             height,
             width,
           ),
            SizedBox(height: height * 0.02),
          ],
        ),
      ),
    );
  }

  Widget _showPopupMenu() {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(100, 100, 50, 0),
      items: [
        PopupMenuItem<Widget>(
            child: FlatButton(
              onPressed: () {},
              child: Text('Turn On Post Notification'),
            ),
            value: Text('Turn On Post Notification')),
        PopupMenuItem<Widget>(
            child: FlatButton(
              onPressed: () {
                showDialog();
              },
              child: Text('Report Post'),
            ),
            value: Text('Report Post')),
      ],
      elevation: 8.0,
    );
  }

  void showDialog() {
    showGeneralDialog(
      barrierLabel: "OTP",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 300,
            width: 700,
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20.0),
                  Icon(
                    Icons.check_circle_outline,
                    size: 60,
                    color: Color(0xff3aafa9),
                  ),
                  SizedBox(height: 20.0),
                  Center(
                    child: Text(
                      "Thanks for reporting this post",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20, top: 30),
                    child: Text(
                      """We use spam reports as a signal to understand problems
we're having with spam on Instagram. If you think that this
    post violates our Community Guidelines and should be 
                       removed , mark it as inappropriate""",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff7f7f7f)),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  FlatButton(
                    onPressed: () {},
                    child: Center(
                      child: Text(
                        "Show Post",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Color(0xff3aafa9)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                ],
              ),
            ),
            margin: EdgeInsets.only(bottom: 240, left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }
  Widget cards(String username, String place, int likes, int views,
      int comments, String profilepic, height, width)
  {
    return FutureBuilder(
      future: _getdiscoverdetails(),
      builder: (context,snapshot){
      //  if(snapshot.connectionState==ConnectionState.done)
          {
            if(snapshot.hasData)
              {
                return  ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index)  {
                    if(index==null)
                      {
                        return Center(child: CircularProgressIndicator(),);
                      }
                        _imageUrl = snapshot.data[index]['imageUrl'].toString();
                        _mycaption = snapshot.data[index]['postCaption'].toString();
                         getPostDetails(snapshot.data[index]['user']);
                    return Container(
                      child: Card(
                        elevation: 0.5,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          // physics:
                          // BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                          children: <Widget>[
                            SizedBox(height: 8),
                            Row(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(FriendsProfileScreen.routeName);
                                  },
                                  child: Container(
                                    height: height * 0.07,
                                    width: width * 0.12,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          profilepic,
                                        ),
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                      color: Colors.grey[200],
                                    ),
                                  ),
                                ),
                                SizedBox(width: width * 0.013),
                                Column(
                                  children: [
                                    Text(
                                     // postOwnerDetails.username
                                  postOwnerDetails==null?'Bot123':postOwnerDetails.username
                                      ,
                                      style: TextStyle(
                                          fontSize: height * 0.02,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                    SizedBox(height: height * 0.005),
                                    Padding(
                                      padding: EdgeInsets.only(left: width * 0.015),
                                      child: Text(
                                       snapshot.data[index]['location'],
                                        style: TextStyle(
                                            fontSize: height * 0.015,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                                Flexible(
                                  child: Container(),
                                ),
                                IconButton(
                                  icon: SvgPicture.asset(
                                      'assets/icons/show-more-button-with-three-dots.svg'),
                                  onPressed: () {
                                    _showPopupMenu();
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.02),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(ProductDetailScreen.routeName);
                              },
                              child: Container(
                                height: height * 0.5,
                                width: width * 0.08,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      _imageUrl??
                                     ''
                                    ),
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  color: Colors.grey[200],
                                ),
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.04),
                              child: Text(
                                _mycaption,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: height * 0.02),
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                            Row(
                              children: <Widget>[
                                SizedBox(width: width * 0.02),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _tapped = !_tapped;
                                      if (_tapped == true) {
                                        _like = Colors.red;
                                      } else {
                                        // _tapped = false;
                                        _like = Colors.grey[400];
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color: _like,
                                    size: height * 0.03,
                                  ),
                                ),
                                SizedBox(width: width * 0.006),
                                IconButton(
                                  onPressed: () async {
                                    // await _api.getData();
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (context) {
                                      return Comments();
                                    }));
                                  },
                                  icon: Icon(
                                    Icons.comment_bank_rounded,
                                    color: Colors.grey[400],
                                    size: height * 0.03,
                                  ),
                                ),
                                SizedBox(width: width * 0.006),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.share_rounded,
                                    color: Colors.grey[400],
                                    size: height * 0.03,
                                  ),
                                ),
                                Flexible(child: Container()),
                                IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset('assets/icons/1.svg'),
                                  // Icon(
                                  // Icons.bookmark_border_outlined,
                                  // color: Colors.grey[400],
                                  // size: 20.0,
                                  // ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            return Container(child: Text("No Data"));
          }
        return Center(child: CircularProgressIndicator());
      },

    );
  }
}
