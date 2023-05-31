import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            const Color.fromRGBO(56, 188, 69, 1),
          ),
          minimumSize: MaterialStateProperty.all(Size(200, 50))),
      child: const Text('REGISTER'),
    );
  }
}
