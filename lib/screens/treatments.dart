import 'package:flutter/material.dart';

import '../constants.dart';
import 'profile/components/profile_menu.dart';
import 'treat_edit.dart';

class Treatments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => treatedit(),
                  ),
                );
              },
              icon: Icon(Icons.edit))
        ],
        title: Text('Your Treatments'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Monday',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            treatcard("Ibuprofen", "10 AM", "2 doses before food", kBlueColor),
            SizedBox(
              height: 20,
            ),
            treatcard("Aspirin", "11 AM", "1 doese after food", kBlueColor),
            SizedBox(
              height: 20,
            ),
            treatcard("Rinse and Wash ", "12 AM", "For 10 minutes", kBlueColor),
            SizedBox(
              height: 20,
            ),
            treatcard(
                "Lean Excersises", "4 PM", "Stretch legs today", kBlueColor),
            SizedBox(
              height: 20,
            ),
            treatcard("Good Sleep", "8 PM", "A 10 hour sleep", kBlueColor),
          ],
        ),
      ),
    );
  }
}

class treatcard extends StatelessWidget {
  var _name;
  var _description;
  var _doc;
  var _bgColor;

  treatcard(this._name, this._description, this._doc, this._bgColor);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: _bgColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            title: Text(
              _name,
              style: TextStyle(
                color: kTitleTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _doc,
                style: TextStyle(
                  color: kTitleTextColor,
                  fontSize: 13,
                ),
              ),
            ),
            trailing: Text(
              _description,
              style: TextStyle(
                color: kTitleTextColor.withOpacity(0.7),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
