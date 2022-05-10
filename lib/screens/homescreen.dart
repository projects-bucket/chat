import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/models/consultations.dart';
import 'package:doctor_app/screens/all_appoints.dart';
import 'package:doctor_app/screens/details_screen1.dart';
import 'package:doctor_app/screens/loading_dailog.dart';
import 'package:doctor_app/screens/notification.dart';
import 'package:doctor_app/services/consultations_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/link.dart';

import '../constants.dart';
import 'auth/components/category_card.dart';
import 'auth/components/doctor_card.dart';
import 'auth/components/search_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import 'profile/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
             Padding(
            padding: EdgeInsets.all(0.0),
            child: IconButton(
              icon: Icon(Icons.qr_code),
              onPressed: () {
                showQrCodeDialog(context);
               
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(0.0),
            child: IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Notifs(),
                  ),
                );
              },
            ),
          ),
            IconButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ),
                      ),
                      icon: SvgPicture.asset('assets/icons/profile.svg'),
                    ),
       
        ],
        title: Text("Welcome Yesh"),
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
             
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your Consultations',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kTitleTextColor,
                        fontSize: 18,
                      ),
                    ),
                    Link(
                      builder: (context, followLink) => ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AllAppoints(),
                            ),
                          );
                        },
                        child: Text("View All"),
                      ),
                      uri: null,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              buildDoctorList(queryData),
              
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Your Medical Paths',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kTitleTextColor,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              buildCategoryList(),
            ],
          ),
        ),
      ),
    );
  }

  buildCategoryList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 30,
          ),
          CategoryCard(
            'Teeth\nPath',
            'assets/icons/dental_surgeon.png',
            kBlueColor,
          ),
          SizedBox(
            width: 10,
          ),
          CategoryCard(
            'Heart\nSurgery Path',
            'assets/icons/heart_surgeon.png',
            kYellowColor,
          ),
          SizedBox(
            width: 10,
          ),
          CategoryCard(
            'Eye\nOperation\nPath',
            'assets/icons/eye_specialist.png',
            kOrangeColor,
          ),
          SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }

  buildDoctorList(queryData) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: StreamBuilder<QuerySnapshot>(
          stream: ConsultationServices().getPatientConsultations(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Consultation> _consultation =
                  snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;

                return Consultation.fromJson(data);
              }).toList();
              return _consultation.length !=0 ? SizedBox(
                height: _consultation.length * 120,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: DoctorCard2(
                          _consultation[index].appointmentName,
                          _consultation[index].appointmentDate,
                          _consultation[index].docName,
                          images[index],
                          colors[index], () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen1(_consultation[index]),
                          ),
                        );
                      }),
                    );
                  },
                  itemCount:
                      _consultation.length > 3 ? 3 : _consultation.length,
                ),
              ): Center(
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: SizedBox(child: Text("You don't have any consultations yet",style: TextStyle(color: Colors.black54,fontSize: 18,),textAlign: TextAlign.center,),),
                ),
              );
            } else {
              return CircularProgressIndicator(
                color: primaryColor,
              );
            }
          }),
    );
  }
}
