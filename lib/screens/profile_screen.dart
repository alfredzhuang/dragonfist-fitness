import 'package:boxicons_flutter/boxicons_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dragonfistfitness/constants.dart';
import 'package:line_icons/line_icons.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'profile_screen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  final _firestore = Firestore.instance;
  String firstName = "", lastName = "";
  int completed = 0, hours = 0;
  bool one = false,
      two = false,
      three = false,
      four = false,
      five = false,
      six = false,
      seven = false;
  bool admin = false;
  bool showSpinner = false;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      setState(() {
        showSpinner = true;
      });
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        final uid = loggedInUser.uid;
        await _firestore
            .collection("userData")
            .document(uid)
            .get()
            .then((result) async {
          setState(() {
            firstName = result.data["firstName"];
            lastName = result.data["lastName"];
            admin = result.data["admin"];
          });
        });
        await _firestore
            .collection("userData")
            .document(uid)
            .collection("trainingProgress")
            .document(uid)
            .get()
            .then((result) async {
          setState(() {
            completed = result.data['completed'];
            hours = result.data['hours'];
          });
        });
        await _firestore
            .collection("userData")
            .document(uid)
            .collection("trainingWeek")
            .document(uid)
            .get()
            .then((result) async {
          setState(() {
            one = result.data['Monday'];
            two = result.data['Tuesday'];
            three = result.data['Wednesday'];
            four = result.data['Thursday'];
            five = result.data['Friday'];
            six = result.data['Saturday'];
            seven = result.data['Sunday'];
          });
        });
        setState(() {
          showSpinner = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      // body: FutureBuilder(),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 50),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('images/ianlim.jpg'),
                            maxRadius: 42,
                          ),
                        ],
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Welcome,",
                                style: kLabelTextStyle.copyWith(
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Column(
                            children: [
                              Text(
                                "$firstName $lastName",
                                style: kLabelTextStyle.copyWith(
                                  color: kAccentColor,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 24.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
//          adminWidget(),
                  Container(
                    height: 440,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(12),
                            margin: EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              color: Color(0xFF1D1D1D),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Your Training Week",
                                  style: kLabelTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "MON",
                                              style: kLabelTextStyle.copyWith(
                                                fontSize: 12.0,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            trainingWeek(day: one),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "TUE",
                                              style: kLabelTextStyle.copyWith(
                                                fontSize: 12.0,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            trainingWeek(day: two),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "WED",
                                              style: kLabelTextStyle.copyWith(
                                                fontSize: 12.0,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            trainingWeek(day: three),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "THU",
                                              style: kLabelTextStyle.copyWith(
                                                fontSize: 12.0,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            trainingWeek(day: four),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "FRI",
                                              style: kLabelTextStyle.copyWith(
                                                fontSize: 12.0,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            trainingWeek(day: five),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "SAT",
                                              style: kLabelTextStyle.copyWith(
                                                fontSize: 12.0,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            trainingWeek(day: six),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "SUN",
                                              style: kLabelTextStyle.copyWith(
                                                fontSize: 12.0,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            trainingWeek(day: seven),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 220,
                          padding: EdgeInsets.all(4),
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            color: Color(0xFF1D1D1D),
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Training Progress",
                                style: kLabelTextStyle.copyWith(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        "$completed",
                                        textAlign: TextAlign.right,
                                        style: kHeadingTextStyle,
                                      ),
                                      width: 100,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      child: Text(
                                        "Completed workouts",
                                        style: kLabelTextStyle,
                                      ),
                                      width: 200,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        "$hours",
                                        textAlign: TextAlign.right,
                                        style: kHeadingTextStyle,
                                      ),
                                      width: 100,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      child: Text(
                                        "Hours Trained",
                                        style: kLabelTextStyle,
                                      ),
                                      width: 200,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Material(
                          color: kAccentColor,
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          elevation: 5.0,
                          child: MaterialButton(
                            onPressed: () {
                              _auth.signOut();
                              Navigator.pushNamed(context, LoginScreen.id);
                            },
                            minWidth: double.infinity,
                            height: 54.0,
                            child: Text(
                              'SIGN OUT',
                              style: kLabelTextStyle.copyWith(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget trainingWeek({bool day}) {
    if (day == true) {
      return Icon(
        LineIcons.fist_raised_solid,
        size: 32,
      );
    } else {
      return Icon(
        Boxicons.bxBatteryLow,
        size: 32,
      );
    }
  }
//  Widget adminWidget() {
//    if (admin) {
//      return Text('You are an admin');
//    }
//  }
}
