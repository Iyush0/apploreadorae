import 'dart:convert';
import 'package:adorae/screens/43_profile_screen.dart';
import 'package:adorae/screens/authentication/login/login_Screen.dart';
import 'package:adorae/screens/authentication/signup/signup_Screen.dart';
import 'package:adorae/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String baseUrl = 'http://appl-env.eba-nifmmhk2.us-east-2.elasticbeanstalk.com';
String id = '608c144d991d3b217813af99';
GetApi get1= GetApi();
String userId;
UserDetails currUser;
class GetApi {
  final discover = '$baseUrl/user/discover';
  final details = '$baseUrl/user/details/';
  final detailsById = '$baseUrl/user/details';
  final comments = '$baseUrl/comment/view';
  final viewPost =
      ' http://appl-env.eba-nifmmhk2.us-east-2.elasticbeanstalk.com/product/view';
  getData() async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };

    var res = await http.get(discover, headers: header);
    print(res.body.runtimeType);
    if (res.statusCode == 200) {
      print("discover details: " + res.body);
      var data = jsonDecode(res.body);
    }
  }

  getMyPost() async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };

    var res = await http.get(viewPost, headers: header);
    print(res.body.runtimeType);
    if (res.statusCode == 200) {
      print("my post details: " + res.body);
      var data = jsonDecode(res.body);
    }
  }

  getComments() async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };

    var res = await http.get(comments, headers: header);
    print(res.body.runtimeType);
    print(res.body);

    print('comments');

    print("comments: " + jsonDecode(res.body));
  }
  Future<List<UserDetails>> getDetails()async
  {
    Map<String,String> header = {
      'Content-type':"application/json",
    };
    var res = await http.get(details,headers: header);
    var data = jsonDecode(res.body);
    List<UserDetails> allusers;

    for(int i=0;i<data.length;i++)
      {
        if(data[i]!=null)
          {
          var x = UserDetails.fromJson(data[i]);
           allusers.add(x);
          }
      }
  //  print(allusers.length);
   return allusers;
  }

 Future<UserDetails> getDetailsById(String uid) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };

    var res = await http.get(detailsById + "/$uid", headers: header);
    var data = jsonDecode(res.body);
    UserDetails currUser;
    print(data);
   if(data!=null)
     {
       currUser = new UserDetails.fromJson(data);
       return currUser;
     }
     return null;
    if (res.statusCode == 200) {
      print('details by id');
    } else {
      print('details by id fail');
    }
  }
}

class PostApi {
  final signup = '$baseUrl/user/register';
  final login = '$baseUrl/user/login';
  final editProfilewithoutProfile = '$baseUrl/user/editprofile';
  final editProfilewithProfile = '$baseUrl/user/editprofile/withpp';
  final comments = '$baseUrl/comment/add';

  postData(age, gender, username, email, name, password) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };

    var _res = await http.post(
      signup,
      headers: header,
      body: json.encode({
        "age": "$age",
        "gender": "$gender",
        "username": "$username",
        "email": "$email",
        "auth": "$password",
        "name": "$name",
        "password": "$password",
      }),
    );
    print("signup: " + _res.statusCode.toString());
    print("sing up body: " + _res.body);

    // print('discovering users');

    // print(jsonDecode(_res.body));
  }

  postComments(comments) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };

    var _res = await http.post(comments, headers: header, body: {
      "id": "$id",
      "comments": "$comments",
    });
    print("comments: " + _res.statusCode.toString());
    print("comments body: " + _res.body);

    // print('discovering users');

    // print(jsonDecode(_res.body));
  }

  postLogin(email, password, context) async {
    Map<String, String> header = {
      'Content-Type': 'application/json',
    };
    var _res = await http.post(login,
        headers: header,
        body: json.encode({
          "email": "$email",
          "password": "$password",
        }));
    if (_res.statusCode == 200) {
     var data = jsonDecode(_res.body);
     userId = data['userid'];
     print(userId);
     get1.getDetailsById(userId).then((value) => print(value.followersId));
     
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return HomeScreen();
      }));
    } else {
      showToast("Please register");
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return SignUp();
      }));
    }
  }

  postEditProfilewithoutPic(username, bio, age, context) async {
    Map<String, String> header = {
      'Content-Type': 'application/json',
    };

    var _res = await http.post(editProfilewithoutProfile,
        headers: header,
        body: json.encode({
          "username": "$username",
          "id": "$id",
          "bio": "$bio",
          "age": "$age",
        }));
    print("edit profile: " + _res.statusCode.toString());
    if (_res.statusCode == 200) {
      print("edit prifile body: " + _res.body.toString());
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return ProfileScreen();
      }));
    } else {
      showToast("Please re-enter fields");
      print("edit update fail");
    }
  }

  postEditProfilewithPic(username, bio, age, file, context) async {
    Map<String, String> header = {
      'Content-Type': 'application/json',
    };

    var _res = await http.post(editProfilewithProfile,
        headers: header,
        body: json.encode({
          "attach": "$file",
          "username": "$username",
          "id": "$id",
          "bio": "$bio",
          "age": "$age",
        }));
    print("edit profile: " + _res.statusCode.toString());
    if (_res.statusCode == 200) {
      print("edit prifile body: " + _res.body.toString());
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return ProfileScreen();
      }));
    } else {
      showToast("Please re-enter fields");
      print("edit update fail");
    }
  }
}

class UserDetails
{

  bool status;
  List<dynamic>badge=[];
  List<dynamic>followersId=[];
  List<dynamic>followRequestsId=[];
  List<dynamic>following=[];
  List<dynamic>postId=[];
  List<dynamic>closet=[];
  List<dynamic>combine=[];
  List<dynamic>bookmarks=[];
  List<dynamic>blog=[];
  String id;
  String age;
  String gender;
  String username;
  String name;
  String email;
  String storyControl;
  dynamic createdDate;
  dynamic salt;
  dynamic hash;
  UserDetails(
      {this.status,
        this.badge,
        this.followersId,
        this.followRequestsId,
        this.postId,
        this.closet,
        this.combine,
        this.bookmarks,
        this.blog,
        this.id,
        this.age,
        this.gender,
        this.username,
        this.following,
        this.name,
        this.email,
        this.storyControl,
        this.createdDate,
        this.salt,
        this.hash,
        });
  factory UserDetails.fromJson(Map<String,dynamic>json){
    return new UserDetails(
        status: json['status']==null?false:json['status'],
        id : json['_id']??'',
        age : json['age']??'',
        followRequestsId: List<String>.from(json['followrequests']??[]),
        followersId: json['followers']??[],
        postId: List<String>.from(json['posts']??[]),
        gender : json['gender']??'',
        username : json['username']??'',
        name : json['name']??'',
        email : json['email']??'',
        storyControl : json['storyControl']??'',
        createdDate : json['createdDate']??'',
        salt : json['salt']??'',
        hash : json['hash']??" ",
    );
  }
}
class Followers
{
   String id;
   String name;
   String email;
   Followers({this.id,this.name,this.email});
   factory Followers.fromJson(Map<String,dynamic>json)
   {
     return Followers(
       id: json['_id'],
       name: json['name'],
       email: json['email'],
     );
   }
}