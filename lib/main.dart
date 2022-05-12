import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'dart:io';

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
    double mainContentWidth = width * 0.85;
    double mainContentHeight = height * 0.1;
    double subContentWidth = width * 0.72;
    double subContentHeight = height * 0.075;

    final ButtonStyle style = ElevatedButton.styleFrom(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      minimumSize: Size(width * 0.6, height * 0.08),
    );

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.blue[50],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
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
              ],
            ),
            Column(
              children: [
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
            const SizedBox(height: 25),
            ElevatedButton(
              style: style,
              onPressed: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(32.0),
                      ),
                    ),
                    content: SizedBox(
                      height: height * 0.4,
                      child: Column(
                        children: <Widget>[
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Image.asset("assets/images/bearDance.png"),
                                  const Text(
                                    "©くま趣味",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                "いってらっしゃい",
                                style: TextStyle(
                                  fontSize: 35,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(-2.0, 2.0),
                                      blurRadius: 3.0,
                                      color: Color.fromARGB(103, 0, 0, 0),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              minimumSize: Size(width * 0.7, height * 0.05),
                            ),
                            onPressed: () => {
                              if (Platform.isAndroid)
                                {SystemNavigator.pop()}
                              else
                                {exit(0)}
                            },
                            child: const Text(
                              "OK",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: const Text(
                "持った!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
