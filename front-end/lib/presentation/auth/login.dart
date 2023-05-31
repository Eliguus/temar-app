import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test/presentation/auth/signup.dart';
import 'package:flutter_application_test/presentation/widgets/button.dart';
import 'package:flutter_application_test/presentation/widgets/input_form.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(204, 204, 204, 1),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'WELCOME BACK',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            SvgPicture.asset(
              'assets/images/welcome_svg.svg',
              semanticsLabel: 'Welcome SVG Image',
            ),
            const InputForm(
                inputboxplaceholder: 'Enter your name', type: 'name'),
            const InputForm(
                inputboxplaceholder: 'Enter your password', type: 'password'),
            TextButton(onPressed: () {}, child: const Text('Forgot Password?')),
            const RegisterButton(),
            RichText(
              text: TextSpan(
                text: "Don't have an account?",
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
                                  builder: ((context) => SignupPage())));
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
