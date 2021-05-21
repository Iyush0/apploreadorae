import 'package:adorae/widgets/button.dart';
import 'package:flutter/material.dart';

class PriceCategory extends StatefulWidget {
  @override
  _PriceCategoryState createState() => _PriceCategoryState();
}

class _PriceCategoryState extends State<PriceCategory> {
  RangeValues selectedRange = RangeValues(1.0, 100.0);
  RangeLabels _rangeLabels = RangeLabels('1', '100');
  RangeValues initialValue = RangeValues(1, 100);
  RangeValues finalValue = RangeValues(1, 100);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8, top: 20),
            child: RaisedButton(
              color: Colors.white,
              textColor: Colors.blue,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              onPressed: () {},
              child: Text('Reset All'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              // decoration: BoxDecoration(border: Border.all()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '\$${initialValue.start.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ' - ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${finalValue.end.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Text('\$${selectedRange.start.round().toString()}'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: RangeSlider(
              // divisions: 5,
              labels: _rangeLabels,
              values: selectedRange,
              onChangeStart: (RangeValues startValues) {
                setState(() {
                  print(initialValue);
                  initialValue = startValues;
                });
                print('Started change at $startValues');
              },
              onChangeEnd: (RangeValues endValues) {
                setState(() {
                  print(finalValue);
                  finalValue = endValues;
                });

                print('Ended change at $endValues');
              },
              onChanged: (value) {
                setState(() {
                  selectedRange = value;
                });
              },
              min: 1,
              max: 100,
              // labels: RangeLabels(
              //   '${selectedRange.start}',
              //   '${selectedRange.end}',
              // ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${initialValue.start.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$${finalValue.end.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: CommonButton(
              title: 'Apply',
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}
