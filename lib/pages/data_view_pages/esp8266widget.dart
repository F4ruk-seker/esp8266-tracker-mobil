import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/cupertino.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
Widget espDataCard(espID) {
  final Stream<DocumentSnapshot> EspReference =
      _firestore.collection('esp').doc(espID).snapshots();
  return Scaffold(
    appBar: AppBar(),
    body: Center(
      child: StreamBuilder<DocumentSnapshot>(
          stream: EspReference,
          builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
            if (asyncSnapshot.hasData) {
              var data = asyncSnapshot.data;
              return Card(
                  child: ListTile(
                    trailing: testview(),
                // trailing: status_with_action(),
                subtitle: Row(
                    mainAxisSize: MainAxisSize.min,
                  children: [isSyncView(), Text(data.get('sensor'))],
                ),
                onTap: () {
                  print('tap');
                },
                leading: numberInCircle(data.get('sensor')),
                title: Container(
                  child: Row(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(data.get('name')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ));
            } else {
              return Text("dasta");
            }
          }),
    ),
  );
}

Widget numberInCircle(num) {
  return Container(
    // margin: const EdgeInsets.all(10.0),
    child: Center(
      child: Text(num),
    ),
    width: 36,
    height: 36,
    decoration: BoxDecoration(
      color: Color.fromRGBO(4, 87, 87, 1),
      borderRadius: BorderRadius.all(Radius.elliptical(30, 30)),
    ),
  );
}
Widget testview(){
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      TextButton(onPressed: (){},child: statusView()),
      ElevatedButton(onPressed: (){}, child: statusView()),
    ],
  );
}
Widget isSyncView() {
  return Container(
    margin: EdgeInsets.all(2.0),
      child: Center(
        child: Icon(Icons.sync),
      ),
      width: 25,
      height: 25,
      decoration: BoxDecoration(

        color: Color.fromRGBO(4, 87, 87, 1),
        borderRadius: BorderRadius.all(Radius.elliptical(30, 30)),
      ));
}

Widget delete_esp_button_view(){
  return Text("data");
}
Widget isNotSyncView() {
  return Container(
      margin: EdgeInsets.all(2.0),
      child: Center(
        child: Icon(Icons.sync),
      ),
      width: 25,
      height: 25,
      decoration: BoxDecoration(

        color: Color.fromRGBO(227, 121, 8, 1),
        borderRadius: BorderRadius.all(Radius.elliptical(30, 30)),
      ));
}

// Figma Flutter Generator Ellipse8Widget - ELLIPSE
Widget statusView() {
  return DottedBorder(
    borderType: BorderType.RRect,
    radius: Radius.circular(10),
    dashPattern: [5, 5],
    color: Colors.grey.shade300,
    strokeWidth: 2,
      child: Container(
        height: 30,
        padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
        color: Color.fromRGBO(158, 226, 206, 0.12),
        child: Center(
          child: Text('Normal'),
        ),
      ));
}
