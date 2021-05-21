import 'package:flutter/material.dart';

class StyleChips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          // border: Border.all(),
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Text(
              'Styles',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                listOfChip(Text('#date')),
                listOfChip(Text('#party')),
                listOfChip(Text('#date')),
                listOfChip(Text('#party')),
                listOfChip(Text('#date')),
                listOfChip(Text('#party')),
                listOfChip(Text('#date')),
                listOfChip(Text('#party')),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget listOfChip(label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chip(
        label: label,
      ),
    );
  }
}
