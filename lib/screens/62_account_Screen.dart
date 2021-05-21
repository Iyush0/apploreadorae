import 'package:adorae/widgets/appbar_header_widget.dart';
import 'package:flutter/material.dart';

import '63_switch-to-professional.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarHeader(
              title: 'Account',
            ),
            buildRow(
              'Personal Information',
              () => null,
            ),
            buildRow(
              'Saved',
              () => null,
            ),
            buildRow(
              'Inner Circle',
              () => null,
            ),
            buildRow(
              'Language',
              () => null,
            ),
            buildRow(
              'Captions',
              () => null,
            ),
            buildRow(
              'Contacts syncing',
              () => null,
            ),
            buildRow(
              'Sharing to other apps',
              () => null,
            ),
            buildRow(
              'Mobile data use',
              () => null,
            ),
            buildRow(
              'Original photos',
              () => null,
            ),
            buildRow(
              'Request Verification',
              () => null,
            ),
            buildRow(
              'Posts you have liked',
              () => null,
            ),
            buildRow(
              'Branded content tools',
              () => null,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return SwitchProfessional();
                  }));
                },
                child: Text('Switch to Proffesional account'))
          ],
        ),
      ),
    );
  }

  buildRow(String text, Function onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          IconButton(onPressed: onTap, icon: Icon(Icons.arrow_forward_ios)),
        ],
      ),
    );
  }
}
