import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/results.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ReusableContainer.dart';
import 'IconContent.dart';
import 'calculations.dart';
import "results.dart";

Color malecard = inactiveCardcolor;
Color femalecard = inactiveCardcolor;

int _weight = 0;
int _age = 10;
int _height = 205;

enum CardType {
  femaleCard,
  maleCard,
}

class Content extends StatefulWidget {
  @override
  _Content createState() => _Content();
}

class _Content extends State<Content> {
  CardType Gender;

  // t here are two methods first to use if else and second to use ternary operator
  // a new method was created for updating color
  // instead of randomly naming in with gender a enum was created and both the cards were called from enum
  //the type of random name was delcred as enum type

  // void updateColor(CardType type) {
  //   if (type == CardType.maleCard) {
  //     malecard = activeCardcolor;
  //     femalecard = inactiveCardcolor;
  //   } else {
  //     malecard = inactiveCardcolor;
  //     femalecard = activeCardcolor;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI Calculator')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: ReusableContainer(
                        onpress: () {
                          setState(() {
                            Gender = CardType.maleCard;
                          });
                        },
                        colour: Gender == CardType.maleCard
                            ? activeCardcolor
                            : inactiveCardcolor,
                        cardValues: IconContent(
                          textRepeat: 'MALE',
                          symbol: FontAwesomeIcons.mars,
                        ))),
                Expanded(
                    child: ReusableContainer(
                  onpress: () {
                    setState(() {
                      Gender = CardType.femaleCard;
                    });
                  },
                  colour: Gender == CardType.femaleCard
                      ? activeCardcolor
                      : inactiveCardcolor,
                  cardValues: IconContent(
                    textRepeat: 'FEMALE',
                    symbol: FontAwesomeIcons.venus,
                  ),
                )),
              ],
            ),
          ),
          Expanded(
              child: ReusableContainer(
            colour: inactiveCardcolor,
            cardValues: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      "HEIGHT",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(width: 50),
                    Text(
                      _height.toInt().toString(),
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                    Text(
                      "cm",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    )
                  ],
                ),
                Slider(
                  inactiveColor: Colors.white,
                  activeColor: Colors.cyan,
                  value: _height.toDouble(),
                  max: 500,
                  min: 200,
                  label: _height.round.toString(),
                  onChanged: (double value) {
                    setState(() {
                      _height = value.toInt();
                    });
                  },
                ),
              ],
            ),
          )),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: ReusableContainer(
                  colour: inactiveCardcolor,
                  cardValues: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 5),
                      Text(
                        _weight.toInt().toString(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.height * 0.05,
                            child: FloatingActionButton(
                                backgroundColor: Colors.grey[300],
                                child: Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    _weight--;
                                  });
                                }),
                          ),
                          SizedBox(width: 30),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.height * 0.05,
                            child: FloatingActionButton(
                                backgroundColor: Colors.grey[300],
                                child: Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    _weight++;
                                  });
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableContainer(
                  colour: inactiveCardcolor,
                  cardValues: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "$_age",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.height * 0.05,
                            child: FloatingActionButton(
                                backgroundColor: Colors.grey[300],
                                child: Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    _age--;
                                  });
                                }),
                          ),
                          SizedBox(width: 30),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.height * 0.05,
                            child: FloatingActionButton(
                                backgroundColor: Colors.grey[300],
                                child: Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    _age++;
                                  });
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                Results result1 = Results(Height: _height, Weight: _weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Calculations(
                              actual: result1.bmiCalculation(),
                              feedback: result1.feedback(),
                              result: result1.resultText(),
                            )));
              });
            },
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.10,
              color: Color(0xFFD52753),
              child: Center(
                child: Text(
                  "Calculate",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
