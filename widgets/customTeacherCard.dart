import 'package:flutter/material.dart';
import 'package:my_favorite_lists/domain/Teacher.dart';
import 'package:my_favorite_lists/services/person.dart';

class CustomTeacherCard extends StatefulWidget {
  const CustomTeacherCard({super.key});

  @override
  CustomTeacherCardState createState() => CustomTeacherCardState();
}

class CustomTeacherCardState extends State<CustomTeacherCard> {
  late Future<List<Teacher>> teachers;
  List<Teacher>? _teacherList;

  @override
  void initState() {
    super.initState();
    teachers = loadTeacherData();
    teachers.then((data) {
      setState(() {
        _teacherList = data.where((teacher) {
          try {
            return teacher.firstname != null || teacher.lastname != null;
          } catch (e) {
            return false;
          }
        }).toSet().toList();
        _teacherList = _teacherList!.toSet().toList();
      });
    });
  }

  void sortByName() {
    setState(() {
      _teacherList?.sort((a, b) => a.lastname!.compareTo(b.lastname!));
    });
  }

  void sortBySubjectsLength() {
    setState(() {
      _teacherList?.sort((a, b) => (a.subjects?.length ?? 0).compareTo(b.subjects?.length ?? 0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Teacher>>(
          future: teachers,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              final teachers = _teacherList ?? snapshot.data!;
              return buildTeachers(teachers);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              return const Text("No data available!");
            }
          },
        ),
      ),
    );
  }

  Widget buildTeachers(List<Teacher> teachers) {
    return ListView.builder(
        itemCount: teachers.length,
        itemBuilder: (context, index) {
          final teacher = teachers[index];
          return GestureDetector(
            child: Container(
              color: Colors.grey.shade300,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              height: 100,
              width: double.maxFinite,
              child: Row(
                children: [
                  Expanded(flex: 1, child: Image.network(teacher.image_url!)),
                  const SizedBox(width: 10),
                  Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '${teacher.firstname!} ${teacher.lastname!}',
                                  style: const TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.search,
                                    color: Color(0xFF3b3b3b)),
                                onPressed: () {
                                  final snackBar = SnackBar(
                                    content:  Text(
                                      '${teacher.subjects!}',
                                      style: const TextStyle(
                                          fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Mail: ${teacher.mail!}',
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                  ),
                ],
              ),
            ),
          );
        });
  }
}