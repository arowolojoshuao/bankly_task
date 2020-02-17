import 'package:bankly_task/WidgetsFormHelper/dismiss_keyboard_on_scroll.dart';
import 'package:bankly_task/components/email_field.dart';
import 'package:bankly_task/components/password_field.dart';
import 'package:bankly_task/components/signUp_button.dart';
import 'package:bankly_task/components/tools.dart';
import 'package:bankly_task/components/username_field.dart';
import 'package:bankly_task/components/validators/email_validator.dart';
import 'package:bankly_task/login.dart';
import 'package:bankly_task/main.dart';
import 'package:bankly_task/models/user.dart';
import 'package:bankly_task/services/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

/// Component Widget this layout UI
class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _isError = false;
  bool _obscureText = true;
  bool _isLoading = false;

  DatabaseHelper helper = DatabaseHelper();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences _sharedPreferences;
  List<User> userList;
  TextEditingController _emailController,
      _passwordController,
      _firstnameController,
      _lastnameController,
      _phonenumberController;
  String _errorText,
      _emailError,
      _firstnameError,
      _lastnameError,
      _passwordError,
      _phonenumberError;

  String email, firstname, lastname, phonenumber, password;

  @override
  void initState() {
    super.initState();

//    _fetchSessionAndNavigate();
    _firstnameController = new TextEditingController();
    _lastnameController = new TextEditingController();
    _phonenumberController = new TextEditingController();
    _emailController = new TextEditingController();
    _passwordController = new TextEditingController();
  }
//
//  @override
//  void dispose() {
//    // Clean up the controller when the widget is disposed.
//    _firstnameController.dispose();
//    _lastnameController.dispose();
//    _phonenumberController.dispose();
//    _emailController.dispose();
//    _passwordController.dispose();
//    super.dispose();
//  }

  _togglePin() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  _authenticateUser() async {
//    var result = await Connectivity().checkConnectivity();
//    if (result == ConnectivityResult.none) {
//      Tools.showSnacBar(
//        _scaffoldKey,
//        "Network Error! \nPlease check your internet connection, then try again",
//      );
//    }
    if (_valid()) {
      //_showLoading();
      email = _emailController.text.toLowerCase().trim();
      firstname = _firstnameController.text.trim();
      lastname = _lastnameController.text.trim();
      phonenumber = _phonenumberController.text.trim();
      password = _passwordController.text.toString();

      //date = DateFormat.yMMMd().format(DateTime.now());

      User user = User(email, password, firstname, lastname, phonenumber);
      int result;
      int output;
      result = await helper.getEmailCount(email);

      if (result != 0) {
        //_hideLoading();
        // email already exist on the db
        //  return true;
        Tools.showSnacBar(_scaffoldKey,
            "This email address has already been used on this device.\n Kindly LOGIN or Register with a new Email. ");
      } else {
        //  _hideLoading();
        // return false;
        output = await helper.insertUser(user);
        print(output);
        if (output != 0) {
          // success

//          Tools.showSnackBar(
//              'Registration successful. Kindly Login with your valid credentials',
//              _scaffoldKey);

          Navigator.of(context).pushReplacementNamed('dashboard');

//          Navigator.of(context).push(new MaterialPageRoute(
//              builder: (BuildContext context) => HomePage()));

//          var userName = _sharedPreferences.getString(Constants.username);
//          var firstName = _sharedPreferences.getString(Constants.email);
//          Tools.showTapMessage(context, "Welcome\t $userName \t $firstName");
//
        } else {
          Tools.showSnacBar(
              _scaffoldKey, 'An error occur while registering. Try again.');
        }
      }
    } else {
      setState(() {
//        _isLoading = false;
        _emailError;
        _firstnameError;
        _lastnameError;
        _phonenumberError;
        _passwordError;
      });
    }
  }

  _valid() {
    bool valid = true;
    if (_firstnameController.text.isEmpty) {
      valid = false;
      _firstnameError = "First name can't be blank!";
    }

    if (_lastnameController.text.isEmpty) {
      valid = false;
      _lastnameError = "Last name can't be blank!";
    }

    if (_phonenumberController.text.isEmpty) {
      valid = false;
      _phonenumberError = "Phone number can't be blank!";
    }

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
    } else if (_passwordController.text.length < 6 ||
        _passwordController.text.length > 6) {
      valid = false;
      _passwordError = "Password must be 6 digits!";
    }

    return valid;
  }

  _showLoading() {
    setState(() {
      _isLoading = true;
      // waitDialog(_scaffoldKey.currentContext, duration: Duration(seconds: 1));
//      showProgress(scaffoldKey.currentContext);
    });
  }

  _hideLoading() {
    setState(() {
      _isLoading = false;
      hideProgress(_scaffoldKey.currentContext);
    });
  }

  hideProgress(BuildContext context) {
    Navigator.pop(context);
  }

  /// Component Widget layout UI
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    mediaQueryData.devicePixelRatio;
    mediaQueryData.size.width;
    mediaQueryData.size.height;
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: hexToColor("#0bc0c2"),
        title: Text(
          "SIGNUP",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 4.0,
      ),
      resizeToAvoidBottomPadding: false,
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: DismissKeyboardOnScroll(
          child: CustomScrollView(slivers: <Widget>[
        SliverList(
            delegate: SliverChildListDelegate([
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    alignment: AlignmentDirectional.topCenter,
                    child: Column(
                      children: <Widget>[
                        /// padding logo
//                        Padding(
//                            padding: EdgeInsets.only(
//                                top: mediaQueryData.padding.top)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
//
                            Hero(
                              tag: "Finverse",
                              child: Text(
                                "signup",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 0.6,
                                    color: Colors.white,
                                    fontFamily: "Sans",
                                    fontSize: 20.0),
                              ),
                            ),
                          ],
                        ),

                        /// TextFromField Email
                        Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),

                        new EmailField(
                          emailController: _emailController,
                          emailError: _emailError,
                        ),

                        /// TextFromField Email
                        Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),

                        new UsernameField(
                            usernameController: _firstnameController,
                            usernameError: _firstnameError,
                            labetText: "Firstname"),

                        /// TextFromField Password
                        Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),

                        new UsernameField(
                          usernameController: _lastnameController,
                          usernameError: _lastnameError,
                          labetText: "Last name",
                        ),

                        /// TextFromField Password
                        Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),

                        /// TextFromField Password
                        Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),

                        new UsernameField(
                          usernameController: _phonenumberController,
                          usernameError: _phonenumberError,
                          labetText: "Phone number",
                        ),

                        new PasswordField(
                          passwordController: _passwordController,
                          obscureText: _obscureText,
                          passwordError: _passwordError,
                          togglePassword: _togglePin,
                        ),

                        //  Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),

                        new SignUpButton(onPressed: _authenticateUser),
//                            new SignUpButton(
//                              onPressed: () => _onBasicAlertPressed(context),
//                            ),

                        /// Button Signup
                        FlatButton(
                            padding: EdgeInsets.only(top: 0.0),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          LoginScreen()));
                            },
                            child: Text(
                              "Already have account? Click Here to Login",
                              style: TextStyle(
                                  color: Color(0xFF29ced1),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Sans"),
                            )),

                        SizedBox(
                          height: 10.0,
                        )
                      ],
                    ),
                  ),
                ],
              ),

              /// Set Animaion after user click buttonsignup
            ],
          ),
        ]))
      ])),
    );
  }
}

/// textfromfield custom class
class textFromField extends StatelessWidget {
  bool password;
  String email;
  IconData icon;
  TextInputType inputType;

  textFromField({this.email, this.icon, this.inputType, this.password});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        height: 60.0,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 10.0, color: Colors.black12)]),
        padding:
            EdgeInsets.only(left: 20.0, right: 30.0, top: 0.0, bottom: 0.0),
        child: Theme(
          data: ThemeData(
            hintColor: Colors.transparent,
          ),
          child: TextFormField(
            obscureText: password,
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: email,
                icon: Icon(
                  icon,
                  color: Colors.black38,
                ),
                labelStyle: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Sans',
                    letterSpacing: 0.3,
                    color: Colors.black38,
                    fontWeight: FontWeight.w600)),
            keyboardType: inputType,
          ),
        ),
      ),
    );
  }
}
