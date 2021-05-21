import 'dart:convert';
import 'package:adorae/api/api.dart';
import 'package:adorae/screens/14_initial_suggestion_screen.dart';
import 'package:adorae/screens/53_settings-page.dart';
import 'package:adorae/widgets/46_myprofile_closet.dart';
import 'package:adorae/screens/home_screen.dart';
import 'package:adorae/widgets/myprofile_mypost_widget.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile-screen';
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  String _postUrl = "";

  final viewPost =
      'http://appl-env.eba-nifmmhk2.us-east-2.elasticbeanstalk.com/product/view';

  getMyPost() async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };

    var res = await http.get(viewPost, headers: header);
    print(res.body.runtimeType);
    if (res.statusCode == 200) {
      print("my post details: " + res.body);
      var data = jsonDecode(res.body);
      for (int i = 0; i < data.length; i++) {
        _postUrl = data[i]['imageUrl'];
      }

      print("image url my post" + _postUrl);
    }
  }
GetApi g1 = GetApi();
  @override
  void initState() {
    getMyPost();
    print(userId);
    g1.getDetailsById(userId);
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return
       Scaffold(
        // bottomNavigationBar: CustomBottomAppBar(),
        body: FutureBuilder(
          future: g1.getDetailsById(userId),
          builder:(context,snapshot)
          {
            if(snapshot.hasData)
              {
                return  SafeArea(
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Container(
                          height: height,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(border: Border.all()),
                                height: MediaQuery.of(context).size.height / 4,
                                width: MediaQuery.of(context).size.width,
                                child: Image.asset(
                                  'assets/images/girl.jpeg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: height * 0.17,
                          left: width * 0.08,
                          child: Container(
                            decoration: BoxDecoration(
                              // border: Border.all(),
                            ),
                            height: height * 0.06,
                            width: width * 0.85,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                buildCircleAvatar(
                                  Icon(
                                    Icons.account_circle_sharp,
                                  ),
                                      () => fashionFreakDialog(height, width),
                                ),
                                buildCircleAvatar(
                                  Icon(Icons.radio_button_on_rounded),
                                      () {},
                                ),
                                buildCircleAvatar(
                                  Icon(Icons.ac_unit),
                                      () {},
                                ),
                                buildCircleAvatar(
                                  Icon(Icons.linked_camera_outlined),
                                      () {},
                                ),
                                buildCircleAvatar(
                                  Icon(Icons.accessibility_new_sharp),
                                      () {},
                                ),
                                buildCircleAvatar(
                                  Icon(Icons.favorite),
                                      () {},
                                ),
                                buildCircleAvatar(
                                  Icon(Icons.favorite),
                                      () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () => showDialog(),
                                icon: Icon(
                                  Icons.info_rounded,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.person_add_alt_1_rounded,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                onPressed: () => showModalSheet(
                                    height * 0.6, double.infinity, context),
                                icon: Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30, left: 20),
                          child: Container(
                            // padding: EdgeInsets.only(top: 50, left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data.username,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    snapshot.data.name,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                    style: TextStyle(
                                      color: Colors.white70,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height / 4.3,
                          left: 20,
                          child: Material(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            elevation: 6,
                            child: Container(
                              decoration: BoxDecoration(),
                              height: 60,
                              width: MediaQuery.of(context).size.width / 1 - 40,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'Posts',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        'Followers',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        'Following',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        '${snapshot.data.postId.length}',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 16),
                                        child: Text(
                                          '${snapshot.data.followersId.length}',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8),
                                        child: Text(
                                          '${snapshot.data.followRequestsId.length}',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height / 3,
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            child: TabBar(
                              labelStyle: TextStyle(fontWeight: FontWeight.bold),
                              indicatorColor: Colors.black,
                              labelColor: Colors.black,
                              controller: _tabController,
                              tabs: [
                                Tab(
                                  text: 'My Posts',
                                ),
                                Tab(
                                  text: 'BookMarks',
                                ),
                                Tab(
                                  text: 'Closet',
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height / 3 + 40,
                          child: Container(
                            // decoration: BoxDecoration(border: Border.all()),
                            height: MediaQuery.of(context).size.height / 1.8,
                            width: MediaQuery.of(context).size.width,
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                MyPosts(),
                                Center(child: Text('BookMarks')),
                                MyProfileCloset(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            return Center(child: CircularProgressIndicator());
          }
        ),
      );
  }

  buildCircleAvatar(Icon icon, Function onTap) {
    return CircleAvatar(
      child: IconButton(onPressed: onTap, icon: icon),
    );
  }

  void fashionFreakDialog(height, width) {
    showGeneralDialog(
      barrierLabel: "Fashion Freak",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: height * 0.4,
            width: width * 0.9,
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20.0),
                  Icon(
                    Icons.check_circle_outline,
                    size: 40,
                    color: Color(0xff3aafa9),
                  ),
                  SizedBox(height: height * 0.03),
                  Center(
                    child: Text(
                      "Fashion Freak",
                      style: TextStyle(
                          fontSize: height * 0.027,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: width * 0.02, top: height * 0.02),
                    child: Text(
                      """Lorem ipsum dolor sit amet, consectetur adipiscing elit.
      Phasellus lobortis elit ac dictum luctus. Proin 
                non vestibulum ante sodales vitae.""",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff7f7f7f)),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  Center(
                    child: Text(
                      "How can you earn?",
                      style: TextStyle(
                          fontSize: height * 0.02,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.02,
                        top: height * 0.02,
                        bottom: height * 0.02),
                    child: Text(
                      """Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                Phasellus lobortis elit ac dictum luctus.""",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff7f7f7f)),
                    ),
                  ),
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

  void showDialog() {
    showGeneralDialog(
      barrierLabel: "",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 180,
            width: 600,
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
              child: Column(
                children: [
                  buildListTile(Icons.cases, 'Blogger'),
                  buildListTile(Icons.call, '+019876543210'),
                  buildListTile(
                      Icons.location_on, '123 crossing Methew,Berlin'),
                ],
              ),
            ),
            margin: EdgeInsets.only(bottom: 300, left: 20, right: 20),
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

  ListTile buildListTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(
        icon,
        color: Color(0xff3AAFA9),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void showModalSheet(height, width, context) {
    showModalBottomSheet(
      barrierColor: Colors.black.withOpacity(0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          height: height * 0.36,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: height * 0.05,
              ),
              textButton(
                'Settings',
                () {
                  Navigator.of(context).pushNamed(SettingPage.routeName);
                },
              ),
              textButton(
                'Inner Circle',
                () {},
              ),
              textButton(
                'Discover People',
                () {
                  Navigator.of(context)
                      .pushNamed(InitialSuggestionScreen.routeName);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  textButton(String title, Function onTap) {
    return TextButton(
        onPressed: onTap,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
