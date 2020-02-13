import 'package:bankly_task/Signup.dart';
import 'package:bankly_task/WidgetsFormHelper/login_button.dart';
import 'package:bankly_task/components/email_field.dart';
import 'package:bankly_task/components/password_field.dart';
import 'package:bankly_task/components/tools.dart';
import 'package:bankly_task/components/validators/email_validator.dart';
import 'package:bankly_task/main.dart';
import 'package:bankly_task/models/user.dart';
import 'package:bankly_task/screens/homepage.dart';
import 'package:bankly_task/services/database_helper.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'WidgetsFormHelper/dismiss_keyboard_on_scroll.dart';
import 'WidgetsFormHelper/lostpassworddialog.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _isError = false;
  bool _obscureText = true;
  bool _isLoading = false;
  TextEditingController _emailController, _passwordController;
  String _errorText, _emailError, _passwordError;
  String email, password;
  DatabaseHelper helper = DatabaseHelper();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences _sharedPreferences;

  @override
  void initState() {
    super.initState();

    _emailController = new TextEditingController();
    _passwordController = new TextEditingController();
  }

  _togglePin() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  _authenticateUser() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Tools.showSnacBar(
        _scaffoldKey,
        "Network Error! \nPlease check your internet connection, then try again",
      );
    } else if (_valid()) {
      email = _emailController.text.toLowerCase().trim();
      password = _passwordController.text.toLowerCase().trim();
      try {
        User result = await helper.loginEmailAndPassword(email, password);

        if (result != null) {
          // registered

          // Tools.showSnackBar("Login attempt Successful", _scaffoldKey);

          Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new HomePage()));
        } else {
          // registration failed

          Tools.showSnacBar(_scaffoldKey,
              " Login attempt failed, Kindly try again with valid credentials");
        }
      } catch (e) {
        print('Error: $e');
      }
    } else {
      setState(() {
//        _isLoading = false;
        _emailError;
        _passwordError;
      });
    }
  }

  _valid() {
    bool valid = true;

    if (_emailController.text.isEmpty) {
      valid = false;
      _emailError = "Email can't be blank!";
    } else if (!_emailController.text.contains(EmailValidator.regex)) {
      valid = false;
      _emailError = "Enter valid email!";
    }

    if (_passwordController.text.isEmpty) {
      valid = false;
      _passwordError = "Password can't be blank!";
    } else if (_passwordController.text.length < 6) {
      valid = false;
      _passwordError = "Password is invalid!";
    }

    return valid;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Container(),
        backgroundColor: hexToColor("#0bc0c2"),
        title: Text(
          "LOGIN",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 4.0,
      ),
      body: DismissKeyboardOnScroll(
          child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 50.0, 0.0, 0.0),
                      child: Text('Welcome back.',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: hexToColor("#0bc0c2"))),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(16.0, 90.0, 0.0, 0.0),
                      child: Text('Please sign in to continue',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey)),
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 80.0, left: 5.0, right: 5.0),
                  child: Column(
                    children: <Widget>[
                      EmailField(
                          emailController: _emailController,
                          emailError: _emailError),

                      /// TextFromField Password
                      Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                      new PasswordField(
                        passwordController: _passwordController,
                        obscureText: _obscureText,
                        passwordError: _passwordError,
                        togglePassword: _togglePin,
                      ),

                      Container(
                        alignment: Alignment.centerRight,
                        padding:
                            EdgeInsets.only(top: 35.0, left: 10.0, right: 10.0),
                        child: InkWell(
                          child: Text(
                            'Forgot Password? Click here ',
                            style: TextStyle(
                              color: hexToColor("#0bc0c2"),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          onTap: () {
                            showLostPasswordDialog(context);
                          },
                        ),
                      ),

//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          FlatButton(
//                            child: Text("Forgot Password ?"),
//                            textColor: Color(0xFF29ced1),
//                            onPressed: () {
//                              showLostPasswordDialog(context);
//                            },
//                          )
//                        ],
//                      ),
                      SizedBox(
                        height: 10.0,
                      ),

                      LoginButton(onPressed: _authenticateUser),

                      /// Button Signup
                      FlatButton(
                          padding: EdgeInsets.only(top: 5.0),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SignupScreen()));
                          },
                          child: Text(
                            "Not Have Acount? Click Here to Sign Up",
                            style: TextStyle(
                                color: Color(0xFF29ced1),
                                fontSize: 13.0,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Sans"),
                          )),
                    ],
                  )),
              SizedBox(height: 15.0),
              SizedBox(height: 40.0),
            ]),
          )
        ],
      )),
    );
  }
}
