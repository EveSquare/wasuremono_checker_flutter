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

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Column(
              children: const [
                Text(
                  "wasuremono checker",
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                Text("wasuremono checker"),
              ],
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
        backgroundColor: Colors.white,
      ),
      body: const Center(
        child: Text("Main"),
      ),
    );
  }
}
