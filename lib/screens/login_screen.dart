import 'package:boxicons_flutter/boxicons_flutter.dart';
import 'package:dragonfistfitness/constants.dart';
import 'package:dragonfistfitness/screens/home_screen.dart';
import 'package:dragonfistfitness/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'forgotpassword_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;
  String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Column(
            children: [
              showAlert(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                      ),
                      Text(
                        'WELCOME BACK TO THE',
                        style: kLabelTextStyle.copyWith(
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'DRAGONFIST DOJO',
                        style: kHeadingTextStyle,
                      ),
                      SizedBox(height: 24),
                      TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter an email';
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your email',
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value.length <= 5) {
                            return 'Your password must be atleast 6 characters long';
                          }
                        },
                        obscureText: true,
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your password',
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Material(
                        color: kAccentColor,
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        elevation: 5.0,
                        child: MaterialButton(
                          onPressed: () async {
                            if (formKey.currentState.validate()) {
                              setState(() {
                                showSpinner = true;
                              });
                              try {
                                final user =
                                    await _auth.signInWithEmailAndPassword(
                                        email: email, password: password);
                                if (user != null) {
                                  Navigator.pushNamed(context, HomeScreen.id);
                                }
                                setState(() {
                                  showSpinner = false;
                                });
                              } catch (e) {
                                setState(() {
                                  showSpinner = false;
                                  error = e.message;
                                });
                              }
                            }
                          },
                          height: 42.0,
                          child: Text(
                            'Log In',
                            style: kLabelTextStyle,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Container(
                        width: double.infinity,
                        child: FlatButton(
                            child: RichText(
                              text: TextSpan(
                                text: "Don't have an Account? ",
                                style: kLabelTextStyle,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Sign Up',
                                    style: kLabelTextStyle.copyWith(
                                      color: kAccentColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RegistrationScreen.id);
                            }),
                      ),
                      FlatButton(
                        child: Text(
                          "Forgot Password?",
                          style: kLabelTextStyle,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, ForgotPasswordScreen.id);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showAlert() {
    if (error != null) {
      return Container(
        color: Color(0xFFFF7043),
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(Boxicons.bxsError),
            ),
            Expanded(
              child: Text(
                error,
                maxLines: 3,
              ),
            ),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                setState(() {
                  error = null;
                });
              },
            )
          ],
        ),
      );
    }
    return SizedBox(
      height: 0,
    );
  }
}
