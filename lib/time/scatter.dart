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

/// Time Scatter Chart\
class DChartScatterT extends StatelessWidget {
  /// group
  final List<TimeGroup> groupList;

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

  /// style bar
  final ConfigRenderPointT configRenderPoint;

  /// customize domain axis
  final DomainAxisT? domainAxis;

  /// customize measure axis
  final MeasureAxis? measureAxis;

  /// customize secondary measure axis
  final MeasureAxis? secondaryMeasureAxis;

  /// when `vertical` is true, chart will be flip\
  /// sort reversed measure axis/
  /// default: false
  final bool? flipVertical;

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
  final void Function(TimeData data)? onUpdatedListener;

  /// listen which data is changed selected
  final void Function(TimeData data)? onChangedListener;

  /// Time Scatter Chart
  const DChartScatterT({
    super.key,
    required this.groupList,
    this.animate = false,
    this.configSeries = const ConfigSeriesT(),
    this.configRenderPoint = const ConfigRenderPointT(),
    this.animationDuration = const Duration(milliseconds: 300),
    this.domainAxis,
    this.measureAxis,
    this.secondaryMeasureAxis,
    this.flipVertical = false,
    this.layoutMargin,
    this.allowSliding = false,
    this.onUpdatedListener,
    this.onChangedListener,
  });

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      List.generate(groupList.length, (indexGroup) {
        TimeGroup group = groupList[indexGroup];
        final chartSeries = configSeries.getRender(group, configSeries);
        if (group.useSecondaryMeasureAxis) {
          return chartSeries
            ..setAttribute(
                common.measureAxisIdKey, Constants.secondaryMeasureAxisId);
        }
        return chartSeries;
      }),
      flipVerticalAxis: flipVertical,
      defaultInteractions: false,
      animate: animate,
      animationDuration: animationDuration,
      defaultRenderer: configRenderPoint.getRender(ChartType.scatterPlot.name),
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
