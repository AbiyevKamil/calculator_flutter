import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculator/components/calc_button.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color txtColor = Colors.black.withOpacity(0.8);
  bool isDark = false;
  String expression = "";
  String history = "";
  void setExpression(String newExpression) {
    setState(() {
      expression += newExpression;
    });
  }

  void allClear(_) {
    setState(() {
      expression = "";
      history = "";
    });
  }

  void clear(_) {
    setState(() {
      expression = "";
    });
  }

  void evaluate(_) {
    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      setState(() {
        history = expression;
        expression = exp.evaluate(EvaluationType.REAL, cm).toString();
      });
    } catch (err) {
      SnackBar snackBar =
          SnackBar(content: Text("Can't calculate expression."));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? txtColor : Colors.white,
      appBar: AppBar(
        backgroundColor: isDark ? txtColor : Colors.white,
        title: Text(
          "Calculator",
          style: TextStyle(
            fontSize: 34,
            color: isDark ? Colors.white : txtColor,
          ),
        ),
        actions: [
          CupertinoSwitch(
            value: isDark,
            onChanged: (v) {
              setState(() {
                isDark = !isDark;
              });
            },
          ),
          SizedBox(
            width: 10.0,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              history,
              style: TextStyle(
                color: isDark ? Colors.white : Colors.black.withOpacity(0.5),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              expression,
              style: TextStyle(
                color: isDark ? Colors.white : txtColor,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: CalcButton(
                      callback: allClear, txt: "AC", txtColor: Colors.green)),
              Expanded(
                  child: CalcButton(
                      callback: clear, txt: "C", txtColor: Colors.green)),
              Expanded(
                  child: CalcButton(
                      callback: setExpression,
                      txt: "%",
                      txtColor: Colors.green)),
              Expanded(
                child: CalcButton(
                  callback: setExpression,
                  txt: "/",
                  txtColor: Colors.green,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: CalcButton(callback: setExpression, txt: "7")),
              Expanded(child: CalcButton(callback: setExpression, txt: "8")),
              Expanded(child: CalcButton(callback: setExpression, txt: "9")),
              Expanded(
                child: CalcButton(
                  callback: setExpression,
                  txt: "*",
                  txtColor: Colors.green,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: CalcButton(callback: setExpression, txt: "4")),
              Expanded(child: CalcButton(callback: setExpression, txt: "5")),
              Expanded(child: CalcButton(callback: setExpression, txt: "6")),
              Expanded(
                child: CalcButton(
                  callback: setExpression,
                  txt: "-",
                  txtColor: Colors.green,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: CalcButton(callback: setExpression, txt: "1")),
              Expanded(child: CalcButton(callback: setExpression, txt: "2")),
              Expanded(child: CalcButton(callback: setExpression, txt: "3")),
              Expanded(
                  child: CalcButton(
                      callback: setExpression,
                      txt: "+",
                      txtColor: Colors.green)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 2,
                  child: CalcButton(callback: setExpression, txt: "0")),
              Expanded(
                  flex: 1,
                  child: CalcButton(callback: setExpression, txt: ".")),
              Expanded(
                  flex: 1,
                  child: CalcButton(
                    callback: evaluate,
                    txt: "=",
                    txtColor: Colors.white,
                    bgColor: Colors.green.withOpacity(0.8),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
