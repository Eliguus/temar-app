import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test/presentation/auth/login.dart';
import 'package:flutter_application_test/presentation/widgets/button.dart';
import 'package:flutter_application_test/presentation/widgets/input_form.dart';
import 'package:flutter_application_test/presentation/widgets/student_teacher_radio.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(204, 204, 204, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'WELCOME',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                ),
                const InputForm(
                    inputboxplaceholder: 'Enter your name', type: 'name'),
                const InputForm(
                    inputboxplaceholder: 'Enter your email', type: 'email'),
                const InputForm(
                    inputboxplaceholder: 'Enter your password',
                    type: 'password'),
                const InputForm(
                    inputboxplaceholder: 'Confirm your password',
                    type: 'confirm'),
                // const StudentInstructorRadio(),
              ],
            ),
            SizedBox(
              height: 200,
            ),
            RegisterButton(),
            SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                text: 'Already have an account? ',
                style: const TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Sign In',
                      style: const TextStyle(
                        color: Color.fromRGBO(36, 144, 46, 1),
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => LoginPage())));
                        })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
