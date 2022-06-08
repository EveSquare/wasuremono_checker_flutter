import 'package:flutter/material.dart';

class MainContentWidget extends StatelessWidget {
  final String contentText;

  const MainContentWidget({
    Key? key,
    required this.contentText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double mainContentWidth = width * 0.85;
    double mainContentHeight = height * 0.1;

    return Container(
      width: mainContentWidth,
      height: mainContentHeight,
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          contentText,
          style: const TextStyle(
            fontSize: 38,
          ),
        ),
      ),
    );
  }
}
