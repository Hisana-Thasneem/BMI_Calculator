import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  ReusableContainer({this.cardValues, this.colour, this.onpress});
  final Color colour;
  final Widget cardValues;
  Function onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: cardValues,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
