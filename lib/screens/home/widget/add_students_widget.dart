import 'package:db_hive_sample/db/function/db_functions.dart';
import 'package:db_hive_sample/db/models/data_model.dart';
import 'package:flutter/material.dart';

class AddStudentWidget extends StatelessWidget {
  AddStudentWidget({Key? key}) : super(key: key);

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Name',
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _ageController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Age',
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
              onPressed: () {
                onAddStudentsButtonClicked();
              },
              icon: const Icon(Icons.add),
              label: const Text('add')),
        ],
      ),
    );
  }

  Future<void> onAddStudentsButtonClicked() async {
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();
    if (_name.isEmpty || _age.isEmpty) {
      return;
    }
    //  print('$_name $_age');

    final _student = StudentModel(name: _name, age: _age);

    addStudent(_student);
  }
}
