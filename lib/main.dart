import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './trasanction.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Farro',
            primarySwatch: Colors.cyan,
            primaryColor: Colors.cyan[700]),
        color: Colors.cyan[900],
        home: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Expances',
          style: Theme.of(context).textTheme.headline5.copyWith(shadows: [
            Shadow(
                color: Colors.cyan[900], offset: Offset(0, 4), blurRadius: 2),
          ], fontWeight: FontWeight.w900, letterSpacing: 2),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColorLight,
      body: Column(
        children: [
          Chart(),
          Expanded(child: Transactions()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        onPressed: () {},
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class Chart extends StatefulWidget {
  Chart({Key key}) : super(key: key);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Theme.of(context).primaryColorLight,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColorDark,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      // color: Theme.of(context).primaryColorLight,
      width: double.infinity,
      height: 200,
    );
  }
}

class Transactions extends StatefulWidget {
  Transactions({Key key}) : super(key: key);

  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  final List<Transaction> transactions = [
    Transaction(title: 'Shoues', amount: 2000, date: DateTime.now()),
    Transaction(title: 'Shoues', amount: 2000, date: DateTime.now()),
    Transaction(title: 'Shoues', amount: 2000, date: DateTime.now()),
    Transaction(title: 'Shoues', amount: 2000, date: DateTime.now()),
    Transaction(title: 'Shoues', amount: 2000, date: DateTime.now()),
    Transaction(title: 'Shoues', amount: 2000, date: DateTime.now()),
    Transaction(title: 'Shoues', amount: 2000, date: DateTime.now()),
    Transaction(title: 'Shoues', amount: 2000, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Theme.of(context).primaryColorLight,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColorDark,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'Transactions',
              style: Theme.of(context).textTheme.headline6.copyWith(
                  letterSpacing: 2,
                  fontWeight: FontWeight.w900,
                  color: Colors.cyan[900]),
            ),
          ),
          Divider(
            thickness: 2,
            color: Theme.of(context).primaryColorDark,
          ),
          Expanded(
            child: ListView.builder(
              itemExtent: 70,
              itemCount: transactions.length,
              itemBuilder: (context, index) =>
                  TransactionTile(tx: transactions[index]),
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

class TransactionTile extends StatelessWidget {
  final Transaction tx;
  const TransactionTile({Key key, this.tx}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        // color: Theme.of(context).primaryColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                '₹ ${tx.amount}',
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.cyan[900],
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tx.title,
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.cyan[900],
                        ),
                  ),
                  Text(
                    DateFormat.yMMMEd().format(tx.date),
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColorDark),
                  ),
                ],
              ),
            ),
            Expanded(child: Icon(Icons.delete_rounded))
          ],
        ));
  }
}
