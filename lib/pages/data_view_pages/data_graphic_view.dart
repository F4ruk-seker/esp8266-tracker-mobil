
import 'package:flutter/material.dart';

import 'package:chart_sparkline/chart_sparkline.dart';


Widget EspDataGraphicView(List<dynamic>? data){
  List<double> cleanList = [];

  if (data != null){
    data.forEach((value) {
    if (value.runtimeType == String){
      try{
        cleanList.add(double.parse(value));
      }catch(_){
        cleanList.add(0.0);
      }
    }else if (value.runtimeType == int){
        cleanList.add(value.toDouble());
      }else{
      cleanList.add(value);
    }
    });
    return Sparkline(
      enableThreshold: true,
      useCubicSmoothing: true,

      // sharpCorners: true,
      // enableGridLines: true,
      lineColor: Color.fromRGBO(4, 87, 87, 1),
      lineWidth: 3.2,
      fillGradient: LinearGradient(
        colors: <Color>[
          Color.fromRGBO(4, 87, 87, 0.1),
          Color.fromRGBO(4, 87, 87, 0.3),
          Color.fromRGBO(4, 87, 87, 0.5),
          Color.fromRGBO(4, 87, 87, 0.5),
        ],
      ),
      fillMode: FillMode.below,
      fillColor: Colors.red,
      data: cleanList,
    );
  }else{
    return Text("grafik datası alındamadı");
  }
}