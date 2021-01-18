import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:dragonfistfitness/constants.dart';
import 'package:dragonfistfitness/screens/workout_screens/timer_screen.dart';
import 'package:dragonfistfitness/screens/workouts_screen.dart';
import 'package:flutter/material.dart';
import 'package:dragonfistfitness/constants.dart';
import 'workout_classes/Workout.dart';
import 'dart:async';
import '../../components/arguments.dart';

class RestScreen extends StatefulWidget {
  static const String id = 'rest_screen';
  @override
  _RestScreenState createState() => _RestScreenState();
}

class _RestScreenState extends State<RestScreen> {
  @override
  Widget build(BuildContext context) {
    final Arguments args = ModalRoute.of(context).settings.arguments;
    final Workout workout = args.workout;
    final int counter = args.counter;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          shadowColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, WorkoutScreen.id);
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
                        'REST',
                        textAlign: TextAlign.center,
                        style: kHeadingTextStyle,
                      ),
                    ),
                  ),
                ),
                CircularCountDownTimer(
                  duration: workout.getTime(counter),
                  width: 400,
                  height: 400,
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
                    Navigator.pushNamed(
                      context,
                      TimerScreen.id,
                      arguments: Arguments(workout, (counter + 1)),
                    );
                  },
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        'NEXT: ' +
                            workout.getExercise(counter + 1).toUpperCase(),
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
