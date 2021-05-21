import 'package:adorae/widgets/appbar_header_widget.dart';
import 'package:flutter/material.dart';

class AdvancedSettingScreen extends StatefulWidget {
  static const routeName = '/advance-setting';
  @override
  _AdvancedSettingScreenState createState() => _AdvancedSettingScreenState();
}

class _AdvancedSettingScreenState extends State<AdvancedSettingScreen> {
  bool value1 = false;
  bool value2 = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarHeader(
                title: 'Advanced Setting',
                
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 14,
                ),
                child: Text(
                  'Comments',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Text(
                          'Turn off commenting',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Switch(
                        value: value1,
                        onChanged: (val) {
                          setState(() {
                            value1 = val;
                          });
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14, bottom: 10),
                    child: Text(
                      "You can change this later by going to the menu at the top of your post",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                  Divider(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 14,
                ),
                child: Text(
                  'Preferences',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Text(
                          'Share your posts to facebook',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Switch(
                        value: value2,
                        onChanged: (val) {
                          setState(() {
                            value2 = val;
                          });
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: Text(
                      "Automatically share your photo and video posts to Facebook",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Facebook audience',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Friends'),
                          Icon(
                            Icons.arrow_forward_ios,
                          )
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 14,
                ),
                child: Text(
                  'Accessibility',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Text(
                          'Write alt text',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios,
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: Text(
                      "Alt text describes your photos for people with visual impairments. Alttext will becreated automatically for your photos or you can choose to write your own. ",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
