import 'package:boxicons_flutter/boxicons_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dragonfistfitness/constants.dart';
import 'package:dragonfistfitness/screens/home_screen.dart';
import 'package:dragonfistfitness/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  final _firestore = Firestore.instance;
  bool showSpinner = false;
  String email;
  String password;
  String lastName, firstName;
  String error;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF121212),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: Colors.white,
          ),
        ),
      ),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      Text('WELCOME BACK TO THE',
                          style: kLabelTextStyle.copyWith(
                              fontWeight: FontWeight.w900)),
                      SizedBox(
                        height: 8,
                      ),
                      Text('DRAGONFIST DOJO', style: kHeadingTextStyle),
                      SizedBox(height: 24),
                      TextFormField(
                        // ignore: missing_return
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your first name';
                          }
                        },
                        onChanged: (value) {
                          firstName = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your first name',
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      TextFormField(
                          // ignore: missing_return
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your last name';
                            }
                          },
                          onChanged: (value) {
                            lastName = value;
                          },
                          decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Enter your last name',
                          )),
                      SizedBox(
                        height: 24.0,
                      ),
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
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        elevation: 5.0,
                        child: MaterialButton(
                          onPressed: () async {
                            if (formKey.currentState.validate()) {
                              setState(() {
                                showSpinner = true;
                              });
                              try {
                                final newUser =
                                    await _auth.createUserWithEmailAndPassword(
                                        email: email, password: password);
                                if (newUser != null) {
                                  final FirebaseUser user =
                                      await _auth.currentUser();
                                  final uid = user.uid;
                                  _firestore
                                      .collection("userData")
                                      .document(uid)
                                      .setData({
                                    'firstName': firstName,
                                    'lastName': lastName,
                                    'admin': false,
                                  });
                                  _firestore
                                      .collection("userData")
                                      .document(uid)
                                      .collection("trainingProgress")
                                      .document(uid)
                                      .setData({'completed': 0, 'hours': 0});
                                  _firestore
                                      .collection("userData")
                                      .document(uid)
                                      .collection("trainingWeek")
                                      .document(uid)
                                      .setData({
                                    'Monday': false,
                                    'Tuesday': false,
                                    'Wednesday': false,
                                    'Thursday': false,
                                    'Friday': false,
                                    'Saturday': false,
                                    'Sunday': false
                                  });
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
                          minWidth: 200.0,
                          height: 48.0,
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(
                              fontFamily: 'Source Sans',
                              fontSize: 20.0,
                              color: Color(0xDEFFFFFF),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                      FlatButton(
                          child: RichText(
                            text: TextSpan(
                                text: "Already Have an account? ",
                                style: kLabelTextStyle,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Sign in',
                                    style: kLabelTextStyle.copyWith(
                                      color: kAccentColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ]),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, LoginScreen.id);
                          }),
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
