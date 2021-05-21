import 'package:flutter/material.dart';

class ChooseCloset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Choose a Closet',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 20, right: 20, bottom: 8),
            child: Text(
              'Wishlist',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Divider(),
          Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 20, right: 20, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Winter',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text('Suggested')
              ],
            ),
          ),
          Divider(),
          Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 20, right: 20, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Inspiraton',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text('Suggested')
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
