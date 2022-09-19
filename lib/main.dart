import 'package:flutter/material.dart';
import 'package:calculator_app/CalcButton.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const CalcApp());
}

// Making the CalcApp a Stateful Widget so that it can show
// the data that it has calculated
class CalcApp extends StatefulWidget {
  const CalcApp({Key? key}) : super(key: key);

  @override
  CalcAppState createState() {
    return CalcAppState();
  }
}

class CalcAppState extends State<CalcApp> {
  String _history = ""; // This will store the previous expression
  String _expression = ""; // This will store the expression being evaluated

  void numClick (String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear (String text) {
    setState(() {
      _history = "";
      _expression = "";
    });
  }

  void clear (String text) {
    setState(() {
      _expression = "";
    });
  }

  void evaluate (String text) {
    late String temp;

    if(_expression == "/**/00/**/") {
      temp = "Created by Vimish";
    }
    else {
      Parser p = Parser();
      Expression exp = p.parse(_expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      temp = eval.toString();

      // Gets last 2 characters from eval and if it is ".0" then removes it
      var newString = temp.substring((temp.length - 2).clamp(0, temp.length));
      if (newString == ".0") {
        temp = temp.substring(0, temp.length - 2);
      }
    }
    setState(() {
      _history = _expression;
      _expression = temp;
    });
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: Scaffold(
        backgroundColor: const Color(0xffeeeeee),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(right: 12.0),
              alignment: const Alignment(1 ,1),
              child: Text(
                _history,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12.0),
              alignment: const Alignment(1 ,1),
              child: Text(
                _expression,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: "AC",
                  fillColor: 0xFF6C807F,
                  textSize: 22.0,
                  callback: allClear,
                ),
                CalcButton(
                  text: "(",
                  fillColor: 0xFFFFFFF,
                  callback: numClick,
                ),
                CalcButton(
                  text: ")",
                  fillColor: 0xffffff,
                  callback: numClick,
                ),
                CalcButton(
                  text: "/",
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: "7",
                  fillColor: 0xFF283637,
                  callback: numClick,
                ),
                CalcButton(
                  text: "8",
                  fillColor: 0xFF283637,
                  callback: numClick,
                ),
                CalcButton(
                  text: "9",
                  fillColor: 0xFF283637,
                  callback: numClick,
                ),
                CalcButton(
                  text: "*",
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: "4",
                  fillColor: 0xFF283637,
                  callback: numClick,
                ),
                CalcButton(
                  text: "5",
                  fillColor: 0xFF283637,
                  callback: numClick,
                ),
                CalcButton(
                  text: "6",
                  fillColor: 0xFF283637,
                  callback: numClick,
                ),
                CalcButton(
                  text: "-",
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: "1",
                  fillColor: 0xFF283637,
                  callback: numClick,
                ),
                CalcButton(
                  text: "2",
                  fillColor: 0xFF283637,
                  callback: numClick,
                ),
                CalcButton(
                  text: "3",
                  fillColor: 0xFF283637,
                  callback: numClick,
                ),
                CalcButton(
                  text: "+",
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: ".",
                  fillColor: 0xFF283637,
                  callback: numClick,
                ),
                CalcButton(
                  text: "0",
                  fillColor: 0xFF283637,
                  callback: numClick,
                ),
                CalcButton(
                  text: "00",
                  fillColor: 0xFF283637,
                  textSize: 26.0,
                  callback: numClick,
                ),
                CalcButton(
                  text: "=",
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  callback: evaluate,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}