import 'package:flutter/material.dart';

import 'package:chart_sparkline/chart_sparkline.dart';


Widget EspDataGraphicView(data){
  return Sparkline(
    useCubicSmoothing: true,
    // sharpCorners: true,
    enableGridLines: true,
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
    data: data,
  );
}