import 'package:flutter/material.dart';

import '../screens/authentication/login/login_Screen.dart';
import '../screens/37_filter_category_screen.dart';
import '../screens/14_initial_suggestion_screen.dart';
import '../screens/19_upload_story_screen.dart';
import '../screens/20_Upload_story_send_screen.dart';
import '../screens/21_edit_story_screen.dart';
import '../screens/22_story_control_screen.dart';
import '../screens/23_product_detail_screen.dart';
import '../screens/24_closet_screen.dart';
import '../screens/25_combine_screen.dart';
import '../screens/26_notifications_screen.dart';
import '../screens/27_follow_request.dart';
import '../screens/28_add_post_screen.dart';
import '../screens/31_tag_items_screen.dart';
import '../screens/32_button_choice.dart';
import '../screens/33_newpost_screen.dart';
import '../screens/34_advanced_Setting_screen.dart';
import '../screens/43_profile_screen.dart';
import '../screens/47_create_new_closet_screen.dart';
import '../screens/61_about_Screen.dart';
import '../screens/13_add-to-homescreen.dart';
import '../screens/friends_profile_screen.dart';
import '../screens/homepage.dart';
import '../screens/select-category.dart';
import '../screens/53_settings-page.dart';
import '../screens/home_screen.dart';

final Map<String, WidgetBuilder> routes = {
  NewPostScreen.routeName: (ctx) => NewPostScreen(),
  AdvancedSettingScreen.routeName: (ctx) => AdvancedSettingScreen(),
  CreateNewCloset.routeName: (ctx) => CreateNewCloset(),
  ProfileScreen.routeName: (ctx) => ProfileScreen(),
  AboutScreen.routeName: (ctx) => AboutScreen(),
  StoryControl.routeName: (ctx) => StoryControl(),
  UploadStorySendScreen.routeName: (ctx) => UploadStorySendScreen(),
  ClosetScreen.routeName: (ctx) => ClosetScreen(),
  CombineScreen.routeName: (ctx) => CombineScreen(),
  ButtonChoiceScreen.routeName: (ctx) => ButtonChoiceScreen(),
  UploadStoryScreen.routeName: (ctx) => UploadStoryScreen(),
  AddPostScreen.routName: (ctx) => AddPostScreen(),
  TagItemsScreen.routeName: (ctx) => TagItemsScreen(),
  UploadEditStoryScreen.routName: (ctx) => UploadEditStoryScreen(),
  HomePage.routeName: (ctx) => HomePage(),
  NotificationScreen.routeName: (ctx) => NotificationScreen(),
  ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
  InitialSuggestionScreen.routeName: (ctx) => InitialSuggestionScreen(),
  HomeScreen.routeName: (ctx) => HomeScreen(),
  FriendsProfileScreen.routeName: (ctx) => FriendsProfileScreen(),
  SettingPage.routeName: (ctx) => SettingPage(),
  SelectCategory.routeName: (ctx) => SelectCategory(),
  AddtoHomeScreen.routeName: (ctx) => AddtoHomeScreen(),
  FollowRequest.routeName: (ctx) => FollowRequest(),
  FilterCategoryScreen.routName: (ctx) => FilterCategoryScreen(),
  Login.routeName: (ctx) => Login(),
};
