import 'package:doctor_app/screens/auth/components/sign-in-form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'profile/components/profile_menu.dart';

class treatadd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Treatment Edits'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Text(
              'Add treatment details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color.fromARGB(153, 241, 240, 240),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    TextFieldName(text: 'time'),
                    TextFormField(
                      decoration: InputDecoration(),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFieldName(text: 'Medcines'),
                    TextFormField(),
                    SizedBox(
                      height: 5,
                    ),
                    TextFieldName(text: 'Remarks'),
                    TextFormField(),
                    SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('add'),
                    ),
                  ],
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
            )
          ],
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
