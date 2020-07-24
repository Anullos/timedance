import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;

  const HeaderWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(this.title,
          style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 20,),
        Divider(),
      ],
    );
  }
}