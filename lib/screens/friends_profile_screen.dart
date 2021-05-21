import 'package:adorae/screens/homepage.dart';
import 'package:adorae/screens/home_screen.dart';
import 'package:adorae/screens/53_settings-page.dart';
import 'package:adorae/widgets/46_myprofile_closet.dart';
import 'package:adorae/widgets/myprofile_mypost_widget.dart';
import 'package:flutter/material.dart';

class FriendsProfileScreen extends StatefulWidget {
  static const routeName = '/friends-profile-screen';
  @override
  _FriendsProfileScreenState createState() => _FriendsProfileScreenState();
}

class _FriendsProfileScreenState extends State<FriendsProfileScreen>
    with SingleTickerProviderStateMixin {
  var _selectOption;
  List<String> _option = [
    'following',
    'follow',
  ];
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      // bottomNavigationBar: MyBottomNavigationBar(),
      body: SafeArea(
        // top: false,
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
                        'assets/images/pic.jpg',
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
                        Icon(Icons.account_circle_sharp),
                        () {},
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
                decoration: BoxDecoration(
                    // border: Border.all(),
                    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(HomeScreen.routeName);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () => infoModalSheet(
                              height * 0.6, double.infinity, context),
                          icon: Icon(
                            Icons.info_rounded,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.chat,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () => showModalSheet(
                              height * 0.6, double.infinity, context),
                          icon: Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20),
                child: Container(
                  // padding: EdgeInsets.only(top: 50, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'michgutlier',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          'Michael G Gutlier',
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
                              '${176}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Text(
                                '${17}k',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Text(
                                '${76}k',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 280),
                child: Container(
                  // decoration: BoxDecoration(border: Border.all()),
                  height: height * 0.06,
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.all(4),
                        height: height * 0.3,
                        width: width * 0.56,
                        // decoration: BoxDecoration(border: Border.all()),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Followed by ',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              TextSpan(
                                text: 'bretty semma, ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              TextSpan(
                                text: 'prett lessa ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              TextSpan(
                                text: 'and 7 others',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20)),
                        width: width * 0.36,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            items: _option
                                .map((value) => DropdownMenuItem(
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueGrey[700]),
                                      ),
                                      value: value,
                                    ))
                                .toList(),
                            onChanged: (option) {
                              setState(() {
                                _selectOption = option;
                              });
                            },
                            value: _selectOption,
                            // hint: Text(
                            //   "Gender",
                            //   style: TextStyle(
                            //     color: Colors.grey[500],
                            //   ),
                            // ),
                            elevation: 0,
                            isExpanded: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 2.5,
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
                top: MediaQuery.of(context).size.height / 3 + 100,
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
      ),
    );
  }

  buildCircleAvatar(Icon icon, Function onTap) {
    return CircleAvatar(
      child: IconButton(onPressed: () {}, icon: icon),
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
          height: height * 0.65,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: height * 0.05,
              ),
              textButton(
                'Report',
                () {},
              ),
              textButton(
                'Block',
                () {},
              ),
              textButton(
                'Restrict',
                () {},
              ),
              textButton(
                'Hide your Story',
                () {},
              ),
              textButton(
                'Copy profile URL',
                () {},
              ),
              textButton(
                'Share this profile',
                () {},
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

  void infoModalSheet(height, width, context) {
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
          height: height * 0.65,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: height * 0.05,
              ),
              Center(
                child: Text(
                  'Michael G Gutierres',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                thickness: 2,
              ),
              buildRow(
                'Add to Close Friends List',
                () {},
              ),
              buildRow(
                'Notifications',
                () {},
              ),
              buildRow(
                'Mute',
                () {},
              ),
              buildRow(
                'Restrict',
                () {},
              ),
              TextButton(
                onPressed: () {},
                child: Text('Unfollow'),
              ),
            ],
          ),
        );
      },
    );
  }

  Row buildRow(String title, Function onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        IconButton(
          onPressed: onTap,
          icon: Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
}
