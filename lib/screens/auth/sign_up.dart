import 'package:doctor_app/constants.dart';
import 'package:doctor_app/screens/auth/sign-in.dart';
import 'package:doctor_app/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'components/signup-form.dart';

class SignUpScreeen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/icons/Sign_Up_bg.svg",
              height: MediaQuery.of(context).size.height,fit: BoxFit.fill,),
          Center(
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "General Details",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text("I already have an account"),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignInScreeen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SignUpForm(
                              formkey: _formKey,
                            ),
                          ),
                         
                        ],
                      ),
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

class GenDeetsScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  GenDeetsScreen(this.phoneNumber,this._email,this._password,this._username);
  String phoneNumber;
  String _email;
  String _password;
  String _username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/icons/Sign_Up_bg.svg",
              height: MediaQuery.of(context).size.height,fit: BoxFit.fill,),
          Center(
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
                          "Health Details",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GenDeets(phoneNum: phoneNumber,
                          email: _email,password: _password,username: _username,


                            formkey: _formKey,
                          ),
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
