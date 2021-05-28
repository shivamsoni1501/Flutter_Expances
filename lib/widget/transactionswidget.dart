import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/constants.dart';
import './transactionTileWidget.dart';
import '../model/transacitonClasss.dart';

class TransactionsW extends StatefulWidget {
  // final List tranList;
  final Function callBack;
  TransactionsW({Key key, this.callBack}) : super(key: key);

  @override
  _TransactionsWState createState() => _TransactionsWState();
}

class _TransactionsWState extends State<TransactionsW>
    with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    Animation _curveA = CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
        reverseCurve: Curves.easeIn);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_curveA);
    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
    _controller.forward();
  }

  bool _toggle = false;

  toggelAnim() {
    (_toggle) ? _controller.forward() : _controller.reverse();
    _toggle = !_toggle;
  }

  @override
  Widget build(BuildContext context) {
    double width = screenSize.width;
    return Positioned(
      top: (width * .62) * _animation.value,
      bottom: 10 * _animation.value,
      child: Container(
        width: width,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30 * _animation.value),
          color: customTheme['background'],
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          children: [
            GestureDetector(
              onTapDown: (c) => toggelAnim(),
              child: Container(
                width: double.infinity,
                color: Colors.transparent,
                alignment: Alignment.center,
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
            ),
            Divider(
              thickness: 2,
              color: customTheme['primary'],
            ),
            Expanded(
              child: ModelTransactions.transactions.length == 0
                  ? Text(
                      'No Trandsaction!\n hit ADD button to add Some',
                      style: TextStyle(color: customTheme['primaryDark']),
                      textAlign: TextAlign.center,
                    )
                  : ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: ModelTransactions.transactions.length,
                      itemBuilder: (context, index) => TransactionTileW(
                          tx: ModelTransactions.transactions[index],
                          callback: widget.callBack),
                    ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
