import 'dart:math';

import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';

import '../commons/config_render.dart';
import '../commons/data_model.dart';
import '../commons/method_common.dart';
import '../commons/method_type.dart';

/// Ordinal Pie Chart\
class DChartPieO extends StatelessWidget {
  /// data
  final List<OrdinalData> data;

  /// animate chart when build\
  /// default: false
  final bool animate;

  /// duration animate a chart when build\
  /// default: `Duration(milliseconds: 300)`
  final Duration animationDuration;

  /// style pie
  final ConfigRenderPie? configRenderPie;

  /// customize label view data
  final CustomLabelO? customLabel;

  /// Ordinal Pie Chart
  const DChartPieO({
    super.key,
    required this.data,
    this.animate = false,
    this.configRenderPie = const ConfigRenderPie(),
    this.animationDuration = const Duration(milliseconds: 300),
    this.customLabel,
  });

  @override
  Widget build(BuildContext context) {
    return charts.PieChart<String>(
      [
        charts.Series<OrdinalData, String>(
          id: 'DChartPieO',
          data: data,
          domainFn: (datum, index) => datum.domain,
          measureFn: (datum, index) => datum.measure,
          colorFn: (datum, index) => MethodCommon.chartColor(datum.color ??
              Colors.primaries[Random().nextInt(Colors.primaries.length)]),
          labelAccessorFn: customLabel == null
              ? null
              : (datum, index) => customLabel!(datum, index),
        ),
      ],
      animate: animate,
      animationDuration: animationDuration,
      defaultRenderer: configRenderPie?.getRenderOrdinal(),
    );
  }
}
