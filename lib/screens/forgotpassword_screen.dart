import 'package:flutter/material.dart';
import 'package:dragonfistfitness/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:boxicons_flutter/boxicons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String id = 'forgotpassword_screen';
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  bool showSpinner = false;
  final formKey = GlobalKey<FormState>();
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Reset your password',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Source Sans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 48.0,
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
                                await _auth.sendPasswordResetEmail(
                                    email: email);
                                setState(() {
                                  showSpinner = false;
                                  error =
                                      "A password reset link has been sent to $email";
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
                          height: 42.0,
                          child: Text(
                            'Submit',
                            style: kLabelTextStyle,
                          ),
                        ),
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
