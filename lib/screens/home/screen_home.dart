import 'package:db_hive_sample/db/function/db_functions.dart';
import 'package:db_hive_sample/screens/home/widget/add_students_widget.dart';
import 'package:db_hive_sample/screens/home/widget/list_students_widget.dart';
import 'package:flutter/material.dart';

class screenHome extends StatelessWidget {
  const screenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllStudents();

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          AddStudentWidget(),
          const Expanded(child: ListStudentWidget()),
        ],
      )),
    );
  }
}
