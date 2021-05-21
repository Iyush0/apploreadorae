import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NewPostAddLocation extends StatefulWidget {
  @override
  _NewPostAddLocationState createState() => _NewPostAddLocationState();
}

class _NewPostAddLocationState extends State<NewPostAddLocation> {
  bool value1 = false;
  bool value2 = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
              // border: Border.all(),
              ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 14,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add Location',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              listOfChip(
                Text('Location 1'),
              ),
              listOfChip(
                Text('Location 2'),
              ),
              listOfChip(
                Text('Location 3'),
              ),
              listOfChip(
                Text('Location 4'),
              ),
              listOfChip(
                Text('Location 5'),
              ),
              listOfChip(
                Text('Location 6'),
              ),
              listOfChip(
                Text('Location 7'),
              ),
              listOfChip(
                Text('Location 8'),
              ),
            ],
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Facebook Only',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Switch(
                  value: value1,
                  onChanged: (val) {
                    setState(() {
                      value1 = val;
                    });
                  })
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Add to Instagram',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Switch(
                  value: value2,
                  onChanged: (val) {
                    setState(() {
                      value2 = val;
                    });
                  })
            ],
          ),
        ),
      ],
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
