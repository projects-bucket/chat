import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'profile/components/profile_menu.dart';
import 'treat-add.dart';

class treatedit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Treatment Edits'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SingleChildScrollView(
          
          child: Column(
            children: [
              Text(
                'Click on day to edit',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ProfileMenux(
                text: "Monday",
                icon: "../../assets/icons/.svg",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => treatadd(),
                    ),
                  );
                },
              ),
              ProfileMenux(
                text: "Tuesday",
                icon: "../../assets/icons/.svg",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => treatadd(),
                    ),
                  );
                },
              ),
              ProfileMenux(
                text: "Wednesday",
                icon: "../../assets/icons/.svg",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => treatadd(),
                    ),
                  );
                },
              ),
              ProfileMenux(
                text: "Thursday",
                icon: "../../assets/icons/Log .svg",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => treatadd(),
                    ),
                  );
                },
              ),
              ProfileMenux(
                text: "Friday",
                icon: "../../assets/icons/Log .svg",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => treatadd(),
                    ),
                  );
                },
              ),
              ProfileMenux(
                text: "Saturday",
                icon: "../../assets/icons/Log .svg",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => treatadd(),
                    ),
                  );
                },
              ),
              ProfileMenux(
                text: "Sunday",
                icon: "../../assets/icons/Log .svg",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => treatadd(),
                    ),
                  );
                },
              ),
              ProfileMenux(
                text: "Custom",
                icon: "../../assets/icons/Log .svg",
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenux extends StatelessWidget {
  const ProfileMenux({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          elevation: 10,
          primary: Color(0xFF255ED6),
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: Color(0xFF255ED6),
              width: 22,
            ),
            SizedBox(width: 20),
            Expanded(child: Text(text)),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
