import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/ordinal/bar.dart';
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
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: DChartBarO(
              groupList: [
                OrdinalGroup(
                  id: '1',
                  data: [
                    OrdinalData(domain: 'Mon', measure: 2),
                    OrdinalData(domain: 'Tue', measure: 6),
                    OrdinalData(domain: 'Wed', measure: 3),
                    OrdinalData(domain: 'Thu', measure: 7),
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
