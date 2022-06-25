import 'package:db_hive_sample/db/function/db_functions.dart';
import 'package:db_hive_sample/db/models/data_model.dart';
import 'package:flutter/material.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: StudentListnotifier,
      builder:
          (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
        return ListView.separated(
          itemBuilder: (ctx, index) {
            final data = studentList[index];

            return ListTile(
              title: Text(data.name),
              subtitle: Text(data.age),
              trailing: IconButton(
                  onPressed: () {
                    if (data.id != null) {
                      deleteStudent(data.id!);
                    } else {
                      print('student id is null');
                    }
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: studentList.length,
        );
      },
    );
  }
}
