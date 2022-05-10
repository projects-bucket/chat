

import 'package:doctor_app/constants.dart';
import 'package:doctor_app/screens/auth/sign-in.dart';
import 'package:doctor_app/screens/auth/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/icons/splash_bg.svg",fit: BoxFit.fill,),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                children: [
                  Spacer(),
                  Text(
                    'CHUB',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreeen(),
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFF6CDBD1),
                      ),
                      child: Text("Create New Account"),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignInScreeen(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Color(0xFF6CDBD1),
                            ),
                          ),
                        ),
                        child: Text("Sign In to your account"),
                      ),
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
