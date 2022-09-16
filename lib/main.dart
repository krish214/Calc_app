import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './widgets/CalcButton.dart';

void main() {
  runApp(CalcApp());
}

List<Color> bgColor = [
  Colors.red,
  Colors.greenAccent,
  Colors.green,
  Colors.grey,
  Colors.blue
];
List<Color> btColor = [
  Colors.green,
  Colors.yellow,
  Colors.green,
  Colors.grey,
  Colors.blue
];
int index = 0;

List<Color> symbolColor = [
  Colors.yellowAccent,
  Colors.redAccent,
  Colors.blueAccent,
  Colors.greenAccent,
  Colors.grey
];

class CalcApp extends StatefulWidget {
  const CalcApp({Key? key}) : super(key: key);

  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  String _history = '';
  String _expression = '';
  String lastClicked = '';

  void changeColor(String text) {
    setState(() {
      if (index == 4) {
        index = 0;
        return;
      }
      index = index + 1;
    });
  }

  void numClick(String text) {
    setState(() {
      _expression += text;
      lastClicked = text;
    });
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      if (_expression.length > 0) {
        _expression = _expression.substring(0, _expression.length - 1);
      } else {
        _expression = '';
      }
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toStringAsFixed(4);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(
        backgroundColor: bgColor[index],
        body: Container(
          padding: EdgeInsets.all(2),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Text(
                        _history,
                        style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                            fontSize: 24,
                            color: Color(050000),
                          ),
                        ),
                      ),
                    ),
                    alignment: Alignment(1.0, 1.0),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Text(
                        _expression,
                        style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                            fontSize: 48,
                            color: Color(0xFF050000),
                          ),
                        ),
                      ),
                    ),
                    alignment: Alignment(1.0, 1.0),
                  ),
                  SizedBox(height: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CalcButton(
                        text: 'AC',
                        fillColor: btColor[index],
                        textSize: 20,
                        callback: allClear,
                      ),
                      CalcButton(
                        text: 'C',
                        fillColor: btColor[index],
                        callback: clear,
                      ),
                      CalcButton(
                        text: '%',
                        fillColor: symbolColor[index],
                        textColor: 0xFF050000,
                        callback: numClick,
                      ),
                      CalcButton(
                        text: '/',
                        fillColor: symbolColor[index],
                        textColor: 0xFF050000,
                        callback: numClick,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CalcButton(
                        text: '7',
                        callback: numClick,
                      ),
                      CalcButton(
                        text: '8',
                        callback: numClick,
                      ),
                      CalcButton(
                        text: '9',
                        callback: numClick,
                      ),
                      CalcButton(
                        text: '*',
                        fillColor: symbolColor[index],
                        textColor: 0xFF050000,
                        textSize: 24,
                        callback: numClick,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CalcButton(
                        text: '4',
                        callback: numClick,
                      ),
                      CalcButton(
                        text: '5',
                        callback: numClick,
                      ),
                      CalcButton(
                        text: '6',
                        callback: numClick,
                      ),
                      CalcButton(
                        text: '-',
                        fillColor: symbolColor[index],
                        textColor: 0xFF050000,
                        textSize: 38,
                        callback: numClick,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CalcButton(
                        text: '1',
                        callback: numClick,
                      ),
                      CalcButton(
                        text: '2',
                        callback: numClick,
                      ),
                      CalcButton(
                        text: '3',
                        callback: numClick,
                      ),
                      CalcButton(
                        text: '+',
                        fillColor: symbolColor[index],
                        textColor: 0xFF050000,
                        textSize: 30,
                        callback: numClick,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CalcButton(
                        text: '.',
                        callback: numClick,
                      ),
                      CalcButton(
                        text: '0',
                        callback: numClick,
                      ),
                      CalcButton(
                        text: 'T',
                        callback: changeColor,
                        textSize: 26,
                      ),
                      CalcButton(
                        text: '=',
                        fillColor: symbolColor[index],
                        textColor: 0xFF050000,
                        callback: evaluate,
                      ),
                    ],
                  )
                ],
              ),
              Positioned(
                right: 10,
                top: 0,
                child: SafeArea(
                  child: ElevatedButton(
                      onPressed: () => changeColor(''),
                      child: Text('Change color')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
