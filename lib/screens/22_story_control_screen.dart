// import 'dart:html';

import 'package:flutter/material.dart';

class StoryControl extends StatefulWidget {
  static const routeName = '/story-control';
  @override
  _StoryControlState createState() => _StoryControlState();
}

class _StoryControlState extends State<StoryControl> {
  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;
  bool _value4 = false;
  int _radioValue = 0;

  // Map<String, bool> mapOfData = {
  //   "Everyone": false,
  //   "follow": true,
  //   "off": false,
  // };

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          // mapOfData["Everyone"] = true;
          // mapOfData["follow"] = false;
          // mapOfData["off"] = false;
          break;
        case 1:
          // mapOfData["Everyone"] = false;
          // mapOfData["follow"] = true;
          // mapOfData["off"] = false;
          break;
        case 2:
          // mapOfData["Everyone"] = false;
          // mapOfData["follow"] = false;
          // mapOfData["off"] = true;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    iconSize: 32,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Text(
                    'Story Controls',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    child: Text(
                      'Done',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hide story from',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                    Text('0 people'),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Hide your stories and live videos from specific people',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Inner Circle',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                    Text('0 people'),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Allow message replies',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                            value: 1,
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange,
                          ),
                          Text('Everyone'),
                          Radio(
                            value: 2,
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange,
                          ),
                          Text('People you follow'),
                          Radio(
                            value: 3,
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange,
                          ),
                          Text('off'),
                        ],
                      ),
                    ),
                    Text(
                      'Choose who can reply to your story',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Saving',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Save to camera roll',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    Switch(
                      value: _value1,
                      onChanged: (val) {
                        setState(() {
                          _value1 = val;
                        });
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Save to archive',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    Switch(
                      value: _value2,
                      onChanged: (val) {
                        setState(() {
                          _value2 = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Automatically save photos and videos in your archive so that you dont have to save them on your phone. Only you will be able to see them after they disappear from your story",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(),
              SizedBox(
                height: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Sharing',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Allow resharing to stories',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            Switch(
                              value: _value3,
                              onChanged: (val) {
                                setState(() {
                                  _value3 = val;
                                });
                              },
                            ),
                          ],
                        ),
                        Text(
                          'Other people can add your posts to their stories. Your username wll always appear with your post',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Allow sharing as message',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        Switch(
                          value: _value4,
                          onChanged: (val) {
                            setState(() {
                              _value4 = val;
                            });
                          },
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
