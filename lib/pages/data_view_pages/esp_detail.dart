import 'package:flutter/material.dart';

import 'package:esptracker/pars_generic/inputBar.dart';

import 'package:esptracker/pages/data_view_pages/data_graphic_view.dart';
import 'package:flutter/rendering.dart';

class esp_detail_view extends StatefulWidget {
  const esp_detail_view({Key? key}) : super(key: key);

  @override
  _esp_detail_viewState createState() => _esp_detail_viewState();
}

class _esp_detail_viewState extends State<esp_detail_view> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sensor Detail"),
          centerTitle: true,
        ),
        body: Center(
          child: ListView(
            children: [
              const Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Center(
                    child: Text("Esp 8266,detail",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            fontStyle: FontStyle.normal)),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: EspDataGraphicView([25.0, 12.0, 120.0]),
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
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.redAccent),
                            ),
                            onPressed: () {},
                            child: Text("Delete"),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5, left: 20),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shadowColor:
                                  MaterialStateProperty.all<Color>(Colors.cyan),
                              backgroundColor: MaterialStateProperty.all<Color>(
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
          ),
        ),
      ),
    );
  }
}
