import 'package:flutter/material.dart';

class ClosetHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        height: 145,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            // border: Border.all(),
            ),
        // margin: EdgeInsets.only(top: 104),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    16,
                  ),
                ),
              ),
              height: 150,
              width: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: Image.asset(
                  'assets/images/girl.jpeg',
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                      width: 100,
                      // decoration: BoxDecoration(
                      //   border: Border.all(),
                      // ),
                      child: Text(
                        'J & N',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                      width: 100,
                      // decoration: BoxDecoration(
                      //   border: Border.all(),
                      // ),
                      child: Text(
                        'Orange Shoes',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    width: 100,
                    // decoration: BoxDecoration(
                    //   border: Border.all(),
                    // ),
                    child: Text(
                      '${9.99}',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
