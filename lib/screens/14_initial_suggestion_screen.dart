import 'package:adorae/api/api.dart';
import 'package:adorae/components/colors.dart';
import 'package:adorae/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InitialSuggestionScreen extends StatefulWidget {
  static const routeName = '/discover';


  @override
  _InitialSuggestionScreenState createState() =>
      _InitialSuggestionScreenState();
}

class _InitialSuggestionScreenState extends State<InitialSuggestionScreen> {
  @override
  Future<void> initState()  {
    // TODO: implement initState
    super.initState();
    getAllUsersData();
  }
  List<UserDetails> allUsers=[];
  Future<void> getAllUsersData()async{
      allUsers = await  GetApi().getDetails();
    // print(allUsers.length);
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: FutureBuilder(
        future:getAllUsersData(),
        builder: (context,snapshot){
          return  Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: Text(
                          'Discover People',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(HomeScreen.routeName);
                          },
                          child: Text(
                            'Next',
                            style: TextStyle(fontSize: 20),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 32,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 27,
                              child: FaIcon(
                                FontAwesomeIcons.facebookF,
                                color: Colors.blue.shade500,
                                size: 40,
                              ),
                            ),
                          ),
                          title: Text(
                            'Find Facebook Friends',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text('Add your account'),
                        ),
                      ),
                      RaisedButton(
                        color: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(34.0)),
                        onPressed: () {},
                        child: Text(
                          'Find',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Color(0xffFC8F3C),
                          radius: 32,
                          child: CircleAvatar(
                            radius: 27,
                            backgroundColor: Colors.white,
                            child: FaIcon(
                              FontAwesomeIcons.instagram,
                              size: 40,
                              color: Color(0xffFD1D1D),
                            ),
                          ),
                        ),
                        title: Text(
                          'Connect with Instagram',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text('Add your account'),
                      ),
                    ),
                    RaisedButton(
                      color: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(34.0)),
                      onPressed: () {},
                      child: Text(
                        'Connect',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 27,
                            child: Icon(
                              Icons.people,
                              color: Colors.black,
                              size: 40,
                            ),
                          ),
                        ),
                        title: Text(
                          'Connect Contacts',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text('Follow People you know'),
                      ),
                    ),
                    RaisedButton(
                      color: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(34.0)),
                      onPressed: () {},
                      child: Text(
                        'Connect',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                ),
                buildRow(snapshot),
              ],
            ),
          );
        },
      ),
    );
  }

  buildRow(AsyncSnapshot snapshot) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: allUsers.length+1,
      scrollDirection: Axis.vertical,
      itemBuilder: (context,index){
        return Row(
          children: [
            Expanded(
              child: ListTile(
                leading: CircleAvatar(
                  // foregroundColor: Colors.blue,
                  backgroundColor: Colors.white,
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
                title: Text(
                  'aok',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('trcyRam'),
              ),
            ),
            RaisedButton(
              color: Colors.black,
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(34.0)),
              onPressed: () {},
              child: Text(
                'Follow',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },

    );
  }
}
