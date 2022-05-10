import 'package:doctor_app/constants.dart';
import 'package:doctor_app/firebase_options.dart';
import 'package:doctor_app/screens/homescreen.dart';
import 'package:doctor_app/screens/welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:doctor_app/services/auth_service.dart';
import 'package:doctor_app/utils/errorCallback.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:DefaultFirebaseConfig.platformOptions,);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Healthcare - Doctor Consultation App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(defaultPadding),
            backgroundColor: primaryColor,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: textFieldBorder,
          enabledBorder: textFieldBorder,
          focusedBorder: textFieldBorder,
        ),
      ),
      home: StreamBuilder<auth.User?>(
          stream: AuthServices().userChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
            return HomeScreen();
            } else {            
                
                return WelcomeScreen() ;
              }
            
          }),
    );
  }
}
