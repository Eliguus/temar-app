import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  final Function()? pressed;
  const RegisterButton({super.key, required this.pressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: pressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            const Color.fromRGBO(56, 188, 69, 1),
          ),
          minimumSize: MaterialStateProperty.all(Size(200, 50))),
      child: const Text('REGISTER'),
    );
  }
}
