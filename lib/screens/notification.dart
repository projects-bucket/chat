import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/screens/loading_dailog.dart';
import 'package:doctor_app/services/notification.dart';
import 'package:doctor_app/utils/errorCallback.dart';
import 'package:flutter/material.dart';


import '../constants.dart';

class Notifs extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(

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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Notifications',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kTitleTextColor,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream:NotificationServices().getUserNotifications(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Map<String, dynamic>> _notifications =
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;

                        return data;
                      }).toList();

                      return _notifications.length ==0 ? SizedBox(child: Center(child: Text("No New Notifications",style: TextStyle(color: Colors.black54,fontSize: 18),)),) :SizedBox(
                        height: queryData.size.height - 30,
                        child: ListView.builder(
                            itemCount: _notifications.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color:
                                              colors[index % 5].withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      child: NotifCard(
                                            _notifications[index]['doctorName'],
                                            "wants to add records",
                                            "_doc",
                                            kBlueColor,_notifications[index]['id'],_notifications[index]['approved']),
                                    ),
                                  ));
                            }),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Center(
                        child: Text(
                          "You Don't have any notificatons",
                          style: TextStyle(fontSize: 18, color: Colors.black54),
                        ),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class NotifCard extends StatelessWidget {
  var _name;
  var _description;
  var _doc;
  var _bgColor;
  String id;
  bool approved;

  NotifCard(this._name, this._description, this._doc, this._bgColor,this.id,this.approved);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ListTile(
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
              _description,
              style: TextStyle(
                color: kTitleTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          trailing:approved ?Text("Approved",style: TextStyle(color: Colors.blue,fontSize: 18),)  : ElevatedButton(
            onPressed: () async{
showLoaderDialog(context);
                                await NotificationServices().updateNotification(id, (e)=>toastMesssage(e));
                                Navigator.pop(context);
            },
            child: Text("Approve"),
          )),
    );
  }
}
