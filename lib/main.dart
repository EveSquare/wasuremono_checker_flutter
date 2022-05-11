import 'package:flutter/material.dart';

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
                child: Column(
                  children: const [
                    Text(
                      "やや曇り",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      '最高:$high° 最低:$low°',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                  ],
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
        body: const Scaffold(
          backgroundColor: Color.fromRGBO(222, 231, 244, 100),
        ));
  }
}
