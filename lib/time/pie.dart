import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';

import '../commons/config_render/config_render.dart';
import '../commons/config_series/config_series.dart';
import '../commons/data_model/model.dart';

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

  /// setup config for entire series in chart widget,
  ///
  /// but also can be set dynamically according data point
  final ConfigSeriesT configSeries;

  /// style pie
  final ConfigRenderPieT configRenderPie;

  /// listen which data is selected
  final void Function(TimeData data)? onUpdatedListener;

  /// listen which data is changed selected
  final void Function(TimeData data)? onChangedListener;

  /// Time Pie Chart
  const DChartPieT({
    super.key,
    required this.data,
    this.animate = false,
    this.configSeries = const ConfigSeriesT(),
    this.configRenderPie = const ConfigRenderPieT(),
    this.animationDuration = const Duration(milliseconds: 300),
    this.onUpdatedListener,
    this.onChangedListener,
  });

  @override
  Widget build(BuildContext context) {
    return charts.PieChart<DateTime>(
      [
        configSeries.getRender(
          TimeGroup(id: 'DChartPieT', data: data),
          configSeries,
        ),
      ],
      defaultInteractions: false,
      animate: animate,
      animationDuration: animationDuration,
      defaultRenderer: configRenderPie.getRender(),
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
