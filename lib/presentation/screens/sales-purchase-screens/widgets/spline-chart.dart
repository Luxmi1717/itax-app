// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class SplineGraphPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Spline Chart Example'),
//       ),
//       body: Center(
//         child: SfCartesianChart(
//           title: ChartTitle(text: 'Monthly Sales Analysis'),
//           legend: Legend(isVisible: true),
//           tooltipBehavior: TooltipBehavior(enable: true),
//           primaryXAxis: CategoryAxis(),
//           primaryYAxis: NumericAxis(
//             title: AxisTitle(text: 'Sales (in Rs)'),
//           ),
          
          
//         ),
//       ),
//     );
//   }

//   List<SalesData> getChartData() {
//     return <SalesData>[
//       SalesData('Jan', 30000),
//       SalesData('Feb', 28000),
//       SalesData('Mar', 34000),
//       SalesData('Apr', 32000),
//       SalesData('May', 40000),
//       SalesData('Jun', 38000),
//       SalesData('Jul', 45000),
//     ];
//   }
// }

// class SalesData {
//   final String month;
//   final double sales;

//   SalesData(this.month, this.sales);
// }
