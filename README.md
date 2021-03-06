# d_chart

D'Chart is a package for compact chart widgets. This package is a remake of the charts_flutter package. The remake chart types include bar, line, pie, donut and gauge. The use of this package is made as concise as possible, but with the best chart display.

## Usage

1. Bar

<img src="https://github.com/indratrisnar/d_chart/raw/master/pic/dchart_bar1.jpg" alt="dchart_bar1" height="540">
<img src="https://github.com/indratrisnar/d_chart/raw/master/pic/dchart_bar2.jpg" alt="dchart_bar2" height="540">
<img src="https://github.com/indratrisnar/d_chart/raw/master/pic/dchart_bar3.jpg" alt="dchart_bar3" height="540">

```dart
DChartBar(
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
```
<hr>

2. Line

<img src="https://github.com/indratrisnar/d_chart/raw/master/pic/dchart_line1.jpg" alt="dchart_line1" height="540">
<img src="https://github.com/indratrisnar/d_chart/raw/master/pic/dchart_line2.jpg" alt="dchart_line2" height="540">

```dart
DChartLine(
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
```
<hr>

3. Pie & Donut

<img src="https://github.com/indratrisnar/d_chart/raw/master/pic/dchart_pie1.jpg" alt="dchart_pie1" height="540">
<img src="https://github.com/indratrisnar/d_chart/raw/master/pic/dchart_pie2.jpg" alt="dchart_pie2" height="540">

```dart
DChartPie(
    data: [
        {'domain': 'Flutter', 'measure': 28},
        {'domain': 'React Native', 'measure': 27},
        {'domain': 'Ionic', 'measure': 20},
        {'domain': 'Cordova', 'measure': 15},
    ],
    fillColor: (pieData, index) => Colors.purple,
),

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
```
<hr>

4. Gauge

<img src="https://github.com/indratrisnar/d_chart/raw/master/pic/dchart_gauge.jpg" alt="dchart_gauge" height="540">

```dart
DChartGauge(
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
```
<hr>

Tutorial :
[All Chart](https://www.youtube.com/watch?v=pw1GEJl7edU&list=PLMeCG4xYek-NxSGp2i2mINmeM7k1Rzj4U&index=2)
[Line Chart From Data Collection](https://www.youtube.com/watch?v=mdMayNHY7so&list=PLMeCG4xYek-OdumjOowVcNmW_nVPPUVfa&index=7)

Support me for more feature & packages
[Donate](https://www.paypal.com/paypalme/indratrisnar)

Check my app : [Visit](https://indratrisnar.github.io/projects.html)

Check My Tutorial & Course : [Watch](https://www.youtube.com/channel/UC0d_xINEvCtlDCpWfBpnYpA)