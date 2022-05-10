import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/models/consultations.dart';
import 'package:doctor_app/screens/detail_screen.dart';
import 'package:doctor_app/screens/details_screen1.dart';
import 'package:doctor_app/services/consultations_services.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'auth/components/doctor_card.dart';

class AllAppoints extends StatelessWidget {
  const AllAppoints({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Yesh"),
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child:          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Your List of all Appointments',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kTitleTextColor,
                    fontSize: 22,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              
           StreamBuilder<QuerySnapshot>(
          stream: ConsultationServices().getPatientConsultations(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
               List<Consultation> _consultation =
                    snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                

                  return Consultation.fromJson(data);
                }).toList();
            return       
                SizedBox(
                  height:queryData.size.height* 0.8,
                  child: ListView.builder(itemBuilder:(context, index) {
                    
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical:0.0),
                      child: AppointCard(_consultation[index].appointmentDate,_consultation[index].docName,_consultation[index].appointmentName,images[index],
                    (){
                      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen1(_consultation[index]),
          ),
        );
                    }),
                    );
                  },itemCount: _consultation.length),
                );
            } else {            
                
                return CircularProgressIndicator(color: primaryColor,) ;
              }
            
          }),

               
            ],
          ),
        ),
      ),
    );
  }
}

class AppointCard extends StatelessWidget {
  var _date;
  var _doctor;
  String appointmentName;
  String images;
  Function function;

  AppointCard(this._date, this._doctor,this.appointmentName,this.images,this.function);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _date,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kTitleTextColor,
            fontSize: 18,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              DoctorCard(
                _doctor,
              appointmentName,
              images,
                kBlueColor,
                (){
function();
                }    
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
