import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 50,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150,
          crossAxisSpacing: 8,
          mainAxisSpacing: 10,
          childAspectRatio: 3.2 / 3,
        ),
        itemBuilder: (ctx, i) {
          return Column(
            children: [
              Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 6,
                child: Container(
                  decoration: BoxDecoration(
                      // border: Border.all(),
                      // borderRadius: BorderRadius.circular(10),
                      ),
                  height: 80,
                  width: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child:
                        Image.asset('assets/images/pic.jpg', fit: BoxFit.cover),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 6),
                child: Text(
                  'Category',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        });
  }
}
