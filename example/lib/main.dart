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
          ],
        ),
      ),
    );
  }
}
