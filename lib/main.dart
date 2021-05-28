import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/constants.dart';
import 'package:flutter_application_1/model/transacitonClasss.dart';
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
      isScrollControlled: true,
      elevation: 20,
      barrierColor: customTheme['primaryDark'].withAlpha(100),
      context: context,
      builder: (context) {
        return InputFormW();
      },
    ).then((value) => setState(() {}));
  }

  callBack() => setState(() {});

  @override
  void initState() {
    super.initState();
    ModelTransactions.addTransaction(
        'efwe', DateTime.now(), 12, 'Shivam', 'Abhay');
    ModelTransactions.addTransaction(
        'efwe', DateTime.now(), 12, 'Shivam', 'Abhay');
  }

  @override
  Widget build(BuildContext context) {
    if (screenSize == null) {
      Size size = MediaQuery.of(context).size;
      screenSize = Size(size.width < 400 ? size.width : 400, size.height);
    }
    AppBar appBar = AppBar(
      centerTitle: true,
      backgroundColor: customTheme['primary'],
      elevation: 12,
      toolbarHeight: 70,
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
      body: Stack(
        alignment: Alignment.topCenter,
        // fit: StackFit.expand,
        children: [
          Container(
            width: double.infinity,
            // height: double.infinity,
          ),
          ChartBoxW(),
          TransactionsW(callBack: callBack),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: customTheme['primary'],
        onPressed: () {
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
