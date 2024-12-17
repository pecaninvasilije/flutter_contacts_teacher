import 'package:flutter/material.dart';
import 'package:my_favorite_lists/widgets/customTeacherCard.dart';
import 'package:my_favorite_lists/widgets/customTopBar.dart';

class Home extends StatelessWidget {
  final GlobalKey<CustomTeacherCardState> _teacherCardKey = GlobalKey<CustomTeacherCardState>();
  Home({super.key});

  void _sortByName() {
    _teacherCardKey.currentState?.sortByName();
  }

  void _sortBySubjectsLength() {
    _teacherCardKey.currentState?.sortBySubjectsLength();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 59, 59, 59),
      appBar: CustomTopBar(
        onSortByName: _sortByName,
        onSortBySubjectsLength: _sortBySubjectsLength,
      ),
      body: CustomTeacherCard(key: _teacherCardKey),
    );
  }
}