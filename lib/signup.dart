import 'package:bankly_task/main.dart';
import 'package:flutter/material.dart';

import 'WidgetsFormHelper/dismiss_keyboard_on_scroll.dart';

class SignupPage extends StatefulWidget {
  static const routeName = '/signup';
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: hexToColor("#0bc0c2"),
          title: Text("Sign Up"),
        ),
        resizeToAvoidBottomPadding: false,
        body: DismissKeyboardOnScroll(
          child: CustomScrollView(
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                      padding:
                          EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                                labelText: 'Email Address:',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                // hintText: 'EMAIL',
                                // hintStyle: ,
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                  color: hexToColor("#0bc0c2"),
                                ))),
                          ),
                          TextField(
                            decoration: InputDecoration(
                                labelText: 'First Name: ',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: hexToColor("#0bc0c2")))),
                            obscureText: true,
                          ),
                          SizedBox(height: 10.0),
                          TextField(
                            decoration: InputDecoration(
                                labelText: 'Last Name: ',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: hexToColor("#0bc0c2")))),
                          ),
                          SizedBox(height: 10.0),
                          TextField(
                            decoration: InputDecoration(
                                labelText: 'Password: ',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: hexToColor("#0bc0c2")))),
                          ),
                          SizedBox(height: 10.0),
                          TextField(
                            decoration: InputDecoration(
                                labelText: 'Phone Number:',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: hexToColor("#0bc0c2")))),
                          ),
                          SizedBox(height: 50.0),
                          Container(
                            height: 40.0,
                            child: Container(
                              height: 50.0,
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      'dashboard',
                                      (Route<dynamic> route) => false);
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.all(0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        hexToColor("#0bc0c2"),
                                        hexToColor("#29ced1")
                                      ],
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'SIGNUP',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                ),
                              ),

//                    Material(
//                      borderRadius: BorderRadius.circular(20.0),
//                      shadowColor: Colors.blue[800],
//                      color: Colors.blue[800],
//                      elevation: 7.0,
//                      child: GestureDetector(
//                        onTap: () {
//                          Navigator.of(context).pushNamed('/dashboard');
//                        },
//                        child: Center(
//                          child: Text(
//                            'LOGIN',
//                            style: TextStyle(
//                                color: Colors.white,
//                                fontWeight: FontWeight.bold,
//                                fontFamily: 'Montserrat'),
//                          ),
//                        ),
//                      ),
//                    ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            height: 40.0,
                            color: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 1.0),
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Center(
                                  child: Text('Go Back',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat')),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30.0),
                        ],
                      )),
                ]),
              )
            ],
          ),
        ));
  }
}
