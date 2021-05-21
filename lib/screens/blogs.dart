import 'package:adorae/screens/home_screen.dart';
import 'package:adorae/widgets/appbar_header_widget.dart';
import 'package:flutter/material.dart';

class BlogsScreen extends StatefulWidget {
  @override
  _BlogsScreenState createState() => _BlogsScreenState();
}

class _BlogsScreenState extends State<BlogsScreen> {
  List<String> _gender = <String>[
    'topic',
    'topic',
    'topic',
  ];

  final _blogsformKey = GlobalKey<FormState>();

  var _selectedblog;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_off_outlined,
                  )),
              Text(
                'Adorae',
                style: TextStyle(fontSize: 30),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.messenger_outline_sharp),
              ),
            ],
          ),
          SizedBox(height: height * 0.02),
          Center(
            child: const Text(
              'Blogs',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Colors.black,
              thickness: 3,
            ),
          ),
          SizedBox(height: height * 0.02),
          selectTopic(height, width),
          // SizedBox(height: height * 0.01),
          blogscards(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR78JoZvgPmDNOr0ggRxCfO4khzCO7lGXvhyHle3CmedCeFUdaAud4dJsuF1jhM0Ww1fdw&usqp=CAU",
              "Lorem ipsum dolor sit amet, consectetur adipiscing",
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nec orci vitae justo rhoncus scelerisque ac sit amet justo.Etiam eget arcu bibendum, auctor lectus id, iaculis tortor. Aenean mi enim, ultricies vitae ullamcorper sed, posuere quis velit. Donec dictum eleifend scelerisque. Vestibulum vitae tempus arcu. ",
              height,
              width),
          SizedBox(height: height * 0.05),
          blogscards(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR78JoZvgPmDNOr0ggRxCfO4khzCO7lGXvhyHle3CmedCeFUdaAud4dJsuF1jhM0Ww1fdw&usqp=CAU",
              "Lorem ipsum dolor sit amet, consectetur adipiscing",
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nec orci vitae justo rhoncus scelerisque ac sit amet justo.Etiam eget arcu bibendum, auctor lectus id, iaculis tortor. Aenean mi enim, ultricies vitae ullamcorper sed, posuere quis velit. Donec dictum eleifend scelerisque. Vestibulum vitae tempus arcu. ",
              height,
              width),
          SizedBox(height: height * 0.05),
          blogscards(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR78JoZvgPmDNOr0ggRxCfO4khzCO7lGXvhyHle3CmedCeFUdaAud4dJsuF1jhM0Ww1fdw&usqp=CAU",
              "Lorem ipsum dolor sit amet, consectetur adipiscing",
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nec orci vitae justo rhoncus scelerisque ac sit amet justo.Etiam eget arcu bibendum, auctor lectus id, iaculis tortor. Aenean mi enim, ultricies vitae ullamcorper sed, posuere quis velit. Donec dictum eleifend scelerisque. Vestibulum vitae tempus arcu. ",
              height,
              width),
          SizedBox(height: height * 0.05),
          blogscards(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR78JoZvgPmDNOr0ggRxCfO4khzCO7lGXvhyHle3CmedCeFUdaAud4dJsuF1jhM0Ww1fdw&usqp=CAU",
              "Lorem ipsum dolor sit amet, consectetur adipiscing",
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nec orci vitae justo rhoncus scelerisque ac sit amet justo.Etiam eget arcu bibendum, auctor lectus id, iaculis tortor. Aenean mi enim, ultricies vitae ullamcorper sed, posuere quis velit. Donec dictum eleifend scelerisque. Vestibulum vitae tempus arcu. ",
              height,
              width),
          SizedBox(height: height * 0.05),
          blogscards(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR78JoZvgPmDNOr0ggRxCfO4khzCO7lGXvhyHle3CmedCeFUdaAud4dJsuF1jhM0Ww1fdw&usqp=CAU",
              "Lorem ipsum dolor sit amet, consectetur adipiscing",
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nec orci vitae justo rhoncus scelerisque ac sit amet justo.Etiam eget arcu bibendum, auctor lectus id, iaculis tortor. Aenean mi enim, ultricies vitae ullamcorper sed, posuere quis velit. Donec dictum eleifend scelerisque. Vestibulum vitae tempus arcu. ",
              height,
              width),
          SizedBox(height: height * 0.07),
        ],
      ),
    );
  }

  Widget selectTopic(height, width) {
    return Container(
      margin:
          EdgeInsets.fromLTRB(width * 0.05, 0.0, width * 0.05, height * 0.04),
      decoration: BoxDecoration(
        // color: Colors.black,
        border: Border.all(
          color: Colors.grey[500],
        ),
        borderRadius: BorderRadius.all(Radius.circular(29)),
      ),
      padding: EdgeInsets.fromLTRB(
          width * 0.025, height * 0.002, width * 0.017, height * 0.002),
      child: Form(
        key: _blogsformKey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  // underline: ,
                  items: _gender
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
                  onChanged: (selectedblogs) {
                    setState(() {
                      _selectedblog = selectedblogs;
                    });
                  },
                  value: _selectedblog,
                  hint: Text(
                    "Select Topic",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: height * 0.02,
                    ),
                  ),
                  elevation: 0,
                  isExpanded: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget blogscards(
      String post, String subject, String description, height, width) {
    return Container(
      margin: EdgeInsets.only(
        left: width * 0.03,
        right: width * 0.03,
        // top: height * 0.02,
        // bottom: height * 0.01.
      ),
      child: Card(
        elevation: 0.0,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: <Widget>[
            SizedBox(height: height * 0.0),
            Container(
              height: height * 0.5,
              width: width * 0.9,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    post,
                  ),
                ),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.grey[400],
              ),
            ),
            SizedBox(height: height * 0.01),
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.05,
                  right: width * 0.05,
                  top: height * 0.01,
                  bottom: height * 0.01),
              child: Text(
                subject,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: height * 0.025,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // SizedBox(height: 9),
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.01,
                  // right: width * 0.02,
                  top: height * 0.005,
                  bottom: height * 0.005),
              child: ListTile(
                leading: Container(
                  height: height * 0.05,
                  width: width * 0.09,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        post,
                      ),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Colors.grey[400],
                  ),
                ),
                title: Row(
                  children: <Widget>[
                    Text(
                      "Mayra Mann",
                      style: TextStyle(
                          color: Color(0xffC2C2C2), fontSize: height * 0.02),
                    ),
                    SizedBox(width: width * 0.01),
                    Text(
                      ",21 March 2021",
                      style: TextStyle(
                          color: Color(0xffC2C2C2), fontSize: height * 0.02),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.05,
                  right: width * 0.05,
                  // top: height * 0.01,
                  bottom: height * 0.01),
              child: Text(
                description,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: height * 0.02,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: height * 0.05),
          ],
        ),
      ),
    );
  }
}
