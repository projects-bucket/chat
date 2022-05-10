import 'package:doctor_app/screens/path_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../detail_screen.dart';

class DoctorCard extends StatelessWidget {
  var _name;
  var _description;
  var _imageUrl;
  var _bgColor;
  Function detailsScreen;

  DoctorCard(this._name, this._description, this._imageUrl, this._bgColor,this.detailsScreen);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       detailsScreen();
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: _bgColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            leading: Image.asset(_imageUrl),
            title: Text(
              _name,
              style: TextStyle(
                color: kTitleTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              _description,
              style: TextStyle(
                color: kTitleTextColor.withOpacity(0.7),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DoctorCard2 extends StatelessWidget {
  var _name;
  var _description;
  var _doc;
  var _imageUrl;
  var _bgColor;
  Function function;

  DoctorCard2(
      this._name, this._description, this._doc, this._imageUrl, this._bgColor,this.function);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function();
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: _bgColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            leading: Image.asset(_imageUrl),
            title: Text(
              _name,
              style: TextStyle(
                color: kTitleTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _doc,
                style: TextStyle(
                  color: kTitleTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            trailing: Text(
              _description,
              style: TextStyle(
                color: kTitleTextColor.withOpacity(0.7),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
