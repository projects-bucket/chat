import 'package:doctor_app/screens/auth/sign_up.dart';
import 'package:doctor_app/screens/homescreen.dart';
import 'package:doctor_app/screens/loading_dailog.dart';
import 'package:doctor_app/services/auth_service.dart';
import 'package:doctor_app/services/patients_services.dart';
import 'package:doctor_app/utils/errorCallback.dart';
import 'package:doctor_app/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:doctor_app/constants.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({
    Key? key,
    required this.formkey,
  }) : super(key: key);

  final GlobalKey<FormState> formkey;

  late String _username, _email, _phoneNum;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldName(text: 'Username'),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Username",
                  ),
                  validator: validateName,
                  //RequiredValidator(errorText: 'User Name is Required bro'),
                  onSaved: (username) => _username = username!,
                ),
                SizedBox(height: defaultPadding),
                TextFieldName(text: 'Email'),
                TextFormField(
                  validator: validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Yesh@chala.com",
                  ),
                  //validator: EmailValidator(errorText: "Enter a valid email bro"),
                  onSaved: (email) => _email = email!,
                ),
                SizedBox(height: defaultPadding),
                TextFieldName(text: 'Phone'),
                TextFormField(
                  validator: validateMobile,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "+1234567890",
                  ),
                  // validator:
                  // RequiredValidator(errorText: "Phone Number is Required bro"),
                  onSaved: (phone) => _phoneNum = phone!,
                ),
                SizedBox(height: defaultPadding),
                TextFieldName(text: 'Password'),
                TextFormField(
                  validator: validatePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "**********",
                  ),
                  // validator: passwordValidator,
                  onSaved: (password) => _password = password!,
                  //onChanged: (pass) => _password = pass,
                ),
                SizedBox(height: defaultPadding),
                TextFieldName(text: 'Confirm Password'),
                TextFormField(
                  // validator: (value) => validateConfirmPassword(
                  //     value, _password == null ? "" : _password),
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "**********",
                  ),
                  //validator: (pass) =>
                  //MatchValidator(errorText: "Passwords dont match")
                  //.validateMatch(pass!, _password)
                )
              ],
            )),
        SizedBox(height: defaultPadding * 2),
        StatefulBuilder(
            builder: (BuildContext context, StateSetter stateSetter) {
          bool _loading = false;
          return SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => GenDeetsScreen("123456634"),
                //     ));
                stateSetter(() {
                  _loading = true;
                });
                final form = formkey.currentState;
                if (form != null && form.validate()) {
                  form.save();
                  

                 
               Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GenDeetsScreen(_phoneNum,_email,_password!,_username),
                      ));
                }},
           
              child: Text("Continue"),
            ),
          );
        }),
      ],
    );
  }
}

class TextFieldName extends StatelessWidget {
  const TextFieldName({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 3),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
      ),
    );
  }
}

class GenDeets extends StatelessWidget {
  GenDeets({
    Key? key,
    required this.formkey,
    required this.phoneNum,
    required this.email,
    required this.password,
    required this.username,
  }) : super(key: key);

  final GlobalKey<FormState> formkey;
  final String phoneNum,username,password,email;
  late String _weight, _height, _allergies, _chronical, _mediacation;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldName(text: 'Height'),
            TextFormField(
              decoration: InputDecoration(
                hintText: "180cm",
              ),
              onSaved: (val) => _height = val!,
              validator: validateText,
            ),
            SizedBox(height: defaultPadding),
            TextFieldName(text: 'Weight'),
            TextFormField(
              onSaved: (val) => _weight = val!,
              validator: validateText,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "60kgs",
              ),
            ),
            SizedBox(height: defaultPadding),
            TextFieldName(text: 'Allergies'),
            TextFormField(
              onSaved: (val) => _allergies = val!,
              validator: validateText,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "Add your allergies",
              ),
            ),
            SizedBox(height: defaultPadding),
            TextFieldName(text: 'On Medication'),
            TextFormField(
              onSaved: (val) => _mediacation = val!,
              validator: validateText,
              decoration: InputDecoration(
                hintText: "Yes or No",
              ),
            ),
            SizedBox(height: defaultPadding),
            TextFieldName(text: 'Any chronic Illnesses'),
            TextFormField(
              onSaved: (val) => _chronical = val!,
              validator: validateText,
              
              decoration: InputDecoration(
                hintText: "Add illness",
              ),
            ),
            SizedBox(height: defaultPadding * 2),
            SizedBox(
              width: double.infinity,
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter stateSetter) {
                bool _loading = false;
                return ElevatedButton(
                  onPressed: () {
                    final form = formkey.currentState;
                    if (form != null && form.validate()) {
                      form.save();
                      showLoaderDialog(context);
                      AuthServices()
                          .signUpWithEmailAndPassword(email,username,password,_height, _weight, _mediacation,
                              _chronical, _allergies, phoneNum,(e) => toastMesssage(e))
                          .then((value) => {
                            print(value),
                            Navigator.pop(context),
                                  if(value)
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomeScreen(),
                                        )),
                                    
                                    
                                  
                              }
                              );
                    }
                  },
                  child: _loading
                      ? 
                         CircularProgressIndicator(
                            color: Colors.white,
                            
                          )
                      
                      : Text("Create Account"),
                );
              }),
            ),
          ],
        ));
  }
}
