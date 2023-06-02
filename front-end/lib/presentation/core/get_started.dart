import 'package:flutter/material.dart';
import 'package:flutter_application_test/presentation/auth/signup.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

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
                SvgPicture.asset(
                  'assets/images/welcome_svg.svg',
                  semanticsLabel: 'Welcome SVG Image',
                ),
                const Text(
                  'CHECK YOUR RESULTS HERE',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ],
            ),
            SizedBox(
              width: 100,
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignupPage()));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color.fromRGBO(56, 188, 69, 1),
                ),
                minimumSize: MaterialStateProperty.all(Size(200, 50)),
              ),
              child: const Text('GET STARTED'),
            )
          ],
        ),
      ),
    );
  }
}
