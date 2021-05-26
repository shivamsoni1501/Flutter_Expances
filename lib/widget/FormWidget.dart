import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/constants.dart';
import 'package:flutter_application_1/model/transacitonClasss.dart';
import 'package:intl/intl.dart';
// import 'package:flutter_application_1/model/transacitonClasss.dart';

class InputFormW extends StatefulWidget {
  final Function callback;

  InputFormW({Key key, this.callback}) : super(key: key);

  @override
  _InputFormWState createState() => _InputFormWState();
}

class _InputFormWState extends State<InputFormW> {
  String title, lable;
  int amount;
  DateTime pickedDate;

  inputDecoration(String title) {
    return InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        borderSide: BorderSide(color: customTheme['primary'], width: 3),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(40.0)),
        borderSide: BorderSide(color: customTheme['primary'], width: 2),
      ),
      labelText: title,
      labelStyle: TextStyle(
          color: customTheme['primary'],
          fontSize: 16,
          fontWeight: FontWeight.bold),
      // text: title,
      // labelStyle: TextStyle(
      //     color: customTheme['primary'],
      //     fontSize: 16,
      //     fontWeight: FontWeight.bold),
    );
  }

  datePicker(context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.utc(2000),
      lastDate: DateTime.now(),
    ).then((value) => setState(() => pickedDate = value));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: customTheme['background'],
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        border: Border.all(
          color: Colors.cyan[900],
          width: 4,
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Add a new Transaction',
                style: TextStyle(
                    color: customTheme['primary'],
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ),
          Divider(
            color: customTheme['primary'],
            height: 30,
          ),
          TextField(
            decoration: inputDecoration('Title'),
            style: TextStyle(
                color: customTheme['primary'],
                fontWeight: FontWeight.w900,
                letterSpacing: 2),
            onChanged: (val) => title = val,
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            decoration: inputDecoration('Amount'),
            style: TextStyle(
                color: customTheme['primary'],
                fontWeight: FontWeight.w900,
                letterSpacing: 2),
            keyboardType: TextInputType.number,
            onChanged: (val) => amount = int.parse(val),
          ),
          TextButton.icon(
            onPressed: () => datePicker(context),
            icon: Icon(
              Icons.calendar_today,
              color: customTheme['primary'],
            ),
            label: Text(
              (pickedDate == null)
                  ? 'Pick a Date'
                  : DateFormat.yMMMd().format(pickedDate),
              style: TextStyle(color: customTheme['primary'], fontSize: 16),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: customTheme['primary'],
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: GestureDetector(
              onTap: () {
                ModelTransactions.transactions.add(Transaction(
                    amount: amount, title: title, date: pickedDate));
                // if (Constants.pref.get('count') != null) {
                //   Constants.pref.getStringList('title').add(title);
                //   Constants.pref.getStringList('amount').add(amount.toString());
                //   Constants.pref
                //       .getStringList('date')
                //       .add(pickedDate.toString());
                // } else {
                //   Constants.pref.setStringList('title', [title]);
                //   Constants.pref.setStringList('amount', [amount.toString()]);
                //   Constants.pref.setStringList('date', [pickedDate.toString()]);
                // }
                widget.callback();
                Navigator.pop(context);

                // });
              },
              child: Text(
                '+  Add',
                style: TextStyle(
                  color: customTheme['primaryLight'],
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
