import 'dart:math';

import 'package:community_charts_common/community_charts_common.dart' as common;
import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';

import '../commons/axis/axis.dart';
import '../commons/config_render/config_render.dart';
import '../commons/data_model/data_model.dart';
import '../commons/layout_margin.dart';
import '../commons/method_common.dart';
import '../commons/method_type.dart';

/// Numeric Scatter Chart\
class DChartScatterN extends StatelessWidget {
  /// group
  final List<NumericGroup> groupList;

  /// animate chart when build\
  /// default: false
  final bool animate;

  /// duration animate a chart when build\
  /// default: `Duration(milliseconds: 300)`
  final Duration animationDuration;

  /// style bar
  final ConfigRenderPoint? configRenderPoint;

  /// customize domain axis
  final DomainAxis? domainAxis;

  /// customize measure axis
  final MeasureAxis? measureAxis;

  /// `areaColor` returns the area color for a given data value.\
  /// If not provided, then group color will be used 10% opacity by default.\
  /// Specify for Line type\
  /// to activate custom areaColor, `ConfigRenderLine -> includeArea` must be `true`
  final AreaColorN? areaColor;

  /// set fill chart where has fill box like bar\
  /// default: based on Group color
  final FillColorN? fillColor;

  /// custom fill pattern\
  /// default: solid
  final FillPatternN? fillPattern;

  /// set pattern\
  /// specify for line pattern
  final DashPatternN? dashPattern;

  /// set custom format value for label bar
  final String Function(NumericGroup group, NumericData data, int? index)?
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
  final void Function(NumericData data)? onUpdatedListener;

  /// listen which data is changed selected
  final void Function(NumericData data)? onChangedListener;

  /// Numeric Scatter Chart\
  const DChartScatterN({
    super.key,
    required this.groupList,
    this.animate = false,
    this.configRenderPoint,
    this.animationDuration = const Duration(milliseconds: 300),
    this.domainAxis,
    this.measureAxis,
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
    ConfigRenderPoint cRenderPoint = configRenderPoint ?? ConfigRenderPoint();
    return charts.ScatterPlotChart(
      List.generate(groupList.length, (indexGroup) {
        NumericGroup group = groupList[indexGroup];
        Color groupColor = group.color ??
            Colors.primaries[Random().nextInt(Colors.primaries.length)];
        return charts.Series<NumericData, num>(
          id: group.id,
          data: group.data,
          seriesCategory: group.seriesCategory,
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
        );
      }),
      flipVerticalAxis: flipVertical,
      animate: animate,
      animationDuration: animationDuration,
      defaultRenderer: cRenderPoint.getRenderPointN(),
      domainAxis: domainAxis == null
          ? null
          : common.NumericAxisSpec(
              viewport: domainAxis?.numericViewport?.getRender(),
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
              tickFormatterSpec: domainAxis!.tickLabelFormatterN == null
                  ? null
                  : common.BasicNumericTickFormatterSpec(
                      domainAxis!.tickLabelFormatterN,
                    ),
              tickProviderSpec: domainAxis?.numericTickProvider?.getRender(),
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
