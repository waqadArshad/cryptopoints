/// Package imports
import 'dart:developer';

import 'package:cryptopoints/constants/constant_variables.dart';
import 'package:cryptopoints/generated/assets.dart';

/// Local imports
import 'package:cryptopoints/models/sample_view.dart';
import 'package:cryptopoints/widgets/height_width.dart';
import 'package:cryptopoints/widgets/my_button.dart';
import 'package:cryptopoints/widgets/my_drop_down.dart';
import 'package:cryptopoints/widgets/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:toggle_switch/toggle_switch.dart';

///Renders default Candle series chart
class CandleChart extends SampleView {
  ///Creates default Candle series chart
  const CandleChart({Key? key}) : super(key: key);

  @override
  _CandleChartState createState() => _CandleChartState();
}

class _CandleChartState extends SampleViewState {
  _CandleChartState();
  late bool _enableSolidCandle;
  late bool _toggleVisibility;
  TrackballBehavior? _trackballBehavior;
  String exchangeName = "Binance";
  String binanceSymbol = "BTCUSDT";
  String chartType = "Candle";
  String direction = "Normal";
  List<String> exchangeNameList = ["Binance", "KuCoin"];
  List<String> binanceSymbolList = ["BTCUSDT", "BNBBTC", "GASBTC", "BNBETH", "BNTETH"];
  List<String> chartTypeList = ["Candle", "Line"];
  List<String> directionList = ["Normal", "Reverse"];

  DateTime filterDate = DateTime.now();
  String selectedEventDate = DateFormat.yMEd().format(DateTime.now()).toString();

  @override
  Widget buildSettings(BuildContext context) {
    return StatefulBuilder(builder: (BuildContext context, StateSetter stateSetter) {
      return Column(
        // shrinkWrap: true,
        children: <Widget>[
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            child: MyDropDown(
              heading: 'Exchange',
              items: exchangeNameList,
              value: exchangeName,
              onChanged: (value) {
                setState(() {
                  exchangeName = value;
                  stateSetter(() {});
                });
              },
              // onChanged: (value) => eventController.selectEventType(value),
            ),
            // child: Row(
            //   children: <Widget>[
            //     Text('Show indication for  \nsame values',
            //         style: TextStyle(
            //           color: model.textColor,
            //           fontSize: 16,
            //         )),
            //     SizedBox(
            //         width: 90,
            //         child: CheckboxListTile(
            //             activeColor: model.backgroundColor,
            //             value: _toggleVisibility,
            //             onChanged: (bool? value) {
            //               setState(() {
            //                 _toggleVisibility = value!;
            //                 stateSetter(() {});
            //               });
            //             }))
            //   ],
            // ),
          ),
          SizedBox(
            child: MyDropDown(
              heading: 'Binance Symbol',
              items: binanceSymbolList,
              value: binanceSymbol,
              onChanged: (value) {
                setState(() {
                  binanceSymbol = value;
                  stateSetter(() {});
                });
              },
              // onChanged: (value) => eventController.selectEventType(value),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: SizedBox(
              child: ToggleSwitch(
                initialLabelIndex: 0,
                totalSwitches: 3,
                minWidth: width(context, 0.290),
                labels: const ['Manual', 'Short Term', 'Long Term'],
                activeBgColor: const [yellowColor],
                activeFgColor: whiteColor,
                onToggle: (index) {
                  log('switched to: $index');
                },
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            child: GestureDetector(
              onTap: () => showModalBottomSheet(
                context: context,
                builder: (_) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        child: Container(
                          height: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              MyText(
                                paddingLeft: 15,
                                paddingTop: 10,
                                text: 'Select Date',
                                size: 16,
                                align: TextAlign.center,
                                weight: FontWeight.w600,
                              ),
                              Expanded(
                                child: CupertinoTheme(
                                  data: const CupertinoThemeData(
                                    textTheme: CupertinoTextThemeData(
                                      dateTimePickerTextStyle: TextStyle(
                                        fontSize: 14,
                                        color: blackColor,
                                      ),
                                    ),
                                    scaffoldBackgroundColor: Colors.transparent,
                                    primaryColor: Colors.red,
                                  ),
                                  child: CupertinoDatePicker(
                                    initialDateTime: filterDate,
                                    mode: CupertinoDatePickerMode.date,
                                    backgroundColor: whiteColor,
                                    minimumYear: 1900,
                                    maximumYear: DateTime.now().year,
                                    onDateTimeChanged: (value) {
                                      setState(() {
                                        filterDate = value;
                                        selectedEventDate = DateFormat.yMEd().format(value).toString();
                                        stateSetter(() {});
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 10,
                                ),
                                child: MyButton(
                                  onTap: () => Navigator.pop(context),
                                  buttonText: 'Done',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              child: Container(
                height: 52,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: yellowColor,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: MyText(
                        text: selectedEventDate,
                        size: 12,
                        weight: FontWeight.w500,
                        color: greyColor,
                      ),
                    ),
                    Image.asset(
                      Assets.assetsDatePicker,
                      height: 15.0,
                      color: greyColor,
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            child: MyDropDown(
              heading: 'Chart Type',
              items: chartTypeList,
              value: chartType,
              onChanged: (value) {
                setState(() {
                  chartType = value;
                  stateSetter(() {});
                });
              },
              // onChanged: (value) => eventController.selectEventType(value),
            ),
          ),
          SizedBox(
            child: MyDropDown(
              heading: 'Direction',
              items: directionList,
              value: direction,
              onChanged: (value) {
                setState(() {
                  direction = value;
                  stateSetter(() {});
                });
              },
              // onChanged: (value) => eventController.selectEventType(value),
            ),
          ),
          const SizedBox(
            height: 15,
          ),

          // SizedBox(
          //   child: Row(
          //     children: <Widget>[
          //       Text('Enable solid candles',
          //           style: TextStyle(
          //             color: model.textColor,
          //             fontSize: 16,
          //           )),
          //       SizedBox(
          //           width: 90,
          //           child: CheckboxListTile(
          //               activeColor: model.backgroundColor,
          //               value: _enableSolidCandle,
          //               onChanged: (bool? value) {
          //                 setState(() {
          //                   _enableSolidCandle = value!;
          //                   stateSetter(() {});
          //                 });
          //               }))
          //     ],
          //   ),
          // ),
          // SizedBox(
          //   child: Row(
          //     children: <Widget>[
          //       Text('Show indication for  \nsame values',
          //           style: TextStyle(
          //             color: model.textColor,
          //             fontSize: 16,
          //           )),
          //       SizedBox(
          //           width: 90,
          //           child: CheckboxListTile(
          //               activeColor: model.backgroundColor,
          //               value: _toggleVisibility,
          //               onChanged: (bool? value) {
          //                 setState(() {
          //                   _toggleVisibility = value!;
          //                   stateSetter(() {});
          //                 });
          //               }))
          //     ],
          //   ),
          // ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        buildSettings(context),
        _buildCandle(),
      ],
    );
  }

  ///Get the cartesian chart with candle series
  SfCartesianChart _buildCandle() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: isCardView ? '' : 'AAPL - 2016'),
      primaryXAxis: DateTimeAxis(
          dateFormat: DateFormat.MMM(),
          interval: 3,
          intervalType: DateTimeIntervalType.months,
          minimum: DateTime(2016),
          maximum: DateTime(2016, 10),
          majorGridLines: const MajorGridLines(width: 0)),
      primaryYAxis: NumericAxis(
          minimum: 140, maximum: 60, interval: 20, labelFormat: r'${value}', axisLine: const AxisLine(width: 0)),
      series: _getCandleSeries(),
      trackballBehavior: _trackballBehavior,
    );
  }

  /// It returns the candle series to the chart.
  List<CandleSeries<ChartSampleData, DateTime>> _getCandleSeries() {
    return <CandleSeries<ChartSampleData, DateTime>>[
      CandleSeries<ChartSampleData, DateTime>(
          enableSolidCandles: _enableSolidCandle,
          dataSource: <ChartSampleData>[
            ChartSampleData(x: DateTime(2016, 01, 11), open: 98.97, high: 101.19, low: 95.36, close: 97.13),
            ChartSampleData(x: DateTime(2016, 01, 18), open: 98.41, high: 101.46, low: 93.42, close: 101.42),
            ChartSampleData(x: DateTime(2016, 01, 25), open: 101.52, high: 101.53, low: 92.39, close: 97.34),
            ChartSampleData(x: DateTime(2016, 02), open: 96.47, high: 97.33, low: 93.69, close: 94.02),
            ChartSampleData(x: DateTime(2016, 02, 08), open: 93.13, high: 96.35, low: 92.59, close: 93.99),
            ChartSampleData(x: DateTime(2016, 02, 15), open: 95.02, high: 98.89, low: 94.61, close: 96.04),
            ChartSampleData(x: DateTime(2016, 02, 22), open: 96.31, high: 98.0237, low: 93.32, close: 96.91),
            ChartSampleData(x: DateTime(2016, 02, 29), open: 96.86, high: 103.75, low: 96.65, close: 103.01),
            ChartSampleData(x: DateTime(2016, 03, 07), open: 102.39, high: 102.83, low: 100.15, close: 102.26),
            ChartSampleData(x: DateTime(2016, 03, 14), open: 106.5, high: 106.5, low: 106.5, close: 106.5),
            ChartSampleData(x: DateTime(2016, 03, 21), open: 105.93, high: 107.65, low: 104.89, close: 105.67),
            ChartSampleData(x: DateTime(2016, 03, 28), open: 106, high: 110.42, low: 104.88, close: 109.99),
            ChartSampleData(x: DateTime(2016, 04, 04), open: 110.42, high: 112.19, low: 108.121, close: 108.66),
            ChartSampleData(x: DateTime(2016, 04, 11), open: 108.97, high: 112.39, low: 108.66, close: 109.85),
            ChartSampleData(x: DateTime(2016, 04, 18), open: 108.89, high: 108.95, low: 104.62, close: 105.68),
            ChartSampleData(x: DateTime(2016, 04, 25), open: 105, high: 105.65, low: 92.51, close: 93.74),
            ChartSampleData(x: DateTime(2016, 05, 02), open: 93.965, high: 95.9, low: 91.85, close: 92.72),
            ChartSampleData(x: DateTime(2016, 05, 09), open: 93, high: 93.77, low: 89.47, close: 90.52),
            ChartSampleData(x: DateTime(2016, 05, 16), open: 92.39, high: 95.43, low: 91.65, close: 95.22),
            ChartSampleData(x: DateTime(2016, 05, 23), open: 95.87, high: 100.73, low: 95.67, close: 100.35),
            ChartSampleData(x: DateTime(2016, 05, 30), open: 99.6, high: 100.4, low: 96.63, close: 97.92),
            ChartSampleData(x: DateTime(2016, 06, 06), open: 97.99, high: 101.89, low: 97.55, close: 98.83),
            ChartSampleData(x: DateTime(2016, 06, 13), open: 98.69, high: 99.12, low: 95.3, close: 95.33),
            ChartSampleData(x: DateTime(2016, 06, 20), open: 96, high: 96.89, low: 92.65, close: 93.4),
            ChartSampleData(x: DateTime(2016, 06, 27), open: 93, high: 96.465, low: 91.5, close: 95.89),
            ChartSampleData(x: DateTime(2016, 07, 04), open: 95.39, high: 96.89, low: 94.37, close: 96.68),
            ChartSampleData(x: DateTime(2016, 07, 11), open: 96.75, high: 99.3, low: 96.73, close: 98.78),
            ChartSampleData(x: DateTime(2016, 07, 18), open: 98.7, high: 101, low: 98.31, close: 98.66),
            ChartSampleData(x: DateTime(2016, 07, 25), open: 98.25, high: 104.55, low: 96.42, close: 104.21),
            ChartSampleData(x: DateTime(2016, 08), open: 104.41, high: 107.65, low: 104, close: 107.48),
            ChartSampleData(x: DateTime(2016, 08, 08), open: 107.52, high: 108.94, low: 107.16, close: 108.18),
            ChartSampleData(x: DateTime(2016, 08, 15), open: 108.14, high: 110.23, low: 108.08, close: 109.36),
            ChartSampleData(x: DateTime(2016, 08, 22), open: 108.86, high: 109.32, low: 106.31, close: 106.94),
            ChartSampleData(x: DateTime(2016, 08, 29), open: 109.74, high: 109.74, low: 109.74, close: 109.74),
            ChartSampleData(x: DateTime(2016, 09, 05), open: 107.9, high: 108.76, low: 103.13, close: 103.13),
            ChartSampleData(x: DateTime(2016, 09, 12), open: 102.65, high: 116.13, low: 102.53, close: 114.92),
            ChartSampleData(x: DateTime(2016, 09, 19), open: 115.19, high: 116.18, low: 111.55, close: 112.71),
            ChartSampleData(x: DateTime(2016, 09, 26), open: 111.64, high: 114.64, low: 111.55, close: 113.05),
          ],
          name: 'AAPL',
          showIndicationForSameValues: isCardView ? true : _toggleVisibility,
          xValueMapper: (ChartSampleData sales, _) => sales.x as DateTime,

          /// High, low, open and close values used to render the candle series.
          lowValueMapper: (ChartSampleData sales, _) => sales.low,
          highValueMapper: (ChartSampleData sales, _) => sales.high,
          openValueMapper: (ChartSampleData sales, _) => sales.open,
          closeValueMapper: (ChartSampleData sales, _) => sales.close)
    ];
  }

  @override
  void initState() {
    _enableSolidCandle = false;
    _toggleVisibility = true;
    _trackballBehavior = TrackballBehavior(enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
  }
}

// import 'package:cryptopoints/constants/constant_variables.dart';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
//
//
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key,}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   late List<_ChartData> data;
//   late TooltipBehavior _tooltip;
//
//   @override
//   void initState() {
//     data = [
//       _ChartData('CHN', 12),
//       _ChartData('GER', 15),
//       _ChartData('RUS', 30),
//       _ChartData('BRZ', 6.4),
//       _ChartData('IND', 14)
//     ];
//     _tooltip = TooltipBehavior(enable: true);
//     _enableSolidCandle = false;
//     _toggleVisibility = true;
//     _trackballBehavior = TrackballBehavior(
//         enable: true, activationMode: ActivationMode.singleTap);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Syncfusion Flutter chart'),
//         ),
//         body: _buildCandle();
//         // SfCartesianChart(
//         //     primaryXAxis: CategoryAxis(),
//         //     primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
//         //     tooltipBehavior: _tooltip,
//         //     series: <ChartSeries<_ChartData, String>>[
//         //       CandleSeries<_ChartData, String>(
//         //           dataSource: data,
//         //           xValueMapper: (_ChartData data, _) => data.x,
//         //           yValueMapper: (_ChartData data, _) => data.y,
//         //           name: 'Gold',
//         //           color: Color.fromRGBO(8, 142, 255, 1))
//         //     ]));
//   }
//
//   SfCartesianChart _buildCandle() {
//     return SfCartesianChart(
//       plotAreaBorderWidth: 0,
//       title: ChartTitle(text: isCardView ? '' : 'AAPL - 2016'),
//       primaryXAxis: DateTimeAxis(
//           dateFormat: DateFormat.MMM(),
//           interval: 3,
//           intervalType: DateTimeIntervalType.months,
//           minimum: DateTime(2016),
//           maximum: DateTime(2016, 10),
//           majorGridLines: const MajorGridLines(width: 0)),
//       primaryYAxis: NumericAxis(
//           minimum: 140,
//           maximum: 60,
//           interval: 20,
//           labelFormat: r'${value}',
//           axisLine: const AxisLine(width: 0)),
//       series: _getCandleSeries(),
//       trackballBehavior: _trackballBehavior,
//     );
//   }
//
//   /// It returns the candle series to the chart.
//   List<CandleSeries<ChartSampleData, DateTime>> _getCandleSeries() {
//     return <CandleSeries<ChartSampleData, DateTime>>[
//       CandleSeries<ChartSampleData, DateTime>(
//           enableSolidCandles: _enableSolidCandle,
//           dataSource: <ChartSampleData>[
//             ChartSampleData(
//                 x: DateTime(2016, 01, 11),
//                 open: 98.97,
//                 high: 101.19,
//                 low: 95.36,
//                 close: 97.13),
//             ChartSampleData(
//                 x: DateTime(2016, 01, 18),
//                 open: 98.41,
//                 high: 101.46,
//                 low: 93.42,
//                 close: 101.42),
//             ChartSampleData(
//                 x: DateTime(2016, 01, 25),
//                 open: 101.52,
//                 high: 101.53,
//                 low: 92.39,
//                 close: 97.34),
//             ChartSampleData(
//                 x: DateTime(2016, 02),
//                 open: 96.47,
//                 high: 97.33,
//                 low: 93.69,
//                 close: 94.02),
//             ChartSampleData(
//                 x: DateTime(2016, 02, 08),
//                 open: 93.13,
//                 high: 96.35,
//                 low: 92.59,
//                 close: 93.99),
//             ChartSampleData(
//                 x: DateTime(2016, 02, 15),
//                 open: 95.02,
//                 high: 98.89,
//                 low: 94.61,
//                 close: 96.04),
//             ChartSampleData(
//                 x: DateTime(2016, 02, 22),
//                 open: 96.31,
//                 high: 98.0237,
//                 low: 93.32,
//                 close: 96.91),
//             ChartSampleData(
//                 x: DateTime(2016, 02, 29),
//                 open: 96.86,
//                 high: 103.75,
//                 low: 96.65,
//                 close: 103.01),
//             ChartSampleData(
//                 x: DateTime(2016, 03, 07),
//                 open: 102.39,
//                 high: 102.83,
//                 low: 100.15,
//                 close: 102.26),
//             ChartSampleData(
//                 x: DateTime(2016, 03, 14),
//                 open: 106.5,
//                 high: 106.5,
//                 low: 106.5,
//                 close: 106.5),
//             ChartSampleData(
//                 x: DateTime(2016, 03, 21),
//                 open: 105.93,
//                 high: 107.65,
//                 low: 104.89,
//                 close: 105.67),
//             ChartSampleData(
//                 x: DateTime(2016, 03, 28),
//                 open: 106,
//                 high: 110.42,
//                 low: 104.88,
//                 close: 109.99),
//             ChartSampleData(
//                 x: DateTime(2016, 04, 04),
//                 open: 110.42,
//                 high: 112.19,
//                 low: 108.121,
//                 close: 108.66),
//             ChartSampleData(
//                 x: DateTime(2016, 04, 11),
//                 open: 108.97,
//                 high: 112.39,
//                 low: 108.66,
//                 close: 109.85),
//             ChartSampleData(
//                 x: DateTime(2016, 04, 18),
//                 open: 108.89,
//                 high: 108.95,
//                 low: 104.62,
//                 close: 105.68),
//             ChartSampleData(
//                 x: DateTime(2016, 04, 25),
//                 open: 105,
//                 high: 105.65,
//                 low: 92.51,
//                 close: 93.74),
//             ChartSampleData(
//                 x: DateTime(2016, 05, 02),
//                 open: 93.965,
//                 high: 95.9,
//                 low: 91.85,
//                 close: 92.72),
//             ChartSampleData(
//                 x: DateTime(2016, 05, 09),
//                 open: 93,
//                 high: 93.77,
//                 low: 89.47,
//                 close: 90.52),
//             ChartSampleData(
//                 x: DateTime(2016, 05, 16),
//                 open: 92.39,
//                 high: 95.43,
//                 low: 91.65,
//                 close: 95.22),
//             ChartSampleData(
//                 x: DateTime(2016, 05, 23),
//                 open: 95.87,
//                 high: 100.73,
//                 low: 95.67,
//                 close: 100.35),
//             ChartSampleData(
//                 x: DateTime(2016, 05, 30),
//                 open: 99.6,
//                 high: 100.4,
//                 low: 96.63,
//                 close: 97.92),
//             ChartSampleData(
//                 x: DateTime(2016, 06, 06),
//                 open: 97.99,
//                 high: 101.89,
//                 low: 97.55,
//                 close: 98.83),
//             ChartSampleData(
//                 x: DateTime(2016, 06, 13),
//                 open: 98.69,
//                 high: 99.12,
//                 low: 95.3,
//                 close: 95.33),
//             ChartSampleData(
//                 x: DateTime(2016, 06, 20),
//                 open: 96,
//                 high: 96.89,
//                 low: 92.65,
//                 close: 93.4),
//             ChartSampleData(
//                 x: DateTime(2016, 06, 27),
//                 open: 93,
//                 high: 96.465,
//                 low: 91.5,
//                 close: 95.89),
//             ChartSampleData(
//                 x: DateTime(2016, 07, 04),
//                 open: 95.39,
//                 high: 96.89,
//                 low: 94.37,
//                 close: 96.68),
//             ChartSampleData(
//                 x: DateTime(2016, 07, 11),
//                 open: 96.75,
//                 high: 99.3,
//                 low: 96.73,
//                 close: 98.78),
//             ChartSampleData(
//                 x: DateTime(2016, 07, 18),
//                 open: 98.7,
//                 high: 101,
//                 low: 98.31,
//                 close: 98.66),
//             ChartSampleData(
//                 x: DateTime(2016, 07, 25),
//                 open: 98.25,
//                 high: 104.55,
//                 low: 96.42,
//                 close: 104.21),
//             ChartSampleData(
//                 x: DateTime(2016, 08),
//                 open: 104.41,
//                 high: 107.65,
//                 low: 104,
//                 close: 107.48),
//             ChartSampleData(
//                 x: DateTime(2016, 08, 08),
//                 open: 107.52,
//                 high: 108.94,
//                 low: 107.16,
//                 close: 108.18),
//             ChartSampleData(
//                 x: DateTime(2016, 08, 15),
//                 open: 108.14,
//                 high: 110.23,
//                 low: 108.08,
//                 close: 109.36),
//             ChartSampleData(
//                 x: DateTime(2016, 08, 22),
//                 open: 108.86,
//                 high: 109.32,
//                 low: 106.31,
//                 close: 106.94),
//             ChartSampleData(
//                 x: DateTime(2016, 08, 29),
//                 open: 109.74,
//                 high: 109.74,
//                 low: 109.74,
//                 close: 109.74),
//             ChartSampleData(
//                 x: DateTime(2016, 09, 05),
//                 open: 107.9,
//                 high: 108.76,
//                 low: 103.13,
//                 close: 103.13),
//             ChartSampleData(
//                 x: DateTime(2016, 09, 12),
//                 open: 102.65,
//                 high: 116.13,
//                 low: 102.53,
//                 close: 114.92),
//             ChartSampleData(
//                 x: DateTime(2016, 09, 19),
//                 open: 115.19,
//                 high: 116.18,
//                 low: 111.55,
//                 close: 112.71),
//             ChartSampleData(
//                 x: DateTime(2016, 09, 26),
//                 open: 111.64,
//                 high: 114.64,
//                 low: 111.55,
//                 close: 113.05),
//           ],
//           name: 'AAPL',
//           showIndicationForSameValues: isCardView ? true : _toggleVisibility,
//           xValueMapper: (ChartSampleData sales, _) => sales.x as DateTime,
//
//           /// High, low, open and close values used to render the candle series.
//           lowValueMapper: (ChartSampleData sales, _) => sales.low,
//           highValueMapper: (ChartSampleData sales, _) => sales.high,
//           openValueMapper: (ChartSampleData sales, _) => sales.open,
//           closeValueMapper: (ChartSampleData sales, _) => sales.close)
//     ];
// }
//
//
// class _ChartData {
//   _ChartData(this.x, this.y);
//   final String x;
//   final double y;
// }
