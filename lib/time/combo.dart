import 'dart:math';

import 'package:community_charts_common/community_charts_common.dart' as common;
import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';

import '../commons/axis/axis.dart';
import '../commons/config_render/config_render.dart';
import '../commons/constants.dart';
import '../commons/data_model/data_model.dart';
import '../commons/enums.dart';
import '../commons/layout_margin.dart';
import '../commons/method_common.dart';
import '../commons/method_type.dart';

/// Numeric Combo Chart\
/// also can use for single other type but cannot be set horizontal measure
/// - only bar
/// - only line
/// - only scatter plot
class DChartComboT extends StatelessWidget {
  /// group
  final List<TimeGroup> groupList;

  /// animate chart when build\
  /// default: false
  final bool animate;

  /// duration animate a chart when build\
  /// default: `Duration(milliseconds: 300)`
  final Duration animationDuration;

  /// style line
  final ConfigRenderLine configRenderLine;

  /// style bar
  final ConfigRenderBar configRenderBar;

  /// style plot point
  final ConfigRenderPoint configRenderPoint;

  /// customize domain axis
  final DomainAxis? domainAxis;

  /// customize measure axis
  final MeasureAxis? measureAxis;

  /// customize secondary measure axis
  final MeasureAxis? secondaryMeasureAxis;

  /// `areaColor` returns the area color for a given data value.\
  /// If not provided, then group color will be used 10% opacity by default.\
  /// Specify for Line type\
  /// to activate custom areaColor, `ConfigRenderLine -> includeArea` must be `true`
  final AreaColorT? areaColor;

  /// set fill chart where has fill box like bar\
  /// default: based on Group color
  final FillColorT? fillColor;

  /// custom fill pattern\
  /// default: solid
  final FillPatternT? fillPattern;

  /// set pattern\
  /// specify for line pattern
  final DashPatternT? dashPattern;

  /// set custom format value for label bar
  final String Function(TimeGroup group, TimeData data, int? index)?
      barLabelValue;

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

  /// Numeric Combo Chart\
  /// also can use for single other type but cannot be set horizontal measure
  /// - only bar
  /// - only line
  /// - only scatter plot
  const DChartComboT({
    super.key,
    required this.groupList,
    this.animate = false,
    this.configRenderLine = const ConfigRenderLine(),
    this.configRenderBar = const ConfigRenderBar(),
    this.configRenderPoint = const ConfigRenderPoint(),
    this.animationDuration = const Duration(milliseconds: 300),
    this.domainAxis,
    this.measureAxis,
    this.secondaryMeasureAxis,
    this.areaColor,
    this.fillPattern,
    this.fillColor,
    this.dashPattern,
    this.barLabelValue,
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
        Color groupColor = group.color ??
            Colors.primaries[Random().nextInt(Colors.primaries.length)];
        final chartSeries = charts.Series<TimeData, DateTime>(
          id: group.id,
          data: group.data,
          seriesCategory: group.seriesCategory,
          domainFn: (datum, index) => datum.domain,
          domainLowerBoundFn: (datum, index) => datum.domainLowerBound,
          domainUpperBoundFn: (datum, index) => datum.domainUpperBound,
          measureFn: (datum, index) => datum.measure,
          measureLowerBoundFn: (datum, index) => datum.measureLowerBound,
          measureUpperBoundFn: (datum, index) => datum.measureUpperBound,
          colorFn: (datum, index) => MethodCommon.chartColor(groupColor),
          areaColorFn: areaColor == null
              ? null
              : (datum, index) {
                  return MethodCommon.chartColor(
                    areaColor!(group, datum, index) ?? groupColor,
                  );
                },
          fillColorFn: fillColor == null
              ? null
              : (datum, index) {
                  return MethodCommon.chartColor(
                    fillColor!(group, datum, index) ?? groupColor,
                  );
                },
          fillPatternFn: fillPattern == null
              ? null
              : (datum, index) {
                  return MethodCommon.fillPattern(
                    fillPattern!(group, datum, index),
                  );
                },
          dashPatternFn: dashPattern == null
              ? null
              : (datum, index) {
                  return dashPattern!(group, datum, index);
                },
          labelAccessorFn: barLabelValue == null
              ? null
              : (datum, index) => barLabelValue!(group, datum, index),
        )..setAttribute(charts.rendererIdKey, group.chartType.name);

        if (group.useSecondaryMeasureAxis) {
          return chartSeries
            ..setAttribute(
                common.measureAxisIdKey, Constants.secondaryMeasureAxisId);
        }
        return chartSeries;
      }),
      animate: animate,
      flipVerticalAxis: flipVertical,
      animationDuration: animationDuration,
      defaultRenderer: common.LineRendererConfig(),
      customSeriesRenderers: [
        configRenderBar.getRenderTime(ChartType.bar.name),
        configRenderLine.getRenderTime(ChartType.line.name),
        configRenderPoint.getRenderTime(ChartType.scatterPlot.name),
      ],
      domainAxis: domainAxis == null
          ? null
          : common.DateTimeAxisSpec(
              viewport: domainAxis?.timeViewport?.getRender(),
              renderSpec: domainAxis?.noRenderSpec ?? false
                  ? common.NoneRenderSpec(
                      axisLineStyle: domainAxis?.lineStyle.getRender(),
                    )
                  : domainAxis!.useGridLine
                      ? common.GridlineRendererSpec(
                          axisLineStyle: domainAxis?.lineStyle.getRender(),
                          lineStyle: domainAxis?.gridLineStyle.getRender(),
                          labelRotation: domainAxis?.labelRotation ?? 0,
                          labelStyle: domainAxis?.labelStyle.getRender(),
                          labelOffsetFromAxisPx: domainAxis?.gapAxisToLabel,
                          labelAnchor: MethodCommon.tickLabelAnchor(
                              domainAxis?.labelAnchor),
                          tickLengthPx: domainAxis?.tickLength,
                          minimumPaddingBetweenLabelsPx:
                              domainAxis?.minimumPaddingBetweenLabels ?? 0,
                        )
                      : common.SmallTickRendererSpec(
                          axisLineStyle: domainAxis?.lineStyle.getRender(),
                          lineStyle: domainAxis?.tickLineStyle.getRender(),
                          labelRotation: domainAxis?.labelRotation ?? 0,
                          labelStyle: domainAxis?.labelStyle.getRender(),
                          labelOffsetFromAxisPx: domainAxis?.gapAxisToLabel,
                          labelAnchor: MethodCommon.tickLabelAnchor(
                              domainAxis?.labelAnchor),
                          tickLengthPx: domainAxis?.tickLength,
                          minimumPaddingBetweenLabelsPx:
                              domainAxis?.minimumPaddingBetweenLabels ?? 0,
                        ),
              showAxisLine: domainAxis?.showLine,
              tickFormatterSpec: domainAxis?.tickLabelFormatterT == null
                  ? null
                  : common.BasicDateTimeTickFormatterSpec(
                      domainAxis!.tickLabelFormatterT!,
                    ),
            ),
      primaryMeasureAxis: measureAxis == null
          ? null
          : common.NumericAxisSpec(
              viewport: measureAxis?.numericViewport?.getRender(),
              renderSpec: measureAxis?.noRenderSpec ?? false
                  ? common.NoneRenderSpec(
                      axisLineStyle: measureAxis?.lineStyle.getRender(),
                    )
                  : measureAxis!.useGridLine
                      ? common.GridlineRendererSpec(
                          axisLineStyle: measureAxis?.lineStyle.getRender(),
                          lineStyle: measureAxis?.gridLineStyle.getRender(),
                          labelStyle: measureAxis?.labelStyle.getRender(),
                          labelOffsetFromAxisPx: measureAxis?.gapAxisToLabel,
                          labelAnchor: MethodCommon.tickLabelAnchor(
                              measureAxis?.labelAnchor),
                          tickLengthPx: measureAxis?.tickLength,
                        )
                      : common.SmallTickRendererSpec(
                          axisLineStyle: measureAxis?.lineStyle.getRender(),
                          lineStyle: measureAxis?.tickLineStyle.getRender(),
                          labelStyle: measureAxis?.labelStyle.getRender(),
                          labelOffsetFromAxisPx: measureAxis?.gapAxisToLabel,
                          labelAnchor: MethodCommon.tickLabelAnchor(
                              measureAxis?.labelAnchor),
                          tickLengthPx: measureAxis?.tickLength,
                        ),
              showAxisLine: measureAxis?.showLine,
              tickFormatterSpec: common.BasicNumericTickFormatterSpec(
                measureAxis?.tickLabelFormatter,
              ),
              tickProviderSpec: measureAxis?.numericTickProvider?.getRender(),
            ),
      secondaryMeasureAxis: secondaryMeasureAxis == null
          ? null
          : common.NumericAxisSpec(
              viewport: secondaryMeasureAxis?.numericViewport?.getRender(),
              renderSpec: secondaryMeasureAxis?.noRenderSpec ?? false
                  ? common.NoneRenderSpec(
                      axisLineStyle:
                          secondaryMeasureAxis?.lineStyle.getRender(),
                    )
                  : secondaryMeasureAxis!.useGridLine
                      ? common.GridlineRendererSpec(
                          axisLineStyle:
                              secondaryMeasureAxis?.lineStyle.getRender(),
                          lineStyle:
                              secondaryMeasureAxis?.gridLineStyle.getRender(),
                          labelStyle:
                              secondaryMeasureAxis?.labelStyle.getRender(),
                          labelOffsetFromAxisPx:
                              secondaryMeasureAxis?.gapAxisToLabel,
                          labelAnchor: MethodCommon.tickLabelAnchor(
                              secondaryMeasureAxis?.labelAnchor),
                          tickLengthPx: secondaryMeasureAxis?.tickLength,
                        )
                      : common.SmallTickRendererSpec(
                          axisLineStyle:
                              secondaryMeasureAxis?.lineStyle.getRender(),
                          lineStyle:
                              secondaryMeasureAxis?.tickLineStyle.getRender(),
                          labelStyle:
                              secondaryMeasureAxis?.labelStyle.getRender(),
                          labelOffsetFromAxisPx:
                              secondaryMeasureAxis?.gapAxisToLabel,
                          labelAnchor: MethodCommon.tickLabelAnchor(
                              secondaryMeasureAxis?.labelAnchor),
                          tickLengthPx: secondaryMeasureAxis?.tickLength,
                        ),
              showAxisLine: secondaryMeasureAxis?.showLine,
              tickFormatterSpec: common.BasicNumericTickFormatterSpec(
                secondaryMeasureAxis?.tickLabelFormatter,
              ),
              tickProviderSpec:
                  secondaryMeasureAxis?.numericTickProvider?.getRender(),
            ),
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
