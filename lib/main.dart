import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Calculator());
  


}
class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Calculator',
      home: SimpleCalculator(),


    );
    


  }
}
class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({Key? key}) : super(key: key);

  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "AC") {
       _output = "0";
       num1 = 0.0;
       num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "*" ||
        buttonText == "/") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    }
    else if (buttonText == ".") {
      if (_output.contains("")) {
        print("Contains Decimal");
        return;
      }
      else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "*") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }
    print(_output);
    setState(() {
      output = double.parse(_output).toString();


    });
  }

  Widget buildButton(String buttonText){
  return Expanded(
   child: FlatButton(
  padding: EdgeInsets.all(30.0),
  child: Text(buttonText,
     style: TextStyle( fontSize:30.0,
     fontWeight: FontWeight.bold),
  ),
     onPressed: () =>
    buttonPressed(buttonText),
color: Colors.black26,
     textColor: Colors.white,

  ));
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(title: Text("Calculator"),
      centerTitle: true,
      backgroundColor: Colors.orange,
      elevation: 0.0,),
      body: Container(
        color: Colors.black26,
        child: Column(
          children: <Widget> [
            Container (
              color: Colors.black26,
              alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 12.0,

                ),
                child: Text(output, style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ))),
            Expanded(
              child: Divider(),
            ),
             
              Column(
                children: [Row(
                children: [
                  buildButton('0'),
                  buildButton('.'),
                  buildButton('='),
                  buildButton(''),


                ]),
                  new Row(
                    children: [
                      buildButton('1'),
                      buildButton('2'),
                      buildButton('3'),
                      buildButton('+'),


                    ]),
                  new Row(
                    children: [
                      buildButton('4'),
                      buildButton('5'),
                      buildButton('6'),
                      buildButton('-'),


                    ]),
                  new Row(
                    children: [
                      buildButton('7'),
                      buildButton('8'),
                      buildButton('9'),
                      buildButton('*'),


                    ]),
                  new Row(
                    children: [
                      buildButton('AC'),
                      buildButton('+/-'),
                      buildButton('%'),
                      buildButton('/'),


                    ]),

                ]),
              ]),




          ),

      );

  }
}






