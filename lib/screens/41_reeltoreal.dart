import 'package:adorae/widgets/custom-appbar.dart';
import 'package:flutter/material.dart';

class ReelToReal extends StatefulWidget {
  @override
  _ReelToRealState createState() => _ReelToRealState();
}

class _ReelToRealState extends State<ReelToReal> {
  bool _tapped = false;
  Color _like = Colors.grey[400];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: appBar(null),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            SizedBox(height: 20),
            cards(
              "prie9",
              "Mumbai",
              150,
              200,
              9,
              "Caption of my post!",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR78JoZvgPmDNOr0ggRxCfO4khzCO7lGXvhyHle3CmedCeFUdaAud4dJsuF1jhM0Ww1fdw&usqp=CAU",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR78JoZvgPmDNOr0ggRxCfO4khzCO7lGXvhyHle3CmedCeFUdaAud4dJsuF1jhM0Ww1fdw&usqp=CAU",
            ),
            SizedBox(height: 20),
            cards(
              "prie9",
              "Mumbai",
              150,
              200,
              9,
              "Caption of my post!",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR78JoZvgPmDNOr0ggRxCfO4khzCO7lGXvhyHle3CmedCeFUdaAud4dJsuF1jhM0Ww1fdw&usqp=CAU",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR78JoZvgPmDNOr0ggRxCfO4khzCO7lGXvhyHle3CmedCeFUdaAud4dJsuF1jhM0Ww1fdw&usqp=CAU",
            ),
            SizedBox(height: 20),
            cards(
              "prie9",
              "Mumbai",
              150,
              200,
              9,
              "Caption of my post!",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR78JoZvgPmDNOr0ggRxCfO4khzCO7lGXvhyHle3CmedCeFUdaAud4dJsuF1jhM0Ww1fdw&usqp=CAU",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR78JoZvgPmDNOr0ggRxCfO4khzCO7lGXvhyHle3CmedCeFUdaAud4dJsuF1jhM0Ww1fdw&usqp=CAU",
            ),
            SizedBox(height: 20),
            cards(
              "prie9",
              "Mumbai",
              150,
              200,
              9,
              "Caption of my post!",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR78JoZvgPmDNOr0ggRxCfO4khzCO7lGXvhyHle3CmedCeFUdaAud4dJsuF1jhM0Ww1fdw&usqp=CAU",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR78JoZvgPmDNOr0ggRxCfO4khzCO7lGXvhyHle3CmedCeFUdaAud4dJsuF1jhM0Ww1fdw&usqp=CAU",
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget cards(String username, String place, int likes, int views,
      int comments, String caption, String profilepic, String post) {
    return Container(
      child: Card(
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          // physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: <Widget>[
            SizedBox(height: 8),
            Row(
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        profilepic,
                      ),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    color: Colors.redAccent,
                  ),
                ),
                SizedBox(width: 4),
                Column(
                  children: [
                    Text(
                      username,
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        place,
                        style: TextStyle(
                            fontSize: 12.0,
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
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 9),
            Container(
              height: 400,
              width: 100,
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
            SizedBox(height: 9),
            Row(
              children: <Widget>[
                SizedBox(width: 15),
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
                    size: 20.0,
                  ),
                ),
                SizedBox(width: 5),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.comment_bank_rounded,
                    color: Colors.grey[400],
                    size: 20.0,
                  ),
                ),
                SizedBox(width: 5),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share_rounded,
                    color: Colors.grey[400],
                    size: 20.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
