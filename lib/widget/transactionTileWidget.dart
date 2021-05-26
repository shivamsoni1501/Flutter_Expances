import 'package:flutter/material.dart';
import '../model/constants.dart';
import 'package:intl/intl.dart';
import '../model/transacitonClasss.dart';

class TransactionTileW extends StatelessWidget {
  final Transaction tx;
  final Function callback;
  const TransactionTileW({Key key, this.tx, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 80,
            child: Text(
              '₹${tx.amount}',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18,
                color: customTheme['primary'],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tx.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: customTheme['primary'],
                  ),
                ),
                Text(
                  DateFormat.yMMMEd().format(tx.date),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: customTheme['primary'],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: () {
                callback(tx);
              },
              icon: Icon(Icons.delete),
              color: customTheme['primaryDark'],
            ),
          ),
        ],
      ),
    );
  }
}
