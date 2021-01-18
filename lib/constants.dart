import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kLabelTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 16.0,
  color: Color(0xDEF9F9F9),
);

const kHeadingTextStyle = TextStyle(
  fontFamily: 'BebasNeue',
  fontSize: 48,
  color: kAccentColor,
);

const kAccentColor = Color(0xDEFF7043);
const kPrimaryColor = Color(0xFF121212);
const kTextColor = Color(0xDEF9F9F9);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: kLabelTextStyle,
  contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
  filled: true,
  fillColor: Color(0xFF383838),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.transparent,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.transparent,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
);
