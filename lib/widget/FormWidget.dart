import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/constants.dart';
import 'package:flutter_application_1/model/transacitonClasss.dart';
import 'package:intl/intl.dart';
// import 'package:flutter_application_1/model/transacitonClasss.dart';

class InputFormW extends StatefulWidget {
  InputFormW({Key key}) : super(key: key);

  @override
  _InputFormWState createState() => _InputFormWState();
}

class _InputFormWState extends State<InputFormW> {
  String title = 'Shopping', from = 'N/A', to = 'N/A';
  int amount = 0;
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

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
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
      // height: 500,
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
        mainAxisSize: MainAxisSize.min,
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
          const SizedBox(height: 10),
          TextField(
            decoration: inputDecoration('Amount'),
            style: TextStyle(
                color: customTheme['primary'],
                fontWeight: FontWeight.w900,
                letterSpacing: 2),
            keyboardType: TextInputType.number,
            onChanged: (val) => amount = int.parse(val),
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: inputDecoration('from'),
            style: TextStyle(
                color: customTheme['primary'],
                fontWeight: FontWeight.w900,
                letterSpacing: 2),
            onChanged: (val) => from = val,
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: inputDecoration('to'),
            style: TextStyle(
                color: customTheme['primary'],
                fontWeight: FontWeight.w900,
                letterSpacing: 2),
            onChanged: (val) => to = val,
          ),
          SizedBox(height: 10),
          Wrap(
            children: ModelTransactions.methords
                .map(
                  (e) => GestureDetector(
                    onTap: () {
                      ModelTransactions.pickedMethord = e;
                      setState(() {});
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                      // padding: EdgeInsets.symmetric(horizontal: 5),
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ModelTransactions.pickedMethord == e
                            ? customTheme['primary']
                            : customTheme['primaryLight'],
                      ),
                      child: Text(e),
                    ),
                  ),
                )
                .toList(),
          ),
          SizedBox(height: 10),
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
          InkWell(
            onTap: () {
              ModelTransactions.addTransaction(
                  title, pickedDate, amount, from, to);
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: customTheme['primary'],
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
