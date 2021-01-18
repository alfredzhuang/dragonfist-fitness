import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:dragonfistfitness/constants.dart';
import 'package:dragonfistfitness/screens/home_screen.dart';
import 'package:dragonfistfitness/screens/profile_screen.dart';
import 'package:dragonfistfitness/screens/workout_screens/completed%20workout.dart';
import 'package:dragonfistfitness/screens/workout_screens/rest.dart';
import 'package:dragonfistfitness/screens/workouts_screen.dart';
import 'package:flutter/material.dart';
import 'package:dragonfistfitness/constants.dart';
import 'workout_classes/Workout.dart';
import 'dart:async';
import '../../components/arguments.dart';

class TimerScreen extends StatefulWidget {
  static const String id = 'timer_screen';
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  @override
  Widget build(BuildContext context) {
    final Arguments args = ModalRoute.of(context).settings.arguments;
    final counter = args.counter;
    final workout = args.workout;

    String currWorkout = args.workout.getExercise(counter).toUpperCase();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          shadowColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, HomeScreen.id);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 24,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: kPrimaryColor,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.fromLTRB(48, 12, 48, 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        currWorkout,
                        textAlign: TextAlign.center,
                        style: kHeadingTextStyle,
                      ),
                    ),
                  ),
                ),
                CircularCountDownTimer(
                  duration: workout.getTime(counter),
                  width: 360,
                  height: 360,
                  color: Colors.white,
                  fillColor: kAccentColor,
                  strokeWidth: 5.0,
                  textStyle: TextStyle(
                    fontSize: 40.0,
                    color: Color(0xDEFFFFFF),
                    fontWeight: FontWeight.bold,
                  ),
                  isReverse: false,
                  isTimerTextShown: true,
                  onComplete: () {
                    // Here, do whatever you want
                    if (workout.isFinished((counter + 1))) {
                      Navigator.pushNamed(context, CompletedWorkout.id);
                    } else {
                      Navigator.pushNamed(
                        context,
                        RestScreen.id,
                        arguments: Arguments(workout, (counter + 1)),
                      );
                    }
                  },
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        'NEXT: REST',
                        textAlign: TextAlign.center,
                        style: kHeadingTextStyle.copyWith(
                          color: Color(0xDE818181),
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
