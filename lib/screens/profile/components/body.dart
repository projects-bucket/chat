import 'package:doctor_app/services/auth_service.dart';
import 'package:flutter/material.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "../../assets/icons/User.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "../../assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Health Details",
            icon: "../../assets/icons/Cardiologist.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "../../assets/icons/Question.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "../../assets/icons/Log out.svg",
            press: ()async {
              await AuthServices().signout();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
