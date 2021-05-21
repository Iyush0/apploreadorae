import 'package:adorae/screens/search.dart';
import 'package:adorae/widgets/brand_category_widget.dart';
import 'package:adorae/widgets/colors_category_widget.dart';
import 'package:adorae/widgets/gender_category_widget.dart';
import 'package:adorae/widgets/price_category_widget.dart';
import 'package:flutter/material.dart';

class FilterCategoryScreen extends StatefulWidget {
  static const routName = 'filter-screen';
  @override
  _FilterCategoryScreenState createState() => _FilterCategoryScreenState();
}

class _FilterCategoryScreenState extends State<FilterCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.clear),
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ],
          bottom: TabBar(
            // isScrollable: true,

            indicatorWeight: 4,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            tabs: [
              Tab(
                child: Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                // text: 'Category',
              ),
              Tab(
                child: Text(
                  'Brands',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Price',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Color',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          GenderCategory(),
          BrandCategory(),
          PriceCategory(),
          ColorCategory(),
        ]),
      ),
    );
  }
}
