import 'package:community_charts_common/community_charts_common.dart' as common;
import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';

import '../commons/axis/axis.dart';
import '../commons/config_render/config_render.dart';
import '../commons/config_series/config_series.dart';
import '../commons/constants.dart';
import '../commons/data_model/model.dart';
import '../commons/enums.dart';
import '../commons/layout_margin.dart';

/// Numeric Combo Chart\
/// also can use for single other type but cannot be set horizontal measure
/// - only bar
/// - only line
/// - only scatter plot
class DChartComboN extends StatelessWidget {
  /// group
  final List<NumericGroup> groupList;

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

  /// style line
  final ConfigRenderLineN configRenderLine;

  /// style bar
  final ConfigRenderBarN configRenderBar;

  /// style plot point
  final ConfigRenderPointN configRenderPoint;

  /// customize domain axis
  final DomainAxisN? domainAxis;

  /// customize measure axis
  final MeasureAxis? measureAxis;

  /// customize secondary measure axis
  final MeasureAxis? secondaryMeasureAxis;

  /// margin from outer chart to wrapper box\
  /// default: 20px for each side
  final LayoutMargin? layoutMargin;

  /// give user access to slide chart viewport\
  /// set initial viewport in domainAxis\
  /// if set true, this will affect to 'measure viewport'.
  /// measure viewport will auto adjust depend on min/max from item chart value\
  /// To fix this, set viewport in [measueAxis]\
  /// default: false
  final bool allowSliding;

  /// listen which data is selected
  final void Function(NumericData data)? onUpdatedListener;

  /// listen which data is changed selected
  final void Function(NumericData data)? onChangedListener;

  /// Numeric Combo Chart\
  /// also can use for single other type but cannot be set horizontal measure
  /// - only bar
  /// - only line
  /// - only scatter plot
  const DChartComboN({
    super.key,
    required this.groupList,
    this.animate = false,
    this.configSeries = const ConfigSeriesN(),
    this.configRenderLine = const ConfigRenderLineN(),
    this.configRenderBar = const ConfigRenderBarN(),
    this.configRenderPoint = const ConfigRenderPointN(),
    this.animationDuration = const Duration(milliseconds: 300),
    this.domainAxis,
    this.measureAxis,
    this.secondaryMeasureAxis,
    this.layoutMargin,
    this.allowSliding = false,
    this.onUpdatedListener,
    this.onChangedListener,
  });

  @override
  Widget build(BuildContext context) {
    return charts.NumericComboChart(
      List.generate(groupList.length, (indexGroup) {
        NumericGroup group = groupList[indexGroup];
        final chartSeries = configSeries.getRender(group, configSeries)
          ..setAttribute(charts.rendererIdKey, group.chartType.name);
        if (group.useSecondaryMeasureAxis) {
          return chartSeries
            ..setAttribute(
              common.measureAxisIdKey,
              Constants.secondaryMeasureAxisId,
            );
        }
        return chartSeries;
      }),
      defaultInteractions: false,
      animate: animate,
      animationDuration: animationDuration,
      defaultRenderer: common.LineRendererConfig(),
      customSeriesRenderers: [
        configRenderBar.getRender(ChartType.bar.name),
        configRenderLine.getRender(ChartType.line.name),
        configRenderPoint.getRender(ChartType.scatterPlot.name),
      ],
      domainAxis: domainAxis?.axisSpec(),
      primaryMeasureAxis: measureAxis?.axisSpec(),
      secondaryMeasureAxis: secondaryMeasureAxis?.axisSpec(),
      layoutConfig: layoutMargin?.getRender() ?? LayoutMargin.defaultRender,
      behaviors: [
        if (allowSliding) charts.SlidingViewport(),
        if (allowSliding) charts.PanAndZoomBehavior(),
      ],
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
