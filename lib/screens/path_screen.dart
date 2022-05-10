import 'package:doctor_app/constants.dart';
import 'package:flutter/material.dart';

import 'auth/components/doctor_card.dart';
import 'treatments.dart';

/*
  class PathScreen extends StatefulWidget {
  @override
  State<PathScreen> createState() => _PathScreenState();
}

class _PathScreenState extends State<PathScreen> {
  int _currentIndex = 0;

  final tabs = [
    pathDent(),
    Treatments(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medical Paths"),
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: tabs[_currentIndex],
        ),
      ),
    );
    // ignore: dead_code
    BottomNavigationBar(
      currentIndex: _currentIndex,
      backgroundColor: Colors.black,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Consultations',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.medication),
          label: 'Treatements',
        )
      ],
      onTap: (index) {
        setState(
          (() {
            _currentIndex = index;
          }),
        );
      },
    );
  }
}

class pathDent extends StatelessWidget {
  const pathDent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'Your Dental Path',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: kTitleTextColor,
              fontSize: 22,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Doctor : Dr. Ayushman',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'No of Appointments : 5',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'Your Appointments',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: kTitleTextColor,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              DoctorCard2(
                'Dental Appointment',
                '23rd Jun',
                'Dr. Imran Malik',
                'assets/images/doctor2.png',
                kYellowColor,
              ),
              SizedBox(
                height: 20,
              ),
              DoctorCard2(
                'Dental Appointment',
                '23rd Jun',
                'Dr. Imran Malik',
                'assets/images/doctor2.png',
                kBlueColor,
              ),
              SizedBox(
                height: 20,
              ),
              DoctorCard2(
                'Dental Appointment',
                '23rd Jun',
                'Dr. Imran Malik',
                'assets/images/doctor2.png',
                kYellowColor,
              ),
            ],
          ),
        )
      ],
    );
  }
}
*/

class PathScreen extends StatelessWidget {
  const PathScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical paths'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Your Dental Path',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: kTitleTextColor,
                fontSize: 22,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'Doctor : Dr. Ayushman',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'No of Appointments : 5',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Treatments(),
                    ),
                  );
                },
                child: Text('Your treatments'),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Your Appointments',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kTitleTextColor,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                DoctorCard2(
                  'Dental Appointment',
                  '23rd Jun',
                  'Dr. Imran Malik',
                  'assets/images/doctor2.png',
                  kYellowColor,(){
                    
                  }
                ),
                SizedBox(
                  height: 20,
                ),
                DoctorCard2(
                  'Dental Appointment',
                  '23rd Jun',
                  'Dr. Imran Malik',
                  'assets/images/doctor2.png',
                  kBlueColor,(){}
                ),
                SizedBox(
                  height: 20,
                ),
                DoctorCard2(
                  'Dental Appointment',
                  '23rd Jun',
                  'Dr. Imran Malik',
                  'assets/images/doctor2.png',
                  kYellowColor,(){}
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
