import 'package:flutter/material.dart';

class BrandGridView extends StatelessWidget {
  const BrandGridView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 50,
        padding: EdgeInsets.only(top: 10),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150,
          // crossAxisSpacing: 8,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 2.4,
        ),
        itemBuilder: (ctx, i) {
          return Column(
            children: [
              CircleAvatar(
                radius: 34,
                backgroundColor: Color(0xff3AAFA9),
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  child: Text(
                    'Logo',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Brand Name',
                style: TextStyle(
                  // fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          );
        });
  }
}
