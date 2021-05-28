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
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: customTheme['primary'])),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Row(
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
                    SizedBox(height: 5),
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
                    ModelTransactions.deleteTransaction(tx);
                    callback();
                  },
                  icon: Icon(Icons.delete),
                  color: customTheme['primaryDark'],
                ),
              ),
            ],
          ),
          Divider(
            indent: 50,
            endIndent: 50,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'From',
                      style: TextStyle(
                          color: customTheme['primaryLight'], fontSize: 12),
                    ),
                    Text(
                      tx.from,
                      style: TextStyle(
                        color: customTheme['primary'],
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Via',
                      style: TextStyle(
                          color: customTheme['primaryLight'], fontSize: 12),
                    ),
                    Text(
                      tx.methord,
                      style: TextStyle(
                        color: customTheme['primary'],
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'To',
                      style: TextStyle(
                          color: customTheme['primaryLight'], fontSize: 12),
                    ),
                    Text(
                      tx.to,
                      style: TextStyle(
                        color: customTheme['primary'],
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
