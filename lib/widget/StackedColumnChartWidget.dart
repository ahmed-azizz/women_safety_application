import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class StackedColumnChartWidget extends StatelessWidget {
  final List<SalesData> data;

  StackedColumnChartWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    final seriesList = [
      charts.Series<SalesData, String>(
        id: 'Violence',
        colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
        domainFn: (SalesData sales, _) => sales.month,
        measureFn: (SalesData sales, _) => sales.salesA,
        data: data,
      ),
      // charts.Series<SalesData, String>(
      //   id: 'Expenses',
      //   colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
      //   domainFn: (SalesData sales, _) => sales.month,
      //   measureFn: (SalesData sales, _) => sales.salesB,
      //   data: data,
      // ),
      // charts.Series<SalesData, String>(
      //   id: 'Profit',
      //   colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      //   domainFn: (SalesData sales, _) => sales.month,
      //   measureFn: (SalesData sales, _) => sales.salesC,
      //   data: data,
      // ),
    ];

    final chart = charts.BarChart(
      seriesList,
      animate: true,
      vertical: true,
      barRendererDecorator: charts.BarLabelDecorator<String>(),
      domainAxis: charts.OrdinalAxisSpec(),
      behaviors: [
        charts.SeriesLegend(
          position: charts.BehaviorPosition.bottom,
          horizontalFirst: false,
          desiredMaxColumns: 5,
          outsideJustification: charts.OutsideJustification.middleDrawArea,
          cellPadding: const EdgeInsets.only(right: 54.0, bottom: 44.0),
        ),
      ],
    );

    return Container(
      child: chart,
      height: 300.0,
      padding: const EdgeInsets.all(6.0),
    );
  }
}

class SalesData {
  final String month;
  final int salesA;

  // final int salesB;
  // final int salesC;

  SalesData(this.month, this.salesA);
}
