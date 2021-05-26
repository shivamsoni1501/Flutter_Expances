import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/constants.dart';

class ChartBoxW extends StatefulWidget {
  ChartBoxW({Key key}) : super(key: key);

  @override
  _ChartBoxWState createState() => _ChartBoxWState();
}

class _ChartBoxWState extends State<ChartBoxW> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: customTheme['background'],
        boxShadow: [
          BoxShadow(
            color: customTheme['primary'],
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      width: double.infinity,
      height: 200,
    );
  }
}
