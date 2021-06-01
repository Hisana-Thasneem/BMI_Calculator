import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent({this.textRepeat, this.symbol});

  final String textRepeat;
  final IconData symbol;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          symbol,
          size: 30,
        ),
        SizedBox(height: 10),
        Text(textRepeat, style: TextStyle(fontSize: 20))
      ],
    );
  }
}
