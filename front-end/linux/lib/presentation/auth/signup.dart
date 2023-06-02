import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/auth/bloc/signup_bloc.dart';
import '../../application/auth/bloc/signup_event.dart';
import '../../application/auth/bloc/signup_state.dart';
import '../widgets/input_form.dart';
import '../widgets/register_button.dart';
import '../widgets/student_teacher_radio.dart';
import 'login.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool? _isInstructor;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => SignupBloc(),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(204, 204, 204, 1),
        body: BlocConsumer<SignupBloc, SignupState>(
          listener: (context, state) {
            if (state is SignupSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Signup Successful'),
                  duration: Duration(seconds: 2),
                ),
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            } else if (state is SignupFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
          builder: (context, state) {
            bool isLoading = state is SignupLoadingState;
            return SingleChildScrollView(
              child: Container(
                height: screenHeight,
                width: screenWidth,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'WELCOME',
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          InputForm(
                            inputboxplaceholder: 'Enter your name',
                            type: 'name',
                            controller: _nameController,
                          ),
                          InputForm(
                            inputboxplaceholder: 'Enter your email',
                            type: 'email',
                            controller: _emailController,
                          ),
                          InputForm(
                            inputboxplaceholder: 'Enter your password',
                            type: 'password',
                            controller: _passwordController,
                          ),
                          InputForm(
                            inputboxplaceholder: 'Confirm your password',
                            type: 'confirm',
                            controller: _confirmPasswordController,
                          ),
                          StudentInstructorRadio(
                            onChanged: (value) {
                              _isInstructor = value;
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 200,
                      ),
                      isLoading
                          ? CircularProgressIndicator()
                          : RegisterButton(
                              pressed: () => _onSignupButtonPressed(context),
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Already have an account?",
                          style: const TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1)),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Log In',
                                style: const TextStyle(
                                  color: Color.fromRGBO(36, 144, 46, 1),
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()));
                                  })
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

  bool _validateInput(context) {
    // Check if email is valid.
    if (!_emailController.text.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email')),
      );
      return false;
    }

    // Check if password length is greater than or equal to 6.
    if (_passwordController.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Password should be at least 6 characters')),
      );
      return false;
    }

    // Check if password and confirm password match.
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return false;
    }

    return true;
  }

  void _onSignupButtonPressed(BuildContext context) {
    if (_validateInput(context)) {
      BlocProvider.of<SignupBloc>(context).add(
        SignupButtonPressedEvent(
          name: _nameController.text,
          email: _emailController.text,
          password: _passwordController.text,
          isInstructor: _isInstructor ?? false,
        ),
      );
    }
  }
}
