import 'package:flutter/material.dart';

class StudentInstructorRadio extends StatefulWidget {
  final void Function(bool?) onChanged;

  const StudentInstructorRadio({Key? key, required this.onChanged})
      : super(key: key);

  @override
  _StudentInstructorRadioState createState() => _StudentInstructorRadioState();
}

class _StudentInstructorRadioState extends State<StudentInstructorRadio> {
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
            widget.onChanged(_isInstructor);
          },
        ),
        RadioListTile(
          title: const Text('Student'),
          value: true,
          groupValue: _isStudent,
          onChanged: (value) {
            setState(() {
              _isInstructor = !value!;
              _isStudent = value;
            });
            widget.onChanged(!_isInstructor);
          },
        ),
      ],
    );
  }
}
