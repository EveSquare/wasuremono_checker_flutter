import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'wasuremono checker',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool mute = false;
  toggleMute() {
    setState(() {
      mute = !mute;
    });
  }

  static const String high = "21";
  static const String low = "10";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Flexible(
              child: Image.asset(
                "assets/images/sun.gif",
                height: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "やや曇り",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        '最高:$high° 最低:$low°',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          if (mute == true)
            IconButton(
              icon: const Icon(Icons.volume_mute),
              tooltip: 'mute',
              color: Colors.black,
              onPressed: () {
                toggleMute();
              },
            ),
          if (mute == false)
            IconButton(
              icon: const Icon(Icons.volume_up),
              tooltip: 'volume',
              color: Colors.black,
              onPressed: () {
                toggleMute();
              },
            ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'settings',
            color: Colors.black,
            onPressed: () {},
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: _buildBody(),
    );
  }

  Container _buildBody() {
    initializeDateFormatting('ja');
    String getNow() {
      DateTime now = DateTime.now();
      DateFormat outFormat = DateFormat("yyyy年MM月dd日");
      DateFormat dayOfWeekFormat = DateFormat.E('ja');
      String dayOfWeek = dayOfWeekFormat.format(now);
      String date = outFormat.format(now);
      return "$date($dayOfWeek)";
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double mainContentWidth = width * 0.8;
    double mainContentHeight = height * 0.1;
    double subContentWidth = width * 0.72;
    double subContentHeight = height * 0.075;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.blue[50],
      ),
      child: Center(
        child: Column(
          children: [
            Text(
              getNow(),
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              "文化の日",
              style: TextStyle(
                color: Colors.red[400],
                fontSize: 22,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                width: subContentWidth,
                height: subContentHeight,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "マナカ",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: mainContentWidth,
              height: mainContentHeight,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  "時計",
                  style: TextStyle(
                    fontSize: 38,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                width: subContentWidth,
                height: subContentHeight,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "財布",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
