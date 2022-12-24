import 'package:flutter/material.dart';

class personalInfoData {
  String univ;
  String major;
  double gpa;
  int? age;
  String? gender;

  personalInfoData({required this.univ, required this.major, required this.gpa, this.age, this.gender});
}