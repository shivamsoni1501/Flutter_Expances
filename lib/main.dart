import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/constants.dart';
import 'package:flutter_application_1/widget/FormWidget.dart';
import 'package:flutter_application_1/widget/chatBox.dart';
import 'package:flutter_application_1/widget/transactionswidget.dart';
// import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // Constants.pref = await SharedPreferences.getInstance();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Farro',
        primarySwatch: Colors.cyan,
      ), // color: Colors.cyan[900],
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      enableDrag: true,
      elevation: 20,
      barrierColor: customTheme['primaryDark'].withAlpha(100),
      context: context,
      builder: (context) {
        return InputFormW(callback: callbackBottomS);
      },
    );
  }

  callbackBottomS() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      centerTitle: true,
      backgroundColor: customTheme['primary'],
      elevation: 12,
      title: Text(
        'Expances',
        style: TextStyle(
          color: customTheme['primaryLight'],
          fontWeight: FontWeight.w900,
          letterSpacing: 2,
          shadows: [
            Shadow(
                color: customTheme['primaryDark'],
                offset: Offset(0, 4),
                blurRadius: 2),
          ],
        ),
      ),
    );
    return Scaffold(
      appBar: appBar,
      backgroundColor: customTheme['background'],
      body: Column(
        children: [
          ChartBoxW(),
          Expanded(
            child: TransactionsW(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: customTheme['primary'],
        onPressed: () {
          setState(() {});
          showBottomSheet(context);
        },
        foregroundColor: customTheme['background'],
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
