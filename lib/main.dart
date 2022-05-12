import 'package:flutter/material.dart';
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
    final ButtonStyle style =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
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

  Center _buildBody() {
    String getNow() {
      DateTime now = DateTime.now();
      DateFormat Outformat = DateFormat("yyyy年MM月dd日");
      String date = Outformat.format(now);
      return date;
    }

    return Center(
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
        ],
      ),
    );
  }
}
