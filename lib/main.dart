import 'package:dragonfistfitness/screens/forgotpassword_screen.dart';
import 'package:dragonfistfitness/screens/home_screen.dart';
import 'package:dragonfistfitness/screens/leaderboards_screen.dart';
import 'package:dragonfistfitness/screens/login_screen.dart';
import 'package:dragonfistfitness/screens/profile_screen.dart';
import 'package:dragonfistfitness/screens/registration_screen.dart';
import 'package:dragonfistfitness/screens/welcome_screen.dart';
import 'package:dragonfistfitness/screens/workout_screens/abs_screen.dart';
import 'package:dragonfistfitness/screens/workout_screens/back_screen.dart';
import 'package:dragonfistfitness/screens/workout_screens/biceps_screen.dart';
import 'package:dragonfistfitness/screens/workout_screens/chest_screen.dart';
import 'package:dragonfistfitness/screens/workout_screens/completed%20workout.dart';
import 'package:dragonfistfitness/screens/workout_screens/legs_screen.dart';
import 'package:dragonfistfitness/screens/workout_screens/rest.dart';
import 'package:dragonfistfitness/screens/workout_screens/shoulders_screen.dart';
import 'package:dragonfistfitness/screens/workout_screens/timer_screen.dart';
import 'package:dragonfistfitness/screens/workout_screens/triceps_screen.dart';
import 'package:dragonfistfitness/screens/workouts_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<bool> isLoggedIn() async {
    try {
      final FirebaseUser user = await _auth.currentUser();
      return user != null;
    } catch (e) {
      return false;
    }
  }

  final bool loggedIn = await isLoggedIn();
  final MyApp myApp =
      MyApp(initialRoute: loggedIn ? HomeScreen.id : LoginScreen.id);
  runApp(myApp);
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  MyApp({this.initialRoute});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: initialRoute,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
        LeaderboardScreen.id: (context) => LeaderboardScreen(),
        WorkoutScreen.id: (context) => WorkoutScreen(),
        ForgotPasswordScreen.id: (context) => ForgotPasswordScreen(),
        AbsScreen.id: (context) => AbsScreen(),
        BackScreen.id: (context) => BackScreen(),
        BicepsScreen.id: (context) => BicepsScreen(),
        ChestScreen.id: (context) => ChestScreen(),
        LegsScreen.id: (context) => LegsScreen(),
        ShouldersScreen.id: (context) => ShouldersScreen(),
        TricepsScreen.id: (context) => TricepsScreen(),
        TimerScreen.id: (context) => TimerScreen(),
        RestScreen.id: (context) => RestScreen(),
        CompletedWorkout.id: (context) => CompletedWorkout(),
      },
    );
  }
}
