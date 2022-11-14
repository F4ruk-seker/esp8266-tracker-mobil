import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:esptracker/pages/data_view_pages/esp8266widget.dart';
import 'package:esptracker/services/notfication_service.dart';

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class ViewAllEsp extends StatefulWidget {
  const ViewAllEsp({Key? key}) : super(key: key);

  @override
  _ViewAllEspState createState() => _ViewAllEspState();
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class _ViewAllEspState extends State<ViewAllEsp> {

  final CollectionReference _collectionReference = _firestore.collection('esp');

  final _service = NotificationService();

  @override
  void initState() {
    super.initState();
    _service.connectNotfication();

    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      String ?alert_message = event.notification?.body;
      String ?alert_title = event.notification?.title;
      if (alert_message != null || alert_title != null){
        _service.showNotification(1, alert_title.toString(), alert_message.toString() ,10);
      }
      print("Gelen bildirim başlığı: ${event.notification?.title}");
    });
    tz.initializeTimeZones();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('esp | pars'), centerTitle: true),

        body: StreamBuilder<QuerySnapshot>(
            stream: _collectionReference.snapshots(),
            builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
              if (asyncSnapshot.hasData) {
                List<DocumentSnapshot> data = asyncSnapshot.data.docs;
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      var _data = data[index];
                      return espDataCard(row: index + 1, data: _data);
                    });
              } else if (asyncSnapshot.hasError) {
                return Center(child: Text("Esp datası alınamadı"));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
