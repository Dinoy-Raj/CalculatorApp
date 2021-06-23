// import 'package:calculator/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';



class homeCal extends StatefulWidget {
  @override
  _homeCalState createState() => _homeCalState();
}

class _homeCalState extends State<homeCal> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;



  @override
  void initState()
  {
    _controller = AnimationController(vsync: this ,duration: duration);
    _scaleAnimation = Tween<double>(begin: 1 ,end: .6).animate(_controller);
    super.initState();
  }

  @override
  void dispose()
  {
    _controller.dispose();
    super.dispose();
  }




  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 50;
  double resultFontSize = 30;
  Color whiteColor = Colors.white;
  Color blackColor = Colors.black;
  Color swapColor = Colors.grey;
  bool isCollapsed = true;
  final Duration duration = const Duration(milliseconds: 400);
  bool mode = true;


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
      if (equation == "") {
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

    return AnimatedPositioned(
      duration: duration,
      top:0,
      bottom:0 ,
      left:isCollapsed?0:.2*screenWidth ,
      right:isCollapsed?0: -.4*screenWidth ,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: GestureDetector(
          onTap: (){
            setState(() {
              if(!isCollapsed)
              {
                _controller.reverse();
                isCollapsed = !isCollapsed;
              }

            });
          },
          child: Material(
            animationDuration: duration,
            color: Colors.white,
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            //elevation: 8,
            child: Container(
              child: Scaffold(
                backgroundColor: whiteColor,
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: whiteColor,
                  leading: IconButton(

                      onPressed: () {
                        setState(() {
                          if(isCollapsed)
                          {
                            _controller.forward();
                          }
                          else{
                            _controller.reverse();
                          }
                          isCollapsed = !isCollapsed;
                        });

                      },
                      icon: Icon(
                        Icons.menu,
                        color: blackColor,
                      ),
                      tooltip: "Menu Bar"
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
                            mode=!mode;
                            swapColor= blackColor;
                            blackColor = whiteColor;
                            whiteColor = swapColor;
                          });
                        },
                        icon: Icon(
                          blackColor==Colors.black?Icons.wb_sunny_outlined:Icons.wb_sunny,
                          color: blackColor,
                          size: 20,
                        ),
                        tooltip: "Light/Dark Mode"
                    )
                  ],
                ),
                body: Padding(
                  padding:
                  const EdgeInsets.only(top: 8.0, right: 15, left: 15, bottom: 8),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        //crossAxisAlignment: CrossAxisAlignment.center,
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
                            child: Text(
                              equation,
                              style: TextStyle(
                                fontSize: equationFontSize,
                                color: blackColor,
                                //fontWeight: FontWeight.bold,
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
                            child: Text(
                              result,
                              style: TextStyle(
                                fontSize: resultFontSize,
                                color: blackColor,
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            height: screenHeight * .03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: screenWidth * .90,
                                child: Table(
                                  children: [
                                    TableRow(children: [
                                      Button("c", buttonSizev),
                                      Button("%", buttonSizev),
                                      Button("+-", buttonSizev),
                                      Button("/", buttonSizev),
                                    ]),
                                    TableRow(children: [
                                      Button("7", buttonSizev),
                                      Button("8", buttonSizev),
                                      Button("9", buttonSizev),
                                      Button("x", buttonSizev),
                                    ]),
                                    TableRow(children: [
                                      Button("4", buttonSizev),
                                      Button("5", buttonSizev),
                                      Button("6", buttonSizev),
                                      Button("-", buttonSizev),
                                    ]),
                                    TableRow(children: [
                                      Button("1", buttonSizev),
                                      Button("2", buttonSizev),
                                      Button("3", buttonSizev),
                                      Button("+", buttonSizev),
                                    ]),
                                    TableRow(children: [
                                      ButtonCon("", buttonSizev),
                                      Button("0", buttonSizev),
                                      Button(".", buttonSizev),
                                      ButtonBon("", buttonSizev)
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
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget Button(String buttonName, double buttonHeight) {
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

  Widget ButtonCon(String buttonName, double buttonHeight) {
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

  Widget ButtonBon(String buttonName, double buttonHeight) {
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
      title: Text("Contact Developer"),
      content: Text("Did You Face Any Error ?"),
      actions: [
        ElevatedButton(onPressed: () {}, child: Text("Yes")),
        ElevatedButton(onPressed: () {}, child: Text("No")),
      ],
    );
  }
}
