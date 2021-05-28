import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/constants.dart';
import 'package:flutter_application_1/model/transacitonClasss.dart';

class ChartBoxW extends StatefulWidget {
  ChartBoxW({Key key}) : super(key: key);

  @override
  _ChartBoxWState createState() => _ChartBoxWState();
}

class _ChartBoxWState extends State<ChartBoxW> {
  @override
  Widget build(BuildContext context) {
    // double boxHeight = boxWidth * .62;
    return SizedBox(
      width: screenSize.width,
      child: GridView.count(
        padding: const EdgeInsets.all(15),
        crossAxisCount: 3,
        childAspectRatio: 2.3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 10,
        children: List.generate(
          12,
          (index) => MBox(
            index: index,
          ),
        ),
      ),
    );
  }
}

class MBox extends StatelessWidget {
  final int index;
  const MBox({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fraction =
        ModelTransactions.history[index] / ModelTransactions.maxMonth * .9;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: customTheme['primary'],
          boxShadow: [
            BoxShadow(
                color: customTheme['primaryDark'],
                offset: Offset(1, 5),
                blurRadius: 4)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FittedBox(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(
                ModelTransactions.months[index],
                style:
                    TextStyle(color: customTheme['background'], fontSize: 13),
              ),
            ),
          ),
          FittedBox(
            child: Text(
              ModelTransactions.history[index].toString(),
              style:
                  TextStyle(fontSize: 12, color: customTheme['primaryLight']),
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: fraction,
            child: Container(
              color: Colors.white,
              height: 2,
            ),
          ),
        ],
      ),
    );
  }
}
