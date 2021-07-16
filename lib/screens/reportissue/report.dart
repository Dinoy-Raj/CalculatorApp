import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:url_launcher/url_launcher.dart';

class ReportIssue extends StatefulWidget {
  const ReportIssue({Key? key}) : super(key: key);

  @override
  _ReportIssueState createState() => _ReportIssueState();
}

class _ReportIssueState extends State<ReportIssue> {
  final Uri emailLaunchUriDA = Uri(
    scheme: 'mailto',
    path: 'dinoykraj@gmail.com',
  );

  static const _lind = 'https://www.linkedin.com/in/dinoy-raj-k/';
  void _launchLinkD() async => await canLaunch(_lind)
      ? await launch(_lind)
      : throw 'Could not launch $_lind';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        leading: IconButton(
            splashRadius: .5,
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            icon: Tooltip(
              message: "Exit",
              child: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.black,
              ),
            )),
      ),
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: screenWidth,
                  height: 100,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "If you face any issues, feel free to share with us",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        height: 2 / 1,
                        color: Colors.grey,
                      ),
                    ),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 200,
                        width: screenWidth * .8,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white10,
                            border: Border.all(color: Colors.white, width: 1),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.1),
                                blurRadius: 100,
                                spreadRadius: 2,
                                offset: Offset(0, 3),
                              ),
                            ]
                            //borderRadius: BorderRadius.circular(10),
                            ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Mail Us",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black.withOpacity(.4),
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                  height: 40,
                                  width: screenWidth * .6,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      launch(emailLaunchUriDA.toString());
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white10),
                                        elevation: MaterialStateProperty.all(0),
                                        side: MaterialStateProperty.all(
                                            BorderSide(color: Colors.white))),
                                    child: Text(
                                      "Click Here",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black.withOpacity(.7)),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: screenHeight * .1,
                  width: screenWidth,
                ),
                Container(
                  height: screenHeight * .1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Developed By "),
                      TextButton(
                          onPressed: () {
                            _launchLinkD();
                          },
                          child: Text(
                            "Dinoy Raj",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
