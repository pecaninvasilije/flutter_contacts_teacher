import 'dart:convert';
import 'package:flutter/services.dart';

import '../domain/Teacher.dart';

Future<List<Teacher>> loadTeacherData() async {
  String jsonString = await rootBundle.loadString('assets/data/teachers.json');
  List<dynamic> jsonResponse = json.decode(jsonString);
  return jsonResponse.map((driver) => Teacher.fromJson(driver)).toList();
}