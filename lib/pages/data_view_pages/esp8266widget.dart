
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
Widget espDataCard(espID){
  _firestore.collection('esp').doc(espID).get().toString();
  print(_firestore.collection('esp').doc(espID).get().toString());

  final Stream<DocumentSnapshot> EspReference = _firestore.collection('esp').doc(espID).snapshots();
  return Scaffold(
      body: Center(child: StreamBuilder<DocumentSnapshot>(
        stream: EspReference,
        builder: (BuildContext context,AsyncSnapshot asyncSnapshot){
          if (asyncSnapshot.hasData){
            var data = asyncSnapshot.data;
            return Card(
              child: ListTile(
                title: Text('Ceo Room'),
                subtitle: Text(data.get('sensor')),
              ),
            );
          }
          return Text("data");
        })),
    );
}