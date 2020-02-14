import 'dart:async';

import 'package:bankly_task/main.dart';
import 'package:bankly_task/walkthrough/utils/constants.dart';
import 'package:bankly_task/walkthrough/utils/my_navigator.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () => MyNavigator.goToIntro(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: hexToColor("#29ced1")),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 60.0),
                        height: 150.0,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/messymiddle.png",
                              height: MediaQuery.of(context).size.height * 0.15,
                              width: MediaQuery.of(context).size.height * 0.15,
                              fit: BoxFit.fill,
                            ),
//                    SizedBox(
//                      height: 10,
//                    ),
////
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 3.0),
                      ),
                      Text(
                        "Bankly Task",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      Constants.store,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
