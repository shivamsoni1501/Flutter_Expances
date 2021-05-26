import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/constants.dart';
import './transactionTileWidget.dart';
import '../model/transacitonClasss.dart';

class TransactionsW extends StatefulWidget {
  // final List tranList;

  TransactionsW({Key key}) : super(key: key);

  @override
  _TransactionsWState createState() => _TransactionsWState();
}

class _TransactionsWState extends State<TransactionsW> {
  callbackTile(index) {
    ModelTransactions.transactions.remove(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: customTheme['background'],
        boxShadow: [
          BoxShadow(
            color: customTheme['primary'],
            blurRadius: 5,
            offset: Offset(1, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'Transactions',
              style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w900,
                  color: customTheme['primary']),
            ),
          ),
          Divider(
            thickness: 2,
            color: customTheme['primary'],
          ),
          Expanded(
            child: ListView.builder(
              itemExtent: 70,
              itemCount: ModelTransactions.transactions.length,
              itemBuilder: (context, index) => TransactionTileW(
                  tx: ModelTransactions.transactions[index],
                  callback: callbackTile),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
