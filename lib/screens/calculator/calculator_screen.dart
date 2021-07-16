import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:multicalculator/screens/reportissue/report.dart';

class HomeCal extends StatefulWidget {
  @override
  HomeCalState createState() => HomeCalState();
}

class HomeCalState extends State<HomeCal> with SingleTickerProviderStateMixin {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 50;
  double resultFontSize = 30;
  Color whiteColor = Colors.white;
  Color blackColor = Colors.black;
  Color swapColor = Colors.grey;

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "c") {
        resultFontSize = 30;
        equationFontSize = 50;
        equation = "0";
        result = "0";
      } else {
        if (equation == "0") {
          equation = buttonText;
          resultFontSize = 30;
          equationFontSize = 50;
        } else {
          equation = equation + buttonText;
          resultFontSize = 30;
          equationFontSize = 50;
        }
      }
    });
  }

  backSpace() {
    setState(() {
      if (equation == "0") {
        equation = "0";
        resultFontSize = 30;
        equationFontSize = 50;
      } else {
        equation = equation.substring(0, equation.length - 1);
        resultFontSize = 30;
        equationFontSize = 50;
      }
    });
  }

  equalTo() {
    setState(() {
      resultFontSize = 50;
      equationFontSize = 30;
      expression = equation;
      expression = expression.replaceAll("x", "*");

      try {
        Parser p = Parser();
        Expression exp = p.parse(expression);

        ContextModel cm = ContextModel();
        result = '${exp.evaluate(EvaluationType.REAL, cm)}';
      } catch (e) {
        result = "ERROR :(";
        showDialog(context: context, builder: (_) => errorDev());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double buttonSizev = screenHeight > 539.2000122070312
        ? screenHeight * .105
        : 56.61600128173828;

    return Container(
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: whiteColor,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.category_rounded,
              color: blackColor,
            ),
          ),
          title: Text(
            "Calculator",
            style: TextStyle(
                color: blackColor, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    swapColor = blackColor;
                    blackColor = whiteColor;
                    whiteColor = swapColor;
                  });
                },
                icon: Icon(
                  blackColor == Colors.black
                      ? Icons.wb_sunny_outlined
                      : Icons.wb_sunny,
                  color: blackColor,
                  size: 20,
                ),
                tooltip: "Light/Dark Mode")
          ],
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 8.0, right: 15, left: 15, bottom: 8),
          child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: screenHeight * .09,
                ),
                Container(
                  width: screenWidth,
                  height: 70,
                  padding: EdgeInsets.only(right: screenWidth * .1),
                  alignment: Alignment.centerRight,
                  //color: Colors.grey,

                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    child: SelectableText(
                      equation,
                      style: TextStyle(
                        fontSize: equationFontSize,
                        color: blackColor,
                        //fontWeight: FontWeight.bold,
                      ),
                      //textScaleFactor: .5,
                    ),
                  ),
                ),
                Container(
                  height: screenHeight * .007,
                ),
                Container(
                  width: screenWidth,
                  height: 70,
                  padding: EdgeInsets.only(right: screenWidth * .1),
                  alignment: Alignment.centerRight,
                  //color: Colors.grey,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    child: SelectableText(
                      result,
                      style: TextStyle(
                        fontSize: resultFontSize,
                        color: blackColor,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: screenHeight * .03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: screenWidth * .90,
                      child: Table(
                        children: [
                          TableRow(children: [
                            normalButton("c", buttonSizev),
                            normalButton("%", buttonSizev),
                            normalButton("+-", buttonSizev),
                            normalButton("/", buttonSizev),
                          ]),
                          TableRow(children: [
                            normalButton("7", buttonSizev),
                            normalButton("8", buttonSizev),
                            normalButton("9", buttonSizev),
                            normalButton("x", buttonSizev),
                          ]),
                          TableRow(children: [
                            normalButton("4", buttonSizev),
                            normalButton("5", buttonSizev),
                            normalButton("6", buttonSizev),
                            normalButton("-", buttonSizev),
                          ]),
                          TableRow(children: [
                            normalButton("1", buttonSizev),
                            normalButton("2", buttonSizev),
                            normalButton("3", buttonSizev),
                            normalButton("+", buttonSizev),
                          ]),
                          TableRow(children: [
                            buttonCon("", buttonSizev),
                            normalButton("0", buttonSizev),
                            normalButton(".", buttonSizev),
                            buttonBon("", buttonSizev)
                          ]),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: screenHeight * .01,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget normalButton(String buttonName, double buttonHeight) {
    return Container(
      color: whiteColor,
      padding: EdgeInsets.all(1),
      height: buttonHeight,
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(whiteColor)),
        onPressed: () => buttonPressed(buttonName),
        child: Text(
          buttonName,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: blackColor, fontSize: 20),
        ),
      ),
    );
  }

  Widget buttonCon(String buttonName, double buttonHeight) {
    return Container(
      color: whiteColor,
      padding: EdgeInsets.all(1),
      height: buttonHeight,
      child: ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(whiteColor)),
          onPressed: () => backSpace(),
          child: Icon(
            Icons.backspace_outlined,
            color: blackColor,
          )),
    );
  }

  Widget buttonBon(String buttonName, double buttonHeight) {
    return Container(
      color: whiteColor,
      padding: EdgeInsets.all(1),
      height: buttonHeight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ButtonStyle(
              //elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(blackColor)),
          onPressed: () => equalTo(),
          child: Text(
            "=",
            style: TextStyle(
                color: whiteColor, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }

  Widget errorDev() {
    return AlertDialog(
      title: Text(
        "Possible Errors",
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("1. Insufficient Operands"),
              Text("2. Balanced Expression"),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      actions: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Container(
                height: 35,
                width: 100,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.white),
                      elevation: MaterialStateProperty.all(0),
                      side: MaterialStateProperty.all(BorderSide(
                          width: 1, color: Colors.red.withOpacity(.5))),
                      overlayColor: MaterialStateProperty.all(
                          Colors.redAccent.withOpacity(.5))),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Close",
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                )),
            Container(
                height: 35,
                width: 100,
                child: Tooltip(
                  message: "Report Other Issue",
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Colors.black.withOpacity(.7)),
                      overlayColor:
                      MaterialStateProperty.all(Colors.black),
                      //elevation: MaterialStateProperty.all(0),
                      //shape: MaterialStateProperty.all(),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ReportIssue()));
                    },
                    child: Text(
                      "Report",
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )),
          ],
        )
      ],
    );
  }
}
