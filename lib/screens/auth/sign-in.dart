import 'package:doctor_app/constants.dart';
import 'package:doctor_app/screens/auth/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/sign-in-form.dart';

class SignInScreeen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/icons/Sign_Up_bg.svg",
              fit: BoxFit.fill,),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Log In",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text("Create New Account"),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpScreeen()));
                              },
                              child: Text(
                                "Sign up",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        SignInForm(
                          formkey: _formKey,
                        ),
                       
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
