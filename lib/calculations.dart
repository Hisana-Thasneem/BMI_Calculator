import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';
import 'content.dart';
import "results.dart";

class Calculations extends StatelessWidget {
  Calculations({this.actual, this.result, this.feedback});

  final String actual;
  final String result;
  final String feedback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Text("Your results",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
          Container(
            width: double.infinity, //MediaQuery.of(context).size.height * 0.75,
            height: MediaQuery.of(context).size.height * 0.75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  result,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                  ),
                ),
                Text(
                  actual,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                // Text(
                //   feedback,
                //   style: TextStyle(
                //     fontSize: 25,
                //   ),
                // ),
                // ElevatedButton(
                //   onPressed: () {
                //     setState(() {});
                //   },
                //   child: Text("SAVE REPORT"),
                // ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.1,
              color: Color(0xFFD52753),
              child: Center(
                child: Text(
                  "Re-Calculate",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
