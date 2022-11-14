import 'package:flutter/material.dart';

import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/cupertino.dart';

import 'package:esptracker/services/notfication_service.dart';

final _service = NotificationService();


Card espDataCard({row = 0, data}) {
  _service.initNotification();
  // if (data.get('sensor') > data.get('alert_border')) {
  //
  //   _service.showNotification(2, data.get('name').toString(), 'alert', 10);
  // }
  return Card(
    child: ListTile(
      trailing: trailingView(),
      subtitle: Row(
        mainAxisSize: MainAxisSize.min,
        children: [isSyncView(), Text(data.get('sensor').toString()), Text("<"), Text(data.get('alert_border').toString())],
      ),
      onTap: () {
        print('tap');
      },
      leading: numberInCircle(row.toString()),
      title: espNameBar(data.get('name').toString()),
    ),
  );
}

Widget espNameBar(name) {
  return Container(
    child: Row(
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(name),
            ],
          ),
        ),
      ],
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

Widget trailingView() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      statusView(),
      delete_esp_button_view(),
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

Widget delete_esp_button_view() {
  return RawMaterialButton(
    onPressed: () {},
    elevation: 2.0,
    child: Icon(
      Icons.remove,
      // size: 5.0,
    ),
    // padding: EdgeInsets.all(15.0),
    shape: CircleBorder(),
  );
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
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        color: Color.fromRGBO(158, 226, 206, 0.12),
        child: Center(
          child: Text('Normal'),
        ),
      ));
}
