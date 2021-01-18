import 'package:dragonfistfitness/screens/workout_screens/abs_screen.dart';
import 'package:dragonfistfitness/screens/workout_screens/back_screen.dart';
import 'package:dragonfistfitness/screens/workout_screens/biceps_screen.dart';
import 'package:dragonfistfitness/screens/workout_screens/chest_screen.dart';
import 'package:dragonfistfitness/screens/workout_screens/legs_screen.dart';
import 'package:dragonfistfitness/screens/workout_screens/shoulders_screen.dart';
import 'package:dragonfistfitness/screens/workout_screens/timer_screen.dart';
import 'package:dragonfistfitness/screens/workout_screens/triceps_screen.dart';
import 'package:flutter/material.dart';
import 'package:dragonfistfitness/constants.dart';
import 'package:boxicons_flutter/boxicons_flutter.dart';
import 'package:line_icons/line_icons.dart';

class WorkoutScreen extends StatefulWidget {
  static const String id = 'workouts_screen';

  @override
  _WorkoutScreenState createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      // body: FutureBuilder(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'SELECT YOUR',
                  style: kLabelTextStyle.copyWith(fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 4,
                ),
                Text('TRAINING SESSION', style: kHeadingTextStyle),
                SizedBox(height: 12),
                Material(
                  color: Color(0xFF1D1D1D),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, BackScreen.id);
                    },
                    minWidth: double.infinity,
                    height: 80.0,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Back',
                            style: kLabelTextStyle.copyWith(
                              fontWeight: FontWeight.w900,
                              fontSize: 22,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Icon(
                            LineIcons.dragon_solid,
                            color: Color(0xDEFFFFFF),
                            size: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Material(
                  color: Color(0xFF1D1D1D),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, TricepsScreen.id);
                    },
                    minWidth: double.infinity,
                    height: 80.0,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Triceps',
                            style: kLabelTextStyle.copyWith(
                              fontWeight: FontWeight.w900,
                              fontSize: 22,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Icon(
                            LineIcons.dragon_solid,
                            color: Color(0xDEFFFFFF),
                            size: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Material(
                  color: Color(0xFF1D1D1D),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LegsScreen.id);
                    },
                    minWidth: double.infinity,
                    height: 80.0,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Legs',
                            style: kLabelTextStyle.copyWith(
                              fontWeight: FontWeight.w900,
                              fontSize: 22,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Icon(
                            LineIcons.dragon_solid,
                            color: Color(0xDEFFFFFF),
                            size: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Material(
                  color: Color(0xFF1D1D1D),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, BicepsScreen.id);
                    },
                    minWidth: double.infinity,
                    height: 80.0,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Biceps',
                            style: kLabelTextStyle.copyWith(
                              fontWeight: FontWeight.w900,
                              fontSize: 22,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Icon(
                            LineIcons.dragon_solid,
                            color: Color(0xDEFFFFFF),
                            size: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Material(
                  color: Color(0xFF1D1D1D),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ChestScreen.id);
                    },
                    minWidth: double.infinity,
                    height: 80.0,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Chest',
                            style: kLabelTextStyle.copyWith(
                              fontWeight: FontWeight.w900,
                              fontSize: 22,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Icon(
                            LineIcons.dragon_solid,
                            color: Color(0xDEFFFFFF),
                            size: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Material(
                  color: Color(0xFF1D1D1D),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ShouldersScreen.id);
                    },
                    minWidth: double.infinity,
                    height: 80.0,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Shoulders',
                            style: kLabelTextStyle.copyWith(
                              fontWeight: FontWeight.w900,
                              fontSize: 22,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Icon(
                            LineIcons.dragon_solid,
                            color: Color(0xDEFFFFFF),
                            size: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Material(
                  color: Color(0xFF1D1D1D),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AbsScreen.id);
                    },
                    minWidth: double.infinity,
                    height: 80.0,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Abs',
                            style: kLabelTextStyle.copyWith(
                              fontWeight: FontWeight.w900,
                              fontSize: 22,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Icon(
                            LineIcons.dragon_solid,
                            color: Color(0xDEFFFFFF),
                            size: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
