import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esptracker/pars_generic/inputBar.dart';

import 'package:esptracker/pages/data_view_pages/data_graphic_view.dart';
import 'package:flutter/rendering.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class esp_detail_view extends StatefulWidget {
  final String espID;

  const esp_detail_view({Key? key, required this.espID}) : super(key: key);

  @override
  _esp_detail_viewState createState() => _esp_detail_viewState();
}

class _esp_detail_viewState extends State<esp_detail_view> {
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sensor Detail"),
          centerTitle: true,
        ),
        body: Center(
            child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("esp")
              .doc(widget.espID)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
            if (asyncSnapshot.hasData) {
              var data = asyncSnapshot.data;
              String esp_name = data.get("name");
              String esp_sensor = data.get("sensor");
              List? sensor_history;
              try {
                sensor_history = data.get("sensor_history");
              } catch (e) {
                sensor_history = [];
              }
              return ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: Center(
                      child: Text("$esp_name | $esp_sensor",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              fontStyle: FontStyle.normal)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: EspDataGraphicView(sensor_history),
                  ),
                  Form(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: InputBarPars(
                              controller: TextEditingController(),
                              isPassword: false,
                              hintText: "pars",
                              isValied: false),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: InputBarPars(
                              controller: TextEditingController(),
                              isPassword: false,
                              hintText: "pars",
                              isValied: false),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: InputBarPars(
                              controller: TextEditingController(),
                              isPassword: false,
                              hintText: "pars",
                              isValied: false),
                        ),
                        const Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Center(
                              child: Text("Bildirim Ayaraları",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal)),
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5, left: 10),
                          child: Wrap(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Bildirm Gönder",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Checkbox(
                                  value: true,
                                  onChanged: (value) {},
                                  activeColor: Colors.transparent),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Mail Gönder",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Checkbox(
                                  value: true,
                                  onChanged: (value) {},
                                  activeColor: Colors.transparent),
                            ],
                          ),
                        ),
                        Wrap(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 5, bottom: 5, right: 20),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.redAccent),
                                ),
                                onPressed: () {},
                                child: Text("Delete"),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 5, bottom: 5, left: 20),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shadowColor: MaterialStateProperty.all<Color>(
                                      Colors.cyan),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blueGrey),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              );
            } else {
              return Text("data");
            }
          },
        )),
      ),
    );
  }
}
