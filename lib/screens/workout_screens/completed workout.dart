import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dragonfistfitness/constants.dart';
import 'package:dragonfistfitness/screens/home_screen.dart';
import 'package:dragonfistfitness/screens/registration_screen.dart';
import 'package:dragonfistfitness/screens/workouts_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dragonfistfitness/constants.dart';
import 'package:intl/intl.dart';

class CompletedWorkout extends StatefulWidget {
  static const String id = 'completed_screen';
  @override
  _CompletedWorkoutState createState() => _CompletedWorkoutState();
}

class _CompletedWorkoutState extends State<CompletedWorkout> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  final _firestore = Firestore.instance;
  int completed = 0, hours = 0;
  var day = DateFormat('EEEE').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        final uid = loggedInUser.uid;
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
            completed++;
            hours++;
          });
        });
        _firestore
            .collection("userData")
            .document(uid)
            .collection("trainingProgress")
            .document(uid)
            .setData({'completed': completed, 'hours': hours});
        _firestore
            .collection("userData")
            .document(uid)
            .collection("trainingWeek")
            .document(uid)
            .setData({
          day: true,
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100,
                child: Center(
                  child: Text(
                    'WORKOUT COMPLETE',
                    textAlign: TextAlign.center,
                    style: kHeadingTextStyle,
                  ),
                ),
              ),
              Container(
                child: Image(
                  image: AssetImage('images/logo.png'),
                ),
              ),
              Container(
                height: 100,
                child: Center(
                  child: Material(
                    elevation: 5.0,
                    color: Color(0xFFFF7043),
                    borderRadius: BorderRadius.circular(16),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, HomeScreen.id);
                      },
                      height: 60,
                      minWidth: double.infinity,
                      child: Text(
                        'Continue',
                        style: kLabelTextStyle.copyWith(fontSize: 24),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
