import 'package:flutter/material.dart';

class ChildContentWidget extends StatelessWidget {
  final String contentText;

  const ChildContentWidget({
    Key? key,
    required this.contentText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double subContentWidth = width * 0.72;
    double subContentHeight = height * 0.075;

    return Container(
      width: subContentWidth,
      height: subContentHeight,
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          contentText,
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
