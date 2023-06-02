import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../application/auth/bloc/login_bloc.dart';
import '../../application/auth/bloc/login_event.dart';
import '../../application/auth/bloc/login_state.dart';
import '../widgets/button.dart';
import '../widgets/input_form.dart';
import 'signup.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(204, 204, 204, 1),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LoginFailedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Failed'),
                ),
              );
            } else if (state is LoginSuccessfulState) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/home',
                (route) => false,
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                height: screenHeight,
                width: screenWidth,
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'WELCOME BACK',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SvgPicture.asset(
                        'assets/images/welcome_svg.svg',
                        semanticsLabel: 'Welcome SVG Image',
                      ),
                      InputForm(
                        inputboxplaceholder: 'Enter your email',
                        type: 'email',
                        controller: emailController,
                      ),
                      InputForm(
                        inputboxplaceholder: 'Enter your password',
                        type: 'password',
                        controller: passwordController,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Forgot Password?'),
                      ),
                      state is LoggingInState
                          ? const CircularProgressIndicator()
                          : LoginButton(
                              pressed: () {
                                context.read<AuthBloc>().add(
                                      LoginEvent(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      ),
                                    );
                              },
                            ),
                      RichText(
                        text: TextSpan(
                          text: "Don't have an account?",
                          style: const TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Sign up',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignupPage(),
                                    ),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
