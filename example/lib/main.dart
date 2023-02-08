import 'dart:math';

import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  List ranking = [
    {'class': 'A', 'total': 23},
    {'class': 'B', 'total': 14},
    {'class': 'C', 'total': 8},
    {'class': 'D', 'total': 7},
    {'class': 'E', 'total': 21},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('D\'Chart')),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text('Bar Chart'),
              tileColor: Colors.green[200],
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartBar(
                  data: [
                    {
                      'id': 'Bar',
                      'data': [
                        {'domain': '2020', 'measure': 3},
                        {'domain': '2021', 'measure': 4},
                        {'domain': '2022', 'measure': 6},
                        {'domain': '2023', 'measure': 0.3},
                      ],
                    },
                  ],
                  domainLabelPaddingToAxisLine: 16,
                  axisLineTick: 2,
                  axisLinePointTick: 2,
                  axisLinePointWidth: 10,
                  axisLineColor: Colors.green,
                  measureLabelPaddingToAxisLine: 16,
                  barColor: (barData, index, id) => Colors.green,
                  showBarValue: true,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartBar(
                  data: [
                    {
                      'id': 'Bar',
                      'data': [
                        {'domain': '2020', 'measure': 3},
                        {'domain': '2021', 'measure': 4},
                        {'domain': '2022', 'measure': 6},
                        {'domain': '2023', 'measure': 1.3},
                      ],
                    },
                  ],
                  domainLabelPaddingToAxisLine: 16,
                  axisLineColor: Colors.green,
                  measureLabelPaddingToAxisLine: 16,
                  barColor: (barData, index, id) => Colors.green,
                  verticalDirection: false,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartBar(
                  data: [
                    {
                      'id': 'Bar',
                      'data': [
                        {'domain': '2020', 'measure': 3},
                        {'domain': '2021', 'measure': 4},
                        {'domain': '2022', 'measure': 6},
                        {'domain': '2023', 'measure': 0.3},
                      ],
                    },
                  ],
                  domainLabelPaddingToAxisLine: 16,
                  axisLineTick: 2,
                  axisLinePointTick: 2,
                  axisLinePointWidth: 8,
                  axisLineColor: Colors.green,
                  measureLabelPaddingToAxisLine: 16,
                  barColor: (barData, index, id) => barData['measure'] >= 4
                      ? Colors.green.shade300
                      : Colors.green.shade700,
                  barValue: (barData, index) => '${barData['measure']}',
                  showBarValue: true,
                  barValuePosition: BarValuePosition.auto,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartBar(
                  data: [
                    {
                      'id': 'Bar',
                      'data': [
                        {'domain': '2020', 'measure': 3},
                        {'domain': '2021', 'measure': 4},
                        {'domain': '2022', 'measure': 6},
                        {'domain': '2023', 'measure': 0.3},
                      ],
                    },
                  ],
                  yAxisTitle: 'Year',
                  xAxisTitle: 'Sale',
                  measureMin: 0,
                  measureMax: 7,
                  minimumPaddingBetweenLabel: 1,
                  domainLabelPaddingToAxisLine: 16,
                  axisLineTick: 2,
                  axisLinePointTick: 2,
                  axisLinePointWidth: 10,
                  axisLineColor: Colors.green,
                  measureLabelPaddingToAxisLine: 16,
                  verticalDirection: false,
                  barColor: (barData, index, id) => barData['measure'] >= 4
                      ? Colors.green.shade300
                      : Colors.green.shade700,
                  barValue: (barData, index) => '${barData['measure']}%',
                  showBarValue: true,
                  barValuePosition: BarValuePosition.outside,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartBar(
                  data: [
                    {
                      'id': 'Bar 1',
                      'data': [
                        {'domain': '2019', 'measure': 3},
                        {'domain': '2020', 'measure': 3},
                        {'domain': '2021', 'measure': 4},
                        {'domain': '2022', 'measure': 6},
                        {'domain': '2023', 'measure': 0.3},
                      ],
                    },
                    {
                      'id': 'Bar 2',
                      'data': [
                        {'domain': '2020', 'measure': 4},
                        {'domain': '2021', 'measure': 5},
                        {'domain': '2022', 'measure': 2},
                        {'domain': '2023', 'measure': 1},
                        {'domain': '2024', 'measure': 2.5},
                      ],
                    },
                  ],
                  yAxisTitle: 'Year',
                  xAxisTitle: 'Sale',
                  measureMin: 0,
                  measureMax: 8,
                  minimumPaddingBetweenLabel: 1,
                  domainLabelPaddingToAxisLine: 16,
                  axisLineTick: 2,
                  axisLinePointTick: 2,
                  axisLinePointWidth: 10,
                  axisLineColor: Colors.green,
                  measureLabelPaddingToAxisLine: 16,
                  barColor: (barData, index, id) => id == 'Bar 1'
                      ? Colors.green.shade300
                      : Colors.green.shade900,
                  barValue: (barData, index) => '${barData['measure']}%',
                  showBarValue: true,
                  barValuePosition: BarValuePosition.outside,
                  verticalDirection: false,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  RotatedBox(
                    quarterTurns: 1,
                    child: Text(
                      'Year',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: DChartBar(
                            data: [
                              {
                                'id': 'Bar 1',
                                'data': [
                                  {'domain': '2020', 'measure': 32},
                                  {'domain': '2021', 'measure': 43},
                                  {'domain': '2022', 'measure': 29},
                                  {'domain': '2023', 'measure': 16},
                                ],
                              },
                              {
                                'id': 'Bar 2',
                                'data': [
                                  {'domain': '2020', 'measure': 24},
                                  {'domain': '2021', 'measure': 42},
                                  {'domain': '2022', 'measure': 9},
                                  {'domain': '2023', 'measure': 37},
                                ],
                              },
                              {
                                'id': 'Bar 3',
                                'data': [
                                  {'domain': '2020', 'measure': 17},
                                  {'domain': '2021', 'measure': 28},
                                  {'domain': '2022', 'measure': 12},
                                  {'domain': '2023', 'measure': 30},
                                ],
                              },
                            ],
                            minimumPaddingBetweenLabel: 1,
                            domainLabelPaddingToAxisLine: 16,
                            axisLineTick: 2,
                            axisLinePointTick: 2,
                            axisLinePointWidth: 10,
                            axisLineColor: Colors.green,
                            measureLabelPaddingToAxisLine: 16,
                            barColor: (barData, index, id) => id == 'Bar 1'
                                ? Colors.green.shade300
                                : id == 'Bar 2'
                                    ? Colors.green.shade600
                                    : Colors.green.shade900,
                            barValue: (barData, index) =>
                                '${barData['measure']}',
                            showBarValue: true,
                            barValueFontSize: 12,
                            barValuePosition: BarValuePosition.outside,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            'Year',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            ListTile(
              title: Text('Line Chart'),
              tileColor: Colors.amber[200],
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartLine(
                  data: [
                    {
                      'id': 'Line',
                      'data': [
                        {'domain': 0, 'measure': 4.1},
                        {'domain': 2, 'measure': 4},
                        {'domain': 3, 'measure': 6},
                        {'domain': 4, 'measure': 1},
                      ],
                    },
                  ],
                  lineColor: (lineData, index, id) => Colors.amber,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartLine(
                  data: [
                    {
                      'id': 'Line',
                      'data': [
                        {'domain': 0, 'measure': 2.5},
                        {'domain': 2, 'measure': 4},
                        {'domain': 3, 'measure': 6},
                        {'domain': 4, 'measure': 1},
                      ],
                    },
                  ],
                  includePoints: true,
                  lineColor: (lineData, index, id) => Colors.amber,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  RotatedBox(quarterTurns: 3, child: Text('Quantity')),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: DChartLine(
                            lineColor: (lineData, index, id) {
                              return id == 'Line 1'
                                  ? Colors.blue
                                  : Colors.amber;
                            },
                            data: [
                              {
                                'id': 'Line 1',
                                'data': [
                                  {'domain': 1, 'measure': 3},
                                  {'domain': 2, 'measure': 3},
                                  {'domain': 3, 'measure': 4},
                                  {'domain': 4, 'measure': 6},
                                  {'domain': 5, 'measure': 0.3},
                                ],
                              },
                              {
                                'id': 'Line 2',
                                'data': [
                                  {'domain': 1, 'measure': 4},
                                  {'domain': 2, 'measure': 5},
                                  {'domain': 3, 'measure': 2},
                                  {'domain': 4, 'measure': 1},
                                  {'domain': 5, 'measure': 2.5},
                                ],
                              },
                            ],
                            includePoints: true,
                          ),
                        ),
                        Text('Day'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartLine(
                  lineColor: (lineData, index, id) {
                    return id == 'Line 1'
                        ? Colors.blue
                        : id == 'Line 2'
                            ? Colors.amber
                            : Colors.green;
                  },
                  pointColor: (lineData, index, id) {
                    return id == 'Line 1'
                        ? Colors.blue.shade900
                        : id == 'Line 2'
                            ? Colors.amber.shade900
                            : Colors.green.shade900;
                  },
                  data: [
                    {
                      'id': 'Line 1',
                      'data': [
                        {'domain': 0, 'measure': 0.5},
                        {'domain': 2, 'measure': 1},
                        {'domain': 3, 'measure': 3},
                        {'domain': 4, 'measure': 2.3},
                        {'domain': 5, 'measure': 3},
                      ],
                    },
                    {
                      'id': 'Line 2',
                      'data': [
                        {'domain': 1, 'measure': 4},
                        {'domain': 2, 'measure': 5},
                        {'domain': 3, 'measure': 4.5},
                        {'domain': 4, 'measure': 7},
                        {'domain': 5, 'measure': 8},
                      ],
                    },
                    {
                      'id': 'Line 3',
                      'data': [
                        {'domain': 1, 'measure': 8.2},
                        {'domain': 2, 'measure': 8},
                        {'domain': 3, 'measure': 9},
                        {'domain': 4, 'measure': 10},
                        {'domain': 5, 'measure': 12},
                      ],
                    },
                  ],
                  includePoints: true,
                  includeArea: true,
                ),
              ),
            ),
            ListTile(
              title: Text('Pie Chart'),
              tileColor: Colors.purple[200],
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartPie(
                  data: [
                    {'domain': 'Flutter', 'measure': 28},
                    {'domain': 'React Native', 'measure': 27},
                    {'domain': 'Ionic', 'measure': 20},
                    {'domain': 'Cordova', 'measure': 15},
                  ],
                  fillColor: (pieData, index) => Colors.purple,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartPie(
                  data: [
                    {'domain': 'Flutter', 'measure': 28},
                    {'domain': 'React Native', 'measure': 27},
                    {'domain': 'Ionic', 'measure': 20},
                    {'domain': 'Cordova', 'measure': 15},
                  ],
                  fillColor: (pieData, index) {
                    switch (pieData['domain']) {
                      case 'Flutter':
                        return Colors.blue;
                      case 'React Native':
                        return Colors.blueAccent;
                      case 'Ionic':
                        return Colors.lightBlue;
                      default:
                        return Colors.orange;
                    }
                  },
                  pieLabel: (pieData, index) {
                    return "${pieData['domain']}:\n${pieData['measure']}%";
                  },
                  labelPosition: PieLabelPosition.outside,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartPie(
                  data: [
                    {'domain': 'Flutter', 'measure': 28},
                    {'domain': 'React Native', 'measure': 27},
                    {'domain': 'Ionic', 'measure': 20},
                    {'domain': 'Cordova', 'measure': 15},
                  ],
                  fillColor: (pieData, index) {
                    switch (pieData['domain']) {
                      case 'Flutter':
                        return Colors.purple.shade300;
                      case 'React Native':
                        return Colors.purple.shade500;
                      case 'Ionic':
                        return Colors.purple.shade700;
                      default:
                        return Colors.purple.shade900;
                    }
                  },
                  pieLabel: (pieData, index) {
                    return "${pieData['measure']}%";
                  },
                  labelPosition: PieLabelPosition.auto,
                  labelColor: Colors.white,
                  labelFontSize: 14,
                  labelLineColor: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartPie(
                  data: [
                    {'domain': 'Flutter', 'measure': 28},
                    {'domain': 'React Native', 'measure': 27},
                    {'domain': 'Ionic', 'measure': 20},
                    {'domain': 'Cordova', 'measure': 15},
                  ],
                  fillColor: (pieData, index) {
                    switch (pieData['domain']) {
                      case 'Flutter':
                        return Colors.purple.shade300;
                      case 'React Native':
                        return Colors.purple.shade500;
                      case 'Ionic':
                        return Colors.purple.shade700;
                      default:
                        return Colors.purple.shade900;
                    }
                  },
                  pieLabel: (pieData, index) {
                    return "${pieData['measure']}%";
                  },
                  labelPosition: PieLabelPosition.outside,
                  labelColor: Colors.deepPurple,
                  labelFontSize: 14,
                  labelLineColor: Colors.purple.shade200,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Stack(
                  children: [
                    DChartPie(
                      data: [
                        {'domain': 'Flutter', 'measure': 28},
                        {'domain': 'React Native', 'measure': 27},
                        {'domain': 'Ionic', 'measure': 20},
                        {'domain': 'Cordova', 'measure': 15},
                      ],
                      fillColor: (pieData, index) => Colors.purple,
                      donutWidth: 30,
                      labelColor: Colors.white,
                    ),
                    Align(child: Text('Framework')),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartPie(
                  data: [
                    {'domain': 'Flutter', 'measure': 28},
                    {'domain': 'React Native', 'measure': 27},
                    {'domain': 'Ionic', 'measure': 20},
                    {'domain': 'Cordova', 'measure': 15},
                  ],
                  fillColor: (pieData, index) {
                    switch (pieData['domain']) {
                      case 'Flutter':
                        return Colors.blue;
                      case 'React Native':
                        return Colors.blueAccent;
                      case 'Ionic':
                        return Colors.lightBlue;
                      default:
                        return Colors.orange;
                    }
                  },
                  pieLabel: (pieData, index) {
                    return "${pieData['domain']}:\n${pieData['measure']}%";
                  },
                  labelPosition: PieLabelPosition.outside,
                  donutWidth: 20,
                ),
              ),
            ),
            ListTile(
              title: Text('Gauge Chart'),
              tileColor: Colors.blue[200],
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartGauge(
                  data: [
                    {'domain': 'Flutter', 'measure': 28},
                    {'domain': 'React Native', 'measure': 27},
                    {'domain': 'Ionic', 'measure': 20},
                    {'domain': 'Cordova', 'measure': 15},
                  ],
                  fillColor: (pieData, index) => Colors.blue,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartGauge(
                  data: [
                    {'domain': 'Off', 'measure': 30},
                    {'domain': 'Warm', 'measure': 30},
                    {'domain': 'Hot', 'measure': 30},
                  ],
                  fillColor: (pieData, index) {
                    switch (pieData['domain']) {
                      case 'Off':
                        return Colors.green;
                      case 'Warm':
                        return Colors.orange;
                      default:
                        return Colors.red;
                    }
                  },
                  showLabelLine: false,
                  pieLabel: (pieData, index) {
                    return "${pieData['domain']}";
                  },
                  labelPosition: PieLabelPosition.inside,
                  labelPadding: 0,
                  labelColor: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Stack(
                  children: [
                    DChartGauge(
                      data: [
                        {'domain': 'OFF', 'measure': 1},
                        {'domain': 'N', 'measure': 1},
                        {'domain': '1', 'measure': 1},
                        {'domain': '2', 'measure': 1},
                        {'domain': '3', 'measure': 1},
                        {'domain': '4', 'measure': 1},
                        {'domain': '5', 'measure': 1},
                      ],
                      fillColor: (pieData, index) {
                        switch (pieData['domain']) {
                          case 'Off':
                            return Colors.grey.shade700;
                          case 'N':
                            return Colors.green.shade900;
                          case '3':
                            return Colors.orangeAccent;
                          default:
                            return Colors.grey[300];
                        }
                      },
                      showLabelLine: false,
                      pieLabel: (pieData, index) {
                        return "${pieData['domain']}";
                      },
                      labelPosition: PieLabelPosition.inside,
                      labelPadding: 0,
                      labelColor: Colors.white,
                    ),
                    Align(child: Text('Gassss')),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: DChartBarCustom(
                loadingDuration: const Duration(milliseconds: 1500),
                showLoading: true,
                valueAlign: Alignment.topCenter,
                showDomainLine: true,
                showDomainLabel: true,
                showMeasureLine: true,
                showMeasureLabel: true,
                spaceDomainLabeltoChart: 10,
                spaceMeasureLabeltoChart: 5,
                spaceDomainLinetoChart: 15,
                spaceMeasureLinetoChart: 20,
                spaceBetweenItem: 16,
                radiusBar: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                measureLabelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.purple,
                ),
                domainLabelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.purple,
                ),
                measureLineStyle:
                    const BorderSide(color: Colors.amber, width: 2),
                domainLineStyle: const BorderSide(color: Colors.red, width: 2),
                max: 25,
                listData: List.generate(ranking.length, (index) {
                  Color currentColor =
                      Color((Random().nextDouble() * 0xFFFFFF).toInt());
                  return DChartBarDataCustom(
                    onTap: () {
                      print(
                        '${ranking[index]['class']} => ${ranking[index]['total']}',
                      );
                    },
                    elevation: 8,
                    value: ranking[index]['total'].toDouble(),
                    label: ranking[index]['class'],
                    color: currentColor.withOpacity(1),
                    splashColor: Colors.blue,
                    showValue: ranking[index]['class'] == 'C' ? false : true,
                    valueStyle: ranking[index]['class'] == 'A'
                        ? const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          )
                        : const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                    labelCustom: ranking[index]['class'] == 'B'
                        ? Transform.rotate(
                            angle: 5.5,
                            child: const Text('Bagus'),
                          )
                        : null,
                    valueCustom: ranking[index]['total'] > 20
                        ? Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 2),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    '${ranking[index]['total']}',
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: Colors.red,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                                const Text(
                                  '😄',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          )
                        : null,
                    valueTooltip: '${ranking[index]['total']} Student',
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// call this to test example [DChartTime]
class DChartTimeExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DChart Time Example')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          AspectRatio(
            aspectRatio: 3,
            child: DChartTime(
              fillColor: (group, data, index) => Colors.transparent,
              measureLabel: (value) => '${value}k',
              // use format intl package to custom view datetime string
              // domainLabel: (dateTime) =>
              //     DateFormat('d MMM yy').format(dateTime!),
              domainLabelStyle: const TextStyle(color: Colors.purple),
              domainLineColor: Colors.grey[800],
              chartRender: DRenderPoint(),
              groupData: [
                DChartTimeGroup(
                  groupId: 'Keyboard',
                  groupColor: Colors.blue,
                  data: [
                    DChartTimeData(time: DateTime(2023, 2, 1), value: 29),
                    DChartTimeData(time: DateTime(2023, 2, 2), value: 73),
                    DChartTimeData(time: DateTime(2023, 2, 4), value: 23),
                    DChartTimeData(time: DateTime(2023, 2, 8), value: 56),
                    DChartTimeData(time: DateTime(2023, 2, 9), value: 32),
                    DChartTimeData(time: DateTime(2023, 2, 10), value: 21),
                    DChartTimeData(time: DateTime(2023, 2, 12), value: 76),
                    DChartTimeData(time: DateTime(2023, 2, 18), value: 91),
                    DChartTimeData(time: DateTime(2023, 2, 20), value: 17),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          AspectRatio(
            aspectRatio: 3,
            child: DChartTime(
              chartRender: DRenderTargetLine(),
              groupData: [
                DChartTimeGroup(
                  groupId: 'Keyboard',
                  groupColor: Colors.blue,
                  data: [
                    DChartTimeData(
                        time: DateTime(2023, 2, 1), value: 29, x: 'k'),
                    DChartTimeData(
                        time: DateTime(2023, 2, 2), value: 73, x: 'm'),
                    DChartTimeData(time: DateTime(2023, 2, 4), value: 54),
                  ],
                ),
                DChartTimeGroup(
                  groupId: 'Monitor',
                  groupColor: Colors.amber,
                  data: [
                    DChartTimeData(time: DateTime(2023, 2, 1), value: 15),
                    DChartTimeData(time: DateTime(2023, 2, 2), value: 30),
                    DChartTimeData(time: DateTime(2023, 2, 4), value: 50),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          AspectRatio(
            aspectRatio: 3,
            child: DChartTime(
              chartRender: DRenderBar(
                // borderWidth: 10,
                barRadius: 8,
                labelSpace: 10,
                insideLabelStyle: const TextStyle(color: Colors.yellow),
                outsideLabelStyle: const TextStyle(color: Colors.purple),
                labelAlign: RBLabelAlign.end,
              ),
              // customLabelValue: (group, data, index) {
              //   String unit =
              //       data.x != null && data.x is String ? data.x.toString() : '';
              //   return '${DateFormat('d MMM').format(data.time)} :\n${data.value}$unit';
              // },
              groupData: [
                DChartTimeGroup(
                  groupId: 'Keyboard',
                  groupColor: Colors.blue,
                  data: [
                    DChartTimeData(
                        time: DateTime(2023, 2, 1), value: 29, x: 'k'),
                    DChartTimeData(
                        time: DateTime(2023, 2, 3, 5), value: 73, x: 'm'),
                    DChartTimeData(time: DateTime(2023, 2, 4), value: 54),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          AspectRatio(
            aspectRatio: 3,
            child: DChartTime(
              chartRender: DRenderBar(
                // borderWidth: 10,
                barRadius: 16,
                labelSpace: 10,
                groupType: RBGroupType.stacked,
              ),
              groupData: [
                DChartTimeGroup(
                  groupId: 'Keyboard',
                  groupColor: Colors.blue,
                  data: [
                    DChartTimeData(time: DateTime(2023, 2, 1), value: 29),
                    DChartTimeData(time: DateTime(2023, 2, 3, 5), value: 73),
                    DChartTimeData(time: DateTime(2023, 2, 4), value: 54),
                  ],
                ),
                DChartTimeGroup(
                  groupId: 'Monitor',
                  groupColor: Colors.amber,
                  data: [
                    DChartTimeData(time: DateTime(2023, 2, 1), value: 15),
                    DChartTimeData(time: DateTime(2023, 2, 1, 5), value: 30),
                    DChartTimeData(time: DateTime(2023, 2, 3), value: 50),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          AspectRatio(
            aspectRatio: 3,
            child: DChartTime(
              chartRender: DRenderLine(
                showArea: true,
                showPoint: true,
                strokeWidth: 1.5,
                pointSize: 5,
              ),
              groupData: [
                DChartTimeGroup(
                  groupId: 'Keyboard',
                  groupColor: Colors.blue,
                  data: [
                    DChartTimeData(time: DateTime(2023, 2, 1), value: 29),
                    DChartTimeData(time: DateTime(2023, 2, 3, 5), value: 73),
                    DChartTimeData(time: DateTime(2023, 2, 4), value: 54),
                  ],
                ),
                DChartTimeGroup(
                  groupId: 'Monitor',
                  groupColor: Colors.purple,
                  data: [
                    DChartTimeData(time: DateTime(2023, 2, 1), value: 15),
                    DChartTimeData(time: DateTime(2023, 2, 1, 5), value: 30),
                    DChartTimeData(time: DateTime(2023, 2, 3), value: 50),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: DChartTime(
              showLegend: true,
              legendJustify: DJustify.end,
              legendPosition: DBehaviorPosition.top,
              legendMaxColumn: 3,
              legendHorizontally: true,
              legendMeasure: (value) {
                if (value == null) return '-';
                return value.toString();
              },

              // legendTitle: (group) => group.groupId,
              startDate: DateTime(2023, 1, 30),
              endDate: DateTime(2023, 2, 6),
              startFromZero: false,
              title: 'Title Chart',
              subtitle: 'subtitle',
              measureLineColor: Colors.purple,
              measureLineThickness: 1,
              measureLabelStyle: const TextStyle(
                color: Colors.green,
                fontSize: 11,
              ),
              domainLineColor: Colors.pink,
              domainLineThickness: 1,
              domainLabelStyle: const TextStyle(
                color: Colors.green,
                fontSize: 14,
              ),
              titleJustify: DJustify.startDrawArea,
              titlePosition: DBehaviorPosition.top,
              innerPadding: 20,
              outerPadding: 0,
              changedListener: (groupId, data) {
                // from package d_method to check on console
                // DMethod.printTitle(
                //   '$groupId : ${data.time.toIso8601String()}',
                //   data.value.toString(),
                // );
              },
              titleStyle: const TextStyle(
                color: Colors.blue,
                fontSize: 16,
                height: 1,
              ),
              subtitleStyle: const TextStyle(
                color: Colors.purple,
                fontSize: 12,
                height: 1,
              ),
              titlePadding: 4,
              groupData: [
                DChartTimeGroup(
                  groupId: 'Keyboard',
                  groupColor: Colors.blue,
                  data: [
                    DChartTimeData(time: DateTime(2023, 2, 1), value: 29),
                    DChartTimeData(time: DateTime(2023, 2, 3, 5), value: 73),
                    DChartTimeData(time: DateTime(2023, 2, 4), value: 54),
                  ],
                ),
                DChartTimeGroup(
                  groupId: 'Monitor',
                  groupColor: Colors.amber,
                  data: [
                    DChartTimeData(time: DateTime(2023, 2, 1), value: 15),
                    DChartTimeData(time: DateTime(2023, 2, 1, 5), value: 30),
                    DChartTimeData(time: DateTime(2023, 2, 3), value: 24),
                  ],
                ),
                DChartTimeGroup(
                  groupId: 'Speaker',
                  groupColor: Colors.green,
                  data: [
                    DChartTimeData(time: DateTime(2023, 2, 1), value: 2),
                    DChartTimeData(time: DateTime(2023, 2, 2, 5), value: 8),
                    DChartTimeData(time: DateTime(2023, 2, 4), value: 30),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
