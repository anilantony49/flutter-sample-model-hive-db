import 'package:db_hive_sample/db/models/data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

ValueNotifier<List<StudentModel>> StudentListnotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel value) async {
  final studentDB = await Hive.openBox<StudentModel>('student _db');
  final _id = await studentDB.add(value);
  value.id = _id;
  StudentListnotifier.value.add(value);
  StudentListnotifier.notifyListeners();
}

Future<void> getAllStudents() async {
  final studentDB = await Hive.openBox<StudentModel>('student _db');
  StudentListnotifier.value.clear();
  StudentListnotifier.value.addAll(studentDB.values);
  StudentListnotifier.notifyListeners();
}

Future<void> deleteStudent(int id) async {
  final studentDB = await Hive.openBox<StudentModel>('student _db');
  await studentDB.delete(id);

  getAllStudents();
}
