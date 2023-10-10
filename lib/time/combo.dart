import 'dart:math';

import 'package:community_charts_common/community_charts_common.dart' as common;
import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';

import '../commons/axis.dart';
import '../commons/config_render.dart';
import '../commons/data_model.dart';
import '../commons/decorator.dart';
import '../commons/enums.dart';
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
  final ConfigRenderLine? configRenderLine;

  /// style bar
  final ConfigRenderBar? configRenderBar;

  /// style plot point
  final ConfigRenderPoint? configRenderPoint;

  /// customize domain axis
  final DomainAxis? domainAxis;

  /// customize measure axis
  final MeasureAxis? measureAxis;

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

  /// set custom format value for label bar\
  /// to show this value, set `barLabelDecorator` not null
  final BarLabelValueT? barLabelValue;

  /// for decoration label, like positioning
  final BarLabelDecorator? barLabelDecorator;

  /// styling label item chart bar
  final InsideBarLabelStyleT? insideBarLabelStyle;

  /// styling label item chart bar
  final OutsideBarLabelStyleT? outsideBarLabelStyle;

  /// when `vertical` is true, chart will be flip\
  /// sort reversed measure axis/
  /// default: false
  final bool? flipVertical;

  /// Numeric Combo Chart\
  /// also can use for single other type but cannot be set horizontal measure
  /// - only bar
  /// - only line
  /// - only scatter plot
  const DChartComboT({
    super.key,
    required this.groupList,
    this.animate = false,
    this.configRenderLine,
    this.configRenderBar,
    this.configRenderPoint,
    this.animationDuration = const Duration(milliseconds: 300),
    this.domainAxis,
    this.measureAxis,
    this.areaColor,
    this.fillPattern,
    this.fillColor,
    this.dashPattern,
    this.insideBarLabelStyle,
    this.outsideBarLabelStyle,
    this.barLabelValue,
    this.barLabelDecorator,
    this.flipVertical = false,
  });

  @override
  Widget build(BuildContext context) {
    ConfigRenderLine cRenderLine = configRenderLine ?? ConfigRenderLine();
    ConfigRenderBar cRenderBar = configRenderBar ?? ConfigRenderBar();
    ConfigRenderPoint cRenderPoint = configRenderPoint ?? ConfigRenderPoint();
    return charts.TimeSeriesChart(
      List.generate(groupList.length, (indexGroup) {
        TimeGroup group = groupList[indexGroup];
        Color groupColor = group.color ??
            Colors.primaries[Random().nextInt(Colors.primaries.length)];
        return charts.Series<TimeData, DateTime>(
          id: group.id,
          data: group.data,
          domainFn: (datum, index) => datum.domain,
          measureFn: (datum, index) => datum.measure,
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
          insideLabelStyleAccessorFn: insideBarLabelStyle == null
              ? null
              : (datum, index) =>
                  insideBarLabelStyle!(group, datum, index).getRender(),
          outsideLabelStyleAccessorFn: outsideBarLabelStyle == null
              ? null
              : (datum, index) =>
                  outsideBarLabelStyle!(group, datum, index).getRender(),
        )..setAttribute(charts.rendererIdKey, group.chartType.name);
      }),
      animate: animate,
      flipVerticalAxis: flipVertical,
      animationDuration: animationDuration,
      defaultRenderer: common.LineRendererConfig(),
      customSeriesRenderers: [
        cRenderBar.getRenderTime(ChartType.bar.name, barLabelDecorator),
        cRenderLine.getRenderTime(ChartType.line.name),
        cRenderPoint.getRenderTime(ChartType.scatterPlot.name),
      ],
      domainAxis: domainAxis == null
          ? null
          : common.DateTimeAxisSpec(
              viewport: domainAxis?.timeViewport?.getRender(),
              renderSpec: common.SmallTickRendererSpec(
                lineStyle: domainAxis?.lineStyle.getRender(),
                labelStyle: domainAxis?.labelStyle.getRender(),
                labelOffsetFromAxisPx: domainAxis?.gapAxisToLabel,
                labelAnchor:
                    MethodCommon.tickLabelAnchor(domainAxis?.labelAnchor),
                tickLengthPx: domainAxis?.thickLength,
              ),
              showAxisLine: domainAxis?.showLine,
              tickFormatterSpec: domainAxis?.labelFormatterT == null
                  ? null
                  : common.BasicDateTimeTickFormatterSpec(
                      domainAxis!.labelFormatterT!,
                    ),
            ),
      primaryMeasureAxis: measureAxis == null
          ? null
          : common.NumericAxisSpec(
              viewport: measureAxis!.numericViewport == null ?
                  null :
                  charts.NumericExtents(
                    measureAxis!.numericViewport!.min,
                    measureAxis!.numericViewport!.max,
                  ),
              renderSpec: common.SmallTickRendererSpec(
                axisLineStyle: measureAxis?.lineStyle.getRender(),
                labelStyle: measureAxis?.labelStyle.getRender(),
                labelOffsetFromAxisPx: measureAxis?.gapAxisToLabel,
                labelAnchor:
                    MethodCommon.tickLabelAnchor(measureAxis?.labelAnchor),
                tickLengthPx: measureAxis?.thickLength,
              ),
              showAxisLine: measureAxis?.showLine,
              tickFormatterSpec: common.BasicNumericTickFormatterSpec(
                measureAxis?.labelFormat,
              ),
              tickProviderSpec: common.BasicNumericTickProviderSpec(
                desiredMaxTickCount: measureAxis?.desiredMaxTickCount,
                desiredMinTickCount: measureAxis?.desiredMinTickCount,
                desiredTickCount: measureAxis?.desiredTickCount,
              ),
            ),

      // behaviors: [
      //   charts.RangeAnnotation([
      //     for (var group in groupList)
      //       for (var data in group.data)
      //         common.LineAnnotationSegment(
      //           data.domain,
      //           charts.RangeAnnotationAxisType.domain,
      //           middleLabel: data.measure.toString(),
      //           color: MethodCommon.chartColor(Colors.red),
      //         ),
      //   ]),
      // ],
    );
  }
}
