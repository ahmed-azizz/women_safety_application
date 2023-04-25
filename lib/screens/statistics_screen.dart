import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/NewsWidget.dart';
import '../widget/StackedColumnChartWidget.dart';

class statistics extends StatelessWidget {
  final data = [
    SalesData('2015', 32),
    SalesData('2016', 20),
    SalesData('2017', 50),
    SalesData('2018', 25),
    SalesData('2019', 10),
    SalesData('2020', 10),
    SalesData('2021', 10),
    SalesData('2022', 10),
    SalesData('2023', 10),
  ];

  final data1 = [
    SalesData('Jan', 22),
    SalesData('Feb', 45),
    SalesData('Mar', 58),
    SalesData('Apr', 36),
    SalesData('May', 27),
    SalesData('Jun', 48),
    SalesData('Jul', 63),
    SalesData('Aug', 54),
    SalesData('Sep', 25),
    SalesData('Oct', 19),
    SalesData('Nov', 33),
    SalesData('Dec', 47),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "This year",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.start,
              ),
              StackedColumnChartWidget(data: data1),
              Text(
                "Other years",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.start,
              ),
              StackedColumnChartWidget(data: data),
            ],
          ),
        ),
      ),
    );
  }
}
