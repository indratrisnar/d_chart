import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';

import '../commons/config_render/config_render.dart';
import '../commons/config_series/config_series.dart';
import '../commons/data_model/model.dart';

/// Numeric Pie Chart\
class DChartPieN extends StatelessWidget {
  /// data
  final List<NumericData> data;

  /// animate chart when build\
  /// default: false
  final bool animate;

  /// duration animate a chart when build\
  /// default: `Duration(milliseconds: 300)`
  final Duration animationDuration;

  /// setup config for entire series in chart widget,
  ///
  /// but also can be set dynamically according data point
  final ConfigSeriesN configSeries;

  /// style pie
  final ConfigRenderPieN configRenderPie;

  /// listen which data is selected
  final void Function(NumericData data)? onUpdatedListener;

  /// listen which data is changed selected
  final void Function(NumericData data)? onChangedListener;

  /// Numeric Pie Chart
  const DChartPieN({
    super.key,
    required this.data,
    this.animate = false,
    this.configSeries = const ConfigSeriesN(),
    this.configRenderPie = const ConfigRenderPieN(),
    this.animationDuration = const Duration(milliseconds: 300),
    this.onUpdatedListener,
    this.onChangedListener,
  });

  @override
  Widget build(BuildContext context) {
    return charts.PieChart<num>(
      [
        configSeries.getRender(
          NumericGroup(id: 'DChartPieN', data: data),
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
