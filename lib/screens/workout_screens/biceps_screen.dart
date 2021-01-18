import 'package:dragonfistfitness/screens/workout_screens/workout_classes/BicepsWorkout.dart';
import 'package:flutter/material.dart';
import 'package:dragonfistfitness/constants.dart';
import 'package:boxicons_flutter/boxicons_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'timer_screen.dart';
import 'workout_classes/BicepsWorkout.dart';
import 'workout_classes/Workout.dart';
import '../../components/arguments.dart';
import 'package:dragonfistfitness/components/Exercise.dart';

class BicepsScreen extends StatefulWidget {
  static const String id = 'biceps_screen';
  final Workout workout = BicepsWorkout();

  @override
  _BicepsScreenState createState() => _BicepsScreenState();
}

class _BicepsScreenState extends State<BicepsScreen> {
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
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 28, vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'BICEPS',
                  style: kHeadingTextStyle,
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        LineIcons.clock,
                        color: Color(0xDEFFFFFF),
                        size: 40,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "60 min",
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Boxicons.bxDumbbell,
                        color: Color(0xDEFFFFFF),
                        size: 40,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Dumbbells, Bands",
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Material(
                  color: kAccentColor,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        TimerScreen.id,
                        arguments: Arguments(widget.workout, 0),
                      );
                    },
                    height: 80,
                    child: Text(
                      'START',
                      style: kHeadingTextStyle.copyWith(color: kTextColor),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Divider(
                  height: 2,
                  color: Color(0xDEFFFFFF),
                ),
                SizedBox(
                  height: 16,
                ),
                Text("Exercises",
                    style: kLabelTextStyle.copyWith(fontSize: 20)),
                SizedBox(
                  height: 16,
                ),
                Exercise(exerciseName: "DB Curl"),
                SizedBox(
                  height: 12,
                ),
                Exercise(exerciseName: "Band Hammer Curl"),
                SizedBox(
                  height: 12,
                ),
                Exercise(exerciseName: "DB Preacher Curl"),
                SizedBox(
                  height: 12,
                ),
                Exercise(exerciseName: "Dynamic Swing Curl"),
                SizedBox(
                  height: 12,
                ),
                Exercise(exerciseName: "Band Curl Hold"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
