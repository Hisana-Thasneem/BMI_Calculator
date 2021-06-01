import 'package:flutter/material.dart';
import 'dart:math';

class Results {
  Results({this.Height, this.Weight});

  final Height;
  final Weight;
  double _bmi;
  String _actbmi;

  String bmiCalculation() {
    _bmi = Weight / (pow(Height / 100, 2));
    _actbmi = _bmi.toStringAsFixed(2);
    return _actbmi;
  }

  String resultText() {
    if (_bmi >= 25) {
      return "OVERWEIGHT";
    } else if (_bmi > 18) {
      return "NORMAL";
    } else {
      return "UNDERWEIGHT";
    }
  }

  String feedback() {
    if (_bmi >= 25) {
      return "card1";
    } else if (_bmi > 18) {
      return "card2";
    } else {
      return "card3";
    }
  }
}
