import 'package:adorae/screens/24_closet_screen.dart';
import 'package:flutter/material.dart';

import '25_combine_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = '/product-detail';
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool isTapped = true;
  onTap() {
    setState(() {
      isTapped = !isTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                    // border: Border.all(),
                    ),
                height: height,
                child: Image.asset(
                  'assets/images/pic.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: height * 0.15,
              decoration: BoxDecoration(
                  // border: Border.all(),
                  ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  ListTile(
                    leading: CircleAvatar(
                      foregroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                    title: Text(
                      'Michael G Gutliers',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            isTapped
                ? Positioned(
                    top: height * 0.3,
                    left: width * 0.1,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        // border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: height * 0.16,
                      width: width * 0.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Beat Headphone',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '\$${99.99}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : SizedBox(),
            isTapped
                ? Positioned(
                    top: height * 0.5,
                    left: width * 0.65,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      height: height * 0.20,
                      width: width * 0.35,
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          // border: Border.all(),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // buildListTile(
                          //   Icon(
                          //     Icons.shopping_bag,
                          //     color: Colors.white,
                          //   ),
                          //   'Buy',
                          //   Colors.white,
                          //   () {},
                          // ),
                          // buildListTile(
                          //   Icon(
                          //     Icons.shopping_bag,
                          //     color: Colors.white,
                          //   ),
                          //   'Closet',
                          //   Colors.white,
                          //   () {},
                          // ),
                          // buildListTile(
                          //   Icon(
                          //     Icons.shopping_bag,
                          //     color: Colors.white,
                          //   ),
                          //   'Combine',
                          //   Colors.white,
                          //   () {},
                          // ),

                          buildRow(
                            'Buy',
                            () {},
                            Icons.shopping_basket_outlined,
                          ),
                          buildRow(
                            'Closet',
                            () {
                              Navigator.of(context)
                                  .pushNamed(ClosetScreen.routeName);
                            },
                            Icons.storage_rounded,
                          ),
                          buildRow(
                            'Combine',
                            () {
                              Navigator.of(context)
                                  .pushNamed(CombineScreen.routeName);
                            },
                            Icons.collections_bookmark_outlined,
                          ),
                        ],
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  buildRow(String title, Function onTap, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
