import 'package:flutter/material.dart';

class LeaderboardScreen extends StatefulWidget {
  static const String id = 'leaderboards_screen';

  @override
  _LeaderboardScreenState createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text('Leaderboards Page'),
      ),
    );
  }
}
