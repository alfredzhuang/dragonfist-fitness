import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:dragonfistfitness/screens/workouts_screen.dart';
import 'package:tuple/tuple.dart';

class Workout {
  List<Tuple2<String, int>> _exerciseList = [];

  void setList(List<Tuple2<String, int>> l) {
    _exerciseList = l;
  }

  int getLength() {
    return _exerciseList.length;
  }

  String getExercise(int i) {
    return _exerciseList[i].item1;
  }

  int getTime(int i) {
    return _exerciseList[i].item2;
  }

  bool isFinished(int i) {
    if (i >= _exerciseList.length - 1) {
      return true;
    }
    return false;
  }
}
