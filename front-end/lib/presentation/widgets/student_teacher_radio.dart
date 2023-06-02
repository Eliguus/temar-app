import 'package:flutter/material.dart';

class StudentInstructorRadio extends StatefulWidget {
  const StudentInstructorRadio({super.key});

  @override
  State<StudentInstructorRadio> createState() => StudentInstructorRadioState();
}

class StudentInstructorRadioState extends State<StudentInstructorRadio> {
  bool _isInstructor = false;
  bool _isStudent = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RadioListTile(
          title: const Text('Instructor'),
          value: true,
          groupValue: _isInstructor,
          onChanged: (value) {
            setState(() {
              _isInstructor = value!;
              _isStudent = !value;
            });
          },
        ),
        RadioListTile(
          title: const Text('Student'),
          value: true,
          groupValue: _isStudent,
          onChanged: (value) {
            setState(() {
              _isInstructor = value!;
              _isStudent = !value;
            });
          },
        ),
      ],
    );
  }
}
