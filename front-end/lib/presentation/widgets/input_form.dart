import 'package:flutter/material.dart';

class InputForm extends StatefulWidget {
  final String inputboxplaceholder;
  final String type;
  const InputForm(
      {Key? key, required this.inputboxplaceholder, required this.type})
      : super(key: key);

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final _textInputController = TextEditingController();
  final _passwordInputController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  String? _validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please fill in the detail';
    }

    if (widget.type == 'email') {
      final emailRegExp = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
      if (!emailRegExp.hasMatch(value)) {
        return 'Please enter a valid email';
      }
    } else if (widget.type == 'name') {
      final nameRegExp = RegExp(r'^[a-zA-Z ]+$');
      if (!nameRegExp.hasMatch(value)) {
        return 'Please enter a valid name';
      }
    } else if (widget.type == 'phone') {
      final phoneRegExp = RegExp(r'^\d{10}$');
      if (!phoneRegExp.hasMatch(value)) {
        return 'Please enter a valid phone number';
      }
    } else if (widget.type == 'confirm') {
      if (value != _passwordInputController.text) {
        return 'Password does not match';
      }
    } else if (widget.type == 'password') {
      if (value.length < 8) {
        return 'Password must be at least 8 characters long';
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Container(
        constraints: BoxConstraints(maxWidth: 400),
        child: TextFormField(
          controller: _textInputController,
          decoration: InputDecoration(
            labelText: widget.inputboxplaceholder,
          ),
          validator: _validate,
          onSaved: (newValue) {},
        ),
      ),
    );
  }
}
