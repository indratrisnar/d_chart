import 'dart:math';

import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';

import '../commons/config_render.dart';
import '../commons/data_model.dart';
import '../commons/method_common.dart';
import '../commons/method_type.dart';

/// Time Pie Chart\
class DChartPieT extends StatelessWidget {
  /// data
  final List<TimeData> data;

  /// animate chart when build\
  /// default: false
  final bool animate;

  /// duration animate a chart when build\
  /// default: `Duration(milliseconds: 300)`
  final Duration animationDuration;

  /// style pie
  final ConfigRenderPie? configRenderPie;

  /// customize label view data
  final CustomLabelT? customLabel;

  /// listen which data is selected
  final void Function(TimeData data)? onUpdatedListener;

  /// listen which data is changed selected
  final void Function(TimeData data)? onChangedListener;

  /// Time Pie Chart
  const DChartPieT({
    super.key,
    required this.data,
    this.animate = false,
    this.configRenderPie = const ConfigRenderPie(),
    this.animationDuration = const Duration(milliseconds: 300),
    this.customLabel,
    this.onUpdatedListener,
    this.onChangedListener,
  });

  @override
  Widget build(BuildContext context) {
    return charts.PieChart<DateTime>(
      [
        charts.Series<TimeData, DateTime>(
          id: 'DChartPieT',
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
      defaultRenderer: configRenderPie?.getRenderTime(),
      selectionModels: [
        charts.SelectionModelConfig(
          updatedListener: onUpdatedListener == null
              ? null
              : (model) {
                  if (model.hasDatumSelection) {
                    onUpdatedListener!(model.selectedDatum.first.datum);
                  }
                },
          changedListener: onChangedListener == null
              ? null
              : (model) {
                  if (model.hasDatumSelection) {
                    onChangedListener!(model.selectedDatum.first.datum);
                  }
                },
        ),
      ],
    );
  }
}
