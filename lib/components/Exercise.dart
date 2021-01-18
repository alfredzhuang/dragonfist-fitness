import 'package:flutter/material.dart';
import 'package:dragonfistfitness/constants.dart';

class Exercise extends StatelessWidget {
  final String exerciseName;
  final String duration;

  Exercise({@required this.exerciseName, this.duration = "30 seconds"});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF1D1D1D),
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            exerciseName,
            style: kLabelTextStyle.copyWith(
              fontWeight: FontWeight.w900,
              color: kAccentColor,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            duration,
            style: kLabelTextStyle,
          ),
        ],
      ),
    );
  }
}
