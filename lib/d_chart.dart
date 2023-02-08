library d_chart;

import 'dart:math' as _math;

import 'package:community_charts_common/src/chart/common/series_renderer_config.dart'
    show RendererAttributes;
import 'package:community_charts_common/src/common/symbol_renderer.dart'
    show SymbolRenderer;
import 'package:community_charts_flutter/community_charts_flutter.dart'
    as _charts;
import 'package:flutter/material.dart';

_charts.BehaviorPosition? _getBehaviorPosition(DBehaviorPosition? position) {
  switch (position) {
    case DBehaviorPosition.left:
      return _charts.BehaviorPosition.start;
    case DBehaviorPosition.top:
      return _charts.BehaviorPosition.top;
    case DBehaviorPosition.right:
      return _charts.BehaviorPosition.end;
    case DBehaviorPosition.bottom:
      return _charts.BehaviorPosition.bottom;
    default:
      return null;
  }
}

_charts.BarLabelPosition _getBarLabelPosition(RBLabelPosition? labelPosition) {
  switch (labelPosition) {
    case RBLabelPosition.inside:
      return _charts.BarLabelPosition.inside;
    case RBLabelPosition.outside:
      return _charts.BarLabelPosition.outside;
    case RBLabelPosition.right:
      return _charts.BarLabelPosition.right;
    default:
      return _charts.BarLabelPosition.auto;
  }
}

_charts.BarLabelAnchor _getBarLabelAnchor(RBLabelAlign? align) {
  switch (align) {
    case RBLabelAlign.middle:
      return _charts.BarLabelAnchor.middle;
    case RBLabelAlign.end:
      return _charts.BarLabelAnchor.end;
    default:
      return _charts.BarLabelAnchor.start;
  }
}

_charts.BarGroupingType _getBarGroupingType(RBGroupType? type) {
  switch (type) {
    case RBGroupType.stacked:
      return _charts.BarGroupingType.stacked;
    case RBGroupType.groupedStacked:
      return _charts.BarGroupingType.groupedStacked;
    default:
      return _charts.BarGroupingType.grouped;
  }
}

class _IconRenderer extends _charts.CustomSymbolRenderer {
  final IconData icon;

  _IconRenderer(this.icon);
  @override
  Widget build(BuildContext context,
      {Color? color, required Size size, bool enabled = true}) {
    return SizedBox.fromSize(
      size: size,
      child: Icon(icon, color: color, size: 12),
    );
  }
}

/// model Time Group
class DChartTimeGroup {
  /// id for group data time series
  final String groupId;

  /// data each group
  final List<DChartTimeData> data;

  // set color for same group
  final Color? groupColor;

  DChartTimeGroup({
    required this.groupId,
    required this.data,
    this.groupColor,
  });
}

/// model Time Data
class DChartTimeData {
  /// the time at chart
  final DateTime time;

  /// value to measure
  final num value;

  /// your custom data,\
  /// can be string, Map, or your Model class
  final Object? x;

  DChartTimeData({
    required this.time,
    required this.value,
    this.x,
  });
}

enum RenderType {
  line,
  bar,
  barTargetLine,
  point,
}

enum DBehaviorPosition { left, top, right, bottom }

enum DJustify {
  startDrawArea,
  start,
  middleDrawArea,
  middle,
  endDrawArea,
  end,
}

/// label relative to bar\
/// RB: Render Bar
enum RBLabelPosition {
  auto,
  outside,
  inside,

  /// when bar horizontal
  right,
}

/// label align\
/// RB: Render Bar
enum RBLabelAlign { start, middle, end }

/// type for group bar
enum RBGroupType { grouped, groupedStacked, stacked }

/// [TitlePositionX] how to position title x axis
enum TitlePositionX { top, bottom }

/// [TitlePositionY] how to position title y axis
enum TitlePositionY { left, right }

/// [BarValueAnchor] how to position value inside bar
enum BarValueAnchor { start, middle, end }

/// [BarValuePosition] how to set value
enum BarValuePosition { inside, outside, auto }

/// [PieLabelPosition] how to position pie data label
enum PieLabelPosition { inside, outside, auto }

typedef BarColor<Color> = Color Function(
    Map<String, dynamic> barData, int? index, String id);
typedef BarValue<String> = String Function(
    Map<String, dynamic> barData, int? index);
typedef LineColor<Color> = Color Function(
    Map<String, dynamic> lineData, int? index, String id);
typedef PieColor<Color> = Color Function(
    Map<String, dynamic> pieData, int? index);
typedef PieLabel<String> = String Function(
    Map<String, dynamic> pieData, int? index);

typedef PrimaryColor = Color Function(
    DChartTimeGroup group, DChartTimeData data);
typedef AreaColor = Color Function(
    DChartTimeGroup group, DChartTimeData data, int? index);
typedef FillColor = Color Function(
    DChartTimeGroup group, DChartTimeData data, int? index);
typedef SeriesColor = Color Function(DChartTimeGroup group);
typedef ChangedListener = void Function(String groupId, DChartTimeData data);
typedef LegendMeasure = String Function(num? value)?;
typedef LegendTitle = String? Function(DChartTimeGroup group);
typedef CustomLabelValue = String Function(
    DChartTimeGroup group, DChartTimeData data, int? index);
typedef MeasureLabel = String Function(num? value);
typedef DomainTimeLabel = String Function(DateTime? dateTime);

/// get color util to color charts
_charts.Color _getColor(Color color) {
  return _charts.ColorUtil.fromDartColor(color);
}

/// get textStyleSpec from TextStyle
_charts.TextStyleSpec? _getTextStyleSpec(TextStyle? textStyle) {
  if (textStyle == null) return null;
  return _charts.TextStyleSpec(
    color: textStyle.color == null
        ? null
        : _charts.ColorUtil.fromDartColor(textStyle.color!),
    fontSize: textStyle.fontSize?.toInt(),
    lineHeight: textStyle.height,
  );
}

/// [_textStyleSpec] styling textsStyle on spec render chart
_charts.TextStyleSpec _textStyleSpec(int? fontSize, Color? color) {
  return _charts.TextStyleSpec(
    color: color == null ? null : _charts.ColorUtil.fromDartColor(color),
    fontSize: fontSize,
  );
}

/// [_getTitlePositionX] convert d'chart title position to chart_flutter position
_charts.BehaviorPosition? _getTitlePositionX(TitlePositionX? position) {
  switch (position) {
    case TitlePositionX.top:
      return _charts.BehaviorPosition.top;
    case TitlePositionX.bottom:
      return _charts.BehaviorPosition.bottom;
    default:
      return null;
  }
}

/// [_getTitlePositionY] convert d'chart title position to chart_flutter position
_charts.BehaviorPosition? _getTitlePositionY(TitlePositionY? position) {
  switch (position) {
    case TitlePositionY.left:
      return _charts.BehaviorPosition.start;

    case TitlePositionY.right:
      return _charts.BehaviorPosition.end;

    default:
      return null;
  }
}

/// [_getBarValueAnchor] convert d'chart value position inside bar to chart_flutter position
_charts.BarLabelAnchor? _getBarValueAnchor(BarValueAnchor? position) {
  switch (position) {
    case BarValueAnchor.start:
      return _charts.BarLabelAnchor.start;
    case BarValueAnchor.middle:
      return _charts.BarLabelAnchor.middle;
    case BarValueAnchor.end:
      return _charts.BarLabelAnchor.end;
    default:
      return null;
  }
}

/// [_getBarValuePosition] convert d'chart value bar position to chart_flutter position
_charts.BarLabelPosition _getBarValuePosition(BarValuePosition? position) {
  switch (position) {
    case BarValuePosition.inside:
      return _charts.BarLabelPosition.inside;
    case BarValuePosition.outside:
      return _charts.BarLabelPosition.outside;
    default:
      return _charts.BarLabelPosition.auto;
  }
}

/// [_getPieLabelPosition] convert pie d'chart position to chart_flutter position
_charts.ArcLabelPosition _getPieLabelPosition(PieLabelPosition position) {
  switch (position) {
    case PieLabelPosition.inside:
      return _charts.ArcLabelPosition.inside;
    case PieLabelPosition.outside:
      return _charts.ArcLabelPosition.outside;
    default:
      return _charts.ArcLabelPosition.auto;
  }
}

String _defaultBarValue(Map<String, dynamic> barData, int? index) => '';

class DChartBar extends StatelessWidget {
  /// [data] of chart. key for data map as String and value is dynamic
  /// For axis data, use key 'domain' for domain axis and use key 'measure' for measure axis
  List<Map<String, dynamic>> data;

  /// [barColor] return color of bar. can be custom based on bar data
  BarColor<Color> barColor;

  /// [barValue] return template string for label on bar.
  /// Default: _defaultBarValue
  BarValue<String> barValue;

  /// [barValueAnchor] return BarValueAnchor to position [barValue] inside bar
  BarValueAnchor? barValueAnchor;

  /// [barValuePosition] return BarValuePosition to type position [barValue]
  BarValuePosition? barValuePosition;

  /// [barValueFontSize] return fontSize for [barValue].
  /// Default : 14
  int barValueFontSize;

  /// [barValueColor] return color of [barValue]
  Color? barValueColor;

  /// [showBarValue] if true, [barValue] will be shown
  /// Default: false
  bool showBarValue;

  /// [borderColor] return color for border bar
  Color? borderColor;

  /// [borderWidth] return width of line border bar
  double? borderWidth;

  /// [animate] BarChart will be animate when launch if true.
  bool? animate;

  /// [animationDuration] return Duration of animation launch
  Duration? animationDuration;

  /// [verticalDirection] if true, bar will raised to top or horizontally
  /// Default: true
  bool verticalDirection;

  /// [showMeasureLine] if true, measure line will be show
  bool? showMeasureLine;

  /// [showDomainLine] if true, measure line will be show
  bool? showDomainLine;

  /// [axisLineColor] return color of axis line
  Color? axisLineColor;

  /// [axisLineTick] return thickness/width of axis line
  int? axisLineTick;

  /// [axisLineTick] return thickness/width of point line
  int? axisLinePointTick;

  /// [axisLinePointWidth] return length of point line
  int? axisLinePointWidth;

  /// [domainLabelRotation] return rotation label at domain axis
  int? domainLabelRotation;

  /// [domainLabelFontSize] return fontSize for label domain
  int? domainLabelFontSize;

  /// [domainLabelColor] return color for label domain
  Color? domainLabelColor;

  /// [domainLabelPaddingToTick] return padding between label & point line
  int? domainLabelPaddingToTick;

  /// [domainLabelPaddingToAxisLine] return padding between label & axis line
  int? domainLabelPaddingToAxisLine;

  /// [measureLabelRotation] return rotation label at measure axis
  int? measureLabelRotation;

  /// [measureLabelFontSize] return fontSize for label measure
  int? measureLabelFontSize;

  /// [measureLabelColor] return color for label measure
  Color? measureLabelColor;

  /// [measureLabelPaddingToTick] return padding between label & point line
  int? measureLabelPaddingToTick;

  /// [measureLabelPaddingToAxisLine] return padding between label & axis line
  int? measureLabelPaddingToAxisLine;

  /// [measureMin] return minimum value for measure
  int? measureMin;

  /// [measureMin] return maximum value for measure
  int? measureMax;

  /// [measureAxisTitle] return title for y/vertical axis
  String? yAxisTitle;

  /// [measureAxisTitleColor] return color for title measureAxis
  /// Default: Colors.black
  Color measureAxisTitleColor;

  /// [measureAxisTitleFontSize] return fontSize for title measureAxis
  /// Default: 14
  int measureAxisTitleFontSize;

  /// [measureAxisTitleInPadding] return padding between title and measureAxis
  /// Default: 8
  int measureAxisTitleInPadding;

  /// [measureAxisTitleOutPadding] return padding between title and out box / margin
  /// Default: 0
  int measureAxisTitleOutPadding;

  /// [measureAxisTitlePosition] return TitlePositionY
  /// Default: TitlePositionY.left
  TitlePositionY measureAxisTitlePosition;

  /// [domainAxisTitle] return title for x/horizontal axis
  String? xAxisTitle;

  /// [measureAxisTitleColor] return color for title domainAxis
  /// Default: Colors.black
  Color domainAxisTitleColor;

  /// [domainAxisTitleFontSize] return fontSize for title domainAxis
  /// Default: 14
  int domainAxisTitleFontSize;

  /// [domainAxisTitleInPadding] return padding between title and domainAxis
  /// Default: 8
  int domainAxisTitleInPadding;

  /// [domainAxisTitleOutPadding] return padding between title and out box / margin
  /// Default: 0
  int domainAxisTitleOutPadding;

  /// [domainAxisTitlePosition] return TitlePositionX
  /// Default: TitlePositionX.bottom
  TitlePositionX domainAxisTitlePosition;

  /// [minimumPaddingBetweenLabel] return padding between label
  int? minimumPaddingBetweenLabel;
  DChartBar({
    this.animate,
    this.animationDuration,
    this.axisLineColor,
    this.axisLinePointTick,
    this.axisLinePointWidth,
    this.axisLineTick,
    required this.barColor,
    this.barValue = _defaultBarValue,
    this.barValueAnchor,
    this.barValueColor,
    this.barValueFontSize = 14,
    this.barValuePosition,
    this.borderColor,
    this.borderWidth,
    required this.data,
    this.domainLabelColor,
    this.domainLabelFontSize,
    this.domainLabelPaddingToAxisLine,
    this.domainLabelPaddingToTick,
    this.domainLabelRotation,
    this.measureLabelColor,
    this.measureLabelFontSize,
    this.measureLabelPaddingToAxisLine,
    this.measureLabelPaddingToTick,
    this.measureLabelRotation,
    this.measureMax,
    this.measureMin,
    this.minimumPaddingBetweenLabel,
    this.showBarValue = false,
    this.showDomainLine,
    this.showMeasureLine,
    this.verticalDirection = true,
    this.xAxisTitle,
    this.domainAxisTitleColor = Colors.black,
    this.domainAxisTitleFontSize = 14,
    this.domainAxisTitleInPadding = 8,
    this.domainAxisTitleOutPadding = 0,
    this.domainAxisTitlePosition = TitlePositionX.bottom,
    this.yAxisTitle,
    this.measureAxisTitleColor = Colors.black,
    this.measureAxisTitleFontSize = 14,
    this.measureAxisTitleInPadding = 8,
    this.measureAxisTitleOutPadding = 0,
    this.measureAxisTitlePosition = TitlePositionY.left,
  });

  @override
  Widget build(BuildContext context) {
    axisLinePointTick = axisLinePointTick ?? axisLineTick;
    return _charts.BarChart(
      List.generate(data.length, (index) {
        var groupBarData = data[index];
        return _charts.Series<Map<String, dynamic>, String>(
          id: groupBarData['id'],
          domainFn: (Map<String, dynamic> axis, _) => axis['domain'],
          measureFn: (Map<String, dynamic> axis, _) => axis['measure'],
          data: groupBarData['data'],
          fillColorFn: (datum, index) {
            return _charts.ColorUtil.fromDartColor(
              barColor(datum, index, groupBarData['id']),
            );
          },
          labelAccessorFn: (datum, index) {
            String? resultValue = barValue(datum, index);
            return resultValue;
          },
          strokeWidthPxFn: (datum, index) => borderWidth,
          seriesColor: borderColor == null
              ? null
              : _charts.ColorUtil.fromDartColor(borderColor!),
        );
      }),
      barRendererDecorator: showBarValue
          ? _charts.BarLabelDecorator(
              labelAnchor: _getBarValueAnchor(barValueAnchor),
              outsideLabelStyleSpec:
                  _textStyleSpec(barValueFontSize, barValueColor),
              insideLabelStyleSpec:
                  _textStyleSpec(barValueFontSize, barValueColor),
              labelPadding: 4,
              labelPosition: _getBarValuePosition(barValuePosition),
            )
          : null,
      domainAxis: _charts.OrdinalAxisSpec(
        renderSpec: _charts.SmallTickRendererSpec(
          axisLineStyle: _charts.LineStyleSpec(
            color: axisLineColor == null
                ? null
                : _charts.ColorUtil.fromDartColor(axisLineColor!),
            thickness: axisLineTick,
          ),
          labelAnchor: _charts.TickLabelAnchor.centered,
          lineStyle: _charts.LineStyleSpec(
            color: axisLineColor == null
                ? null
                : _charts.ColorUtil.fromDartColor(axisLineColor!),
            thickness: axisLinePointTick,
          ),
          tickLengthPx: axisLinePointWidth,
          labelRotation: domainLabelRotation,
          labelStyle: _textStyleSpec(domainLabelFontSize, domainLabelColor),
          labelOffsetFromAxisPx: domainLabelPaddingToAxisLine,
          labelOffsetFromTickPx: domainLabelPaddingToTick,
        ),
        showAxisLine: showDomainLine,
      ),
      primaryMeasureAxis: _charts.NumericAxisSpec(
        renderSpec: _charts.SmallTickRendererSpec(
          minimumPaddingBetweenLabelsPx: minimumPaddingBetweenLabel,
          axisLineStyle: _charts.LineStyleSpec(
            color: axisLineColor == null
                ? null
                : _charts.ColorUtil.fromDartColor(axisLineColor!),
            thickness: axisLineTick,
          ),
          labelAnchor: _charts.TickLabelAnchor.centered,
          lineStyle: _charts.LineStyleSpec(
            color: axisLineColor == null
                ? null
                : _charts.ColorUtil.fromDartColor(axisLineColor!),
            thickness: axisLinePointTick,
          ),
          tickLengthPx: axisLinePointWidth,
          labelRotation: measureLabelRotation,
          labelStyle: _textStyleSpec(measureLabelFontSize, measureLabelColor),
          labelOffsetFromAxisPx: measureLabelPaddingToAxisLine,
          labelOffsetFromTickPx: measureLabelPaddingToTick,
        ),
        showAxisLine: showMeasureLine,
        viewport: measureMin != null && measureMax != null
            ? _charts.NumericExtents(measureMin!, measureMax!)
            : null,
      ),
      behaviors: [
        _charts.ChartTitle(
          yAxisTitle ?? '',
          behaviorPosition: _getTitlePositionY(measureAxisTitlePosition),
          titleStyleSpec:
              _textStyleSpec(measureAxisTitleFontSize, measureAxisTitleColor),
          outerPadding: measureAxisTitleInPadding,
          innerPadding: measureAxisTitleOutPadding,
          layoutPreferredSize: yAxisTitle == null ? 0 : null,
        ),
        _charts.ChartTitle(
          xAxisTitle ?? '',
          behaviorPosition: _getTitlePositionX(domainAxisTitlePosition),
          titleStyleSpec:
              _textStyleSpec(domainAxisTitleFontSize, domainAxisTitleColor),
          outerPadding: domainAxisTitleOutPadding,
          innerPadding: domainAxisTitleInPadding,
          layoutPreferredSize: xAxisTitle == null ? 0 : null,
        ),
      ],
      animate: animate,
      animationDuration: animationDuration,
      vertical: verticalDirection,
      barGroupingType: _charts.BarGroupingType.grouped,
    );
  }
}

class DChartLine extends StatelessWidget {
  // [data] of chart. key for data map as String and value is dynamic
  /// For axis data, use key 'domain' for domain axis and use key 'measure' for measure axis
  List<Map<String, dynamic>> data;

  /// [lineColor] return color of line. can be custom based on line data
  LineColor<Color> lineColor;
  // [pointColor] return color of point at line
  LineColor<Color>? pointColor;

  /// [areaColor] return color of area below line
  LineColor<Color>? areaColor;

  /// [includeArea] if true will be show the area
  /// Default: false
  bool includeArea;

  /// [includePoints] if true will be show the points
  /// Default: false
  bool includePoints;

  /// [lineWidth] return width of each line
  double? lineWidth;

  /// [animate] if true, line chart will be animated when widget chart launch
  bool? animate;

  /// [animationDuration] return duration of animation
  Duration? animationDuration;
  DChartLine({
    this.animate,
    this.animationDuration,
    this.areaColor,
    required this.data,
    this.includeArea = false,
    this.includePoints = false,
    required this.lineColor,
    this.lineWidth,
    this.pointColor,
  });

  @override
  Widget build(BuildContext context) {
    return _charts.LineChart(
      List.generate(data.length, (index) {
        var groupBarData = data[index];
        return _charts.Series<Map<String, dynamic>, num>(
          id: groupBarData['id'],
          domainFn: (Map<String, dynamic> axis, _) => axis['domain'],
          measureFn: (Map<String, dynamic> axis, _) => axis['measure'],
          data: groupBarData['data'],
          fillColorFn: (datum, index) {
            if (pointColor == null) return null;
            return _charts.ColorUtil.fromDartColor(
              pointColor!(datum, index, groupBarData['id']),
            );
          },
          colorFn: (datum, index) {
            return _charts.ColorUtil.fromDartColor(
              lineColor(datum, index, groupBarData['id']),
            );
          },
          strokeWidthPxFn: (datum, index) => lineWidth,
        );
      }),
      defaultRenderer: _charts.LineRendererConfig(
        includePoints: includePoints,
        includeArea: includeArea,
        strokeWidthPx: lineWidth ?? 2,
      ),
      animate: animate,
      animationDuration: animationDuration,
    );
  }
}

class DChartPie extends StatelessWidget {
  /// [data] of chart. key for data map as String and value is dynamic
  /// For axis data, use key 'domain' for domain axis and use key 'measure' for measure axis
  List<Map<String, dynamic>> data;

  /// [fillColor] return color of pie. can be custom based on pie data
  PieColor fillColor;

  /// [pieLabel] return PieLabel data. can be custom based on pie data
  PieLabel? pieLabel;

  /// [labelPosition] return PieLabelPosition
  /// Default: PieLabelPosition.auto
  PieLabelPosition labelPosition;

  /// [labelFontSize] return fontSize of label
  /// Default: 12
  int labelFontSize;

  /// [labelColor] return color of label
  /// Default: Colors.black
  Color labelColor;

  /// [showLabelLine] if true, will be show label line
  /// Default: true
  bool showLabelLine;

  /// [labelLineColor] return color of label line
  /// Default: Colors.black
  Color labelLineColor;

  /// [labelLinelength] return length of label line
  /// Default: 16
  double labelLinelength;

  /// [labelLineThickness] return thickness of label line
  /// Default: 1
  double labelLineThickness;

  /// [labelPadding] return padding of label
  /// Default: 5
  int labelPadding;

  /// [donutWidth] return width of donut chart. if null will be return Pie Chart
  int? donutWidth;

  /// [strokeWidth] return width of stroke/limit between part data in pie chart
  /// Default: 2
  double strokeWidth;

  /// [animate] if true, line chart will be animated when widget chart launch
  bool? animate;

  /// [animationDuration] return duration of animation
  Duration? animationDuration;
  DChartPie({
    this.animate,
    this.animationDuration,
    required this.data,
    this.donutWidth,
    required this.fillColor,
    this.labelColor = Colors.black,
    this.labelFontSize = 12,
    this.labelLineColor = Colors.black,
    this.labelLineThickness = 1,
    this.labelLinelength = 16,
    this.labelPadding = 5,
    this.labelPosition = PieLabelPosition.auto,
    this.pieLabel,
    this.showLabelLine = true,
    this.strokeWidth = 2,
  });

  @override
  Widget build(BuildContext context) {
    return _charts.PieChart(
      [
        _charts.Series<Map<String, dynamic>, String>(
          id: 'Pie',
          domainFn: (Map<String, dynamic> axis, _) => axis['domain'],
          measureFn: (Map<String, dynamic> axis, _) => axis['measure'],
          data: data,
          labelAccessorFn: (datum, index) {
            return pieLabel == null
                ? datum['measure'].toString()
                : pieLabel!(datum, index);
          },
          colorFn: (datum, index) {
            return _charts.ColorUtil.fromDartColor(fillColor(datum, index));
          },
        ),
      ],
      defaultRenderer: _charts.ArcRendererConfig<String>(
        arcWidth: donutWidth,
        strokeWidthPx: strokeWidth,
        arcRendererDecorators: [
          _charts.ArcLabelDecorator(
            labelPadding: labelPadding,
            leaderLineStyleSpec: _charts.ArcLabelLeaderLineStyleSpec(
              color: _charts.ColorUtil.fromDartColor(labelLineColor),
              length: labelLinelength,
              thickness: labelLineThickness,
            ),
            showLeaderLines: showLabelLine,
            labelPosition: _getPieLabelPosition(labelPosition),
            insideLabelStyleSpec: _textStyleSpec(labelFontSize, labelColor),
            outsideLabelStyleSpec: _textStyleSpec(labelFontSize, labelColor),
          ),
        ],
      ),
      animate: animate,
      animationDuration: animationDuration,
    );
  }
}

class DChartGauge extends StatelessWidget {
  /// [data] of chart. key for data map as String and value is dynamic
  /// For axis data, use key 'domain' for domain axis and use key 'measure' for measure axis
  List<Map<String, dynamic>> data;

  /// [fillColor] return color of pie. can be custom based on pie data
  PieColor fillColor;

  /// [pieLabel] return PieLabel data. can be custom based on pie data
  PieLabel? pieLabel;

  /// [labelPosition] return PieLabelPosition
  /// Default: PieLabelPosition.auto
  PieLabelPosition labelPosition;

  /// [labelFontSize] return fontSize of label
  /// Default: 12
  int labelFontSize;

  /// [labelColor] return color of label
  /// Default: Colors.black
  Color labelColor;

  /// [showLabelLine] if true, will be show label line
  /// Default: true
  bool showLabelLine;

  /// [labelLineColor] return color of label line
  /// Default: Colors.black
  Color labelLineColor;

  /// [labelLinelength] return length of label line
  /// Default: 16
  double labelLinelength;

  /// [labelLineThickness] return thickness of label line
  /// Default: 1
  double labelLineThickness;

  /// [labelPadding] return padding of label
  /// Default: 5
  int labelPadding;

  /// [donutWidth] return width of donut chart. if null will be return Pie Chart
  int? donutWidth;

  /// [strokeWidth] return width of stroke/limit between part data in pie chart
  /// Default: 2
  double strokeWidth;

  /// [animate] if true, line chart will be animated when widget chart launch
  bool? animate;

  /// [animationDuration] return duration of animation
  Duration? animationDuration;
  DChartGauge({
    this.animate,
    this.animationDuration,
    required this.data,
    this.donutWidth,
    required this.fillColor,
    this.labelColor = Colors.black,
    this.labelFontSize = 12,
    this.labelLineColor = Colors.black,
    this.labelLineThickness = 1,
    this.labelLinelength = 16,
    this.labelPadding = 5,
    this.labelPosition = PieLabelPosition.auto,
    this.pieLabel,
    this.showLabelLine = true,
    this.strokeWidth = 2,
  });

  @override
  Widget build(BuildContext context) {
    return _charts.PieChart(
      [
        _charts.Series<Map<String, dynamic>, String>(
          id: 'Pie',
          domainFn: (Map<String, dynamic> axis, _) => axis['domain'],
          measureFn: (Map<String, dynamic> axis, _) => axis['measure'],
          data: data,
          labelAccessorFn: (datum, index) {
            return pieLabel == null
                ? datum['measure'].toString()
                : pieLabel!(datum, index);
          },
          colorFn: (datum, index) {
            return _charts.ColorUtil.fromDartColor(fillColor(datum, index));
          },
        ),
      ],
      defaultRenderer: _charts.ArcRendererConfig<String>(
        arcWidth: donutWidth ?? 30,
        strokeWidthPx: strokeWidth,
        startAngle: 4 / 5 * 3.14,
        arcLength: 7 / 5 * 3.14,
        arcRendererDecorators: [
          _charts.ArcLabelDecorator(
            labelPadding: labelPadding,
            leaderLineStyleSpec: _charts.ArcLabelLeaderLineStyleSpec(
              color: _charts.ColorUtil.fromDartColor(labelLineColor),
              length: labelLinelength,
              thickness: labelLineThickness,
            ),
            showLeaderLines: showLabelLine,
            labelPosition: _getPieLabelPosition(labelPosition),
            insideLabelStyleSpec: _textStyleSpec(labelFontSize, labelColor),
            outsideLabelStyleSpec: _textStyleSpec(labelFontSize, labelColor),
          ),
        ],
      ),
      animate: animate,
      animationDuration: animationDuration,
    );
  }
}

/// Custom Bar Chart extends to default flutter framework
class DChartBarCustom extends StatefulWidget {
  const DChartBarCustom(
      {Key? key,
      this.max,
      required this.listData,
      this.verticalDirection,
      this.domainLineStyle,
      this.measureLineStyle,
      this.showDomainLine,
      this.showMeasureLine,
      this.spaceBetweenItem,
      this.valueAlign,
      this.domainLabelStyle,
      this.measureLabelStyle,
      this.showDomainLabel,
      this.showMeasureLabel,
      this.spaceDomainLabeltoChart,
      this.spaceMeasureLabeltoChart,
      this.showLoading,
      this.loadingDuration,
      this.valuePadding,
      this.radiusBar,
      this.spaceDomainLinetoChart,
      this.spaceMeasureLinetoChart})
      : super(key: key);

  /// Limit top value for value chart, beside top domainAxis Line
  ///
  /// Default: based on highest value from [listData]
  ///
  /// for minimum always set 0
  final double? max;

  /// Chart data.
  ///
  /// you can set custom style here for each item chart
  final List<DChartBarDataCustom> listData;

  /// Default of direction children chart is horizantally (false)
  final bool? verticalDirection;

  /// Style for Domain line,
  ///
  /// [showDomainLine] must be true if you want to see your custom style for this axis line
  final BorderSide? domainLineStyle;

  /// Style for Measure line,
  ///
  /// [showMeasureLine] must be true if you want to see your custom style for this axis line
  final BorderSide? measureLineStyle;

  /// to enable Domain Line, set to true
  ///
  /// Default: false
  final bool? showDomainLine;

  /// to enable Measure Line, set to true
  ///
  /// Default: false
  final bool? showMeasureLine;

  /// style for text label beside Domain Line
  final TextStyle? domainLabelStyle;

  /// style for text label beside Measure Line
  final TextStyle? measureLabelStyle;

  /// to enable Domain Label Text, set to true
  ///
  /// Default: false
  final bool? showDomainLabel;

  /// to enable Measure Label Text, set to true
  ///
  /// Default: false
  final bool? showMeasureLabel;

  /// Space between item chart,
  ///
  /// If you want to set chart width shortest, fill this space bigger,
  ///
  /// otherwise if you want to set chart width longer, fill this space smaller
  final double? spaceBetweenItem;

  /// space beetween Domain label & chart view,
  ///
  /// if null, then will be set 5
  final double? spaceDomainLabeltoChart;

  /// space beetween Measure label & chart view,
  ///
  /// if null, then will be set 5
  final double? spaceMeasureLabeltoChart;

  /// space beetween Domain line & chart view,
  ///
  /// if null, then will be set 0
  final double? spaceDomainLinetoChart;

  /// space beetween Measure line & chart view,
  ///
  /// if null, then will be set 0
  final double? spaceMeasureLinetoChart;

  /// Align for value text inside chart item
  ///
  /// if null, then will be set Alignment.topCenter
  final Alignment? valueAlign;

  /// padding for value text inside item chart view
  ///
  /// if null, then const EdgeInsets.all(4)
  final EdgeInsetsGeometry? valuePadding;

  /// show loading circle before show chart view
  ///
  /// if null, then will be set true
  final bool? showLoading;

  /// duration for show loading, must set [showLoading] true
  ///
  /// if null, then will be set Duration(milliseconds: 1200)
  final Duration? loadingDuration;

  /// radius for item bar view
  final BorderRadius? radiusBar;

  @override
  State<DChartBarCustom> createState() => _DChartBarCustomState();
}

class _DChartBarCustomState extends State<DChartBarCustom> {
  double max = 1;
  bool loading = false;

  @override
  void initState() {
    if (widget.showLoading ?? false) {
      setState(() {
        loading = true;
      });
      Future.delayed(
        widget.loadingDuration ?? const Duration(milliseconds: 1200),
        () {
          setState(() {
            loading = false;
          });
        },
      );
    }

    List list = widget.listData.map((e) => e).toList();
    list.sort((a, b) => a.value.compareTo(b.value));
    max = widget.max ?? list.last.value;

    super.initState();
  }

  Widget minLabel() {
    return Text(
      _numberAutoDigit(0),
      style: widget.measureLabelStyle,
      textAlign: TextAlign.right,
    );
  }

  Widget maxLabel() {
    return Text(
      _numberAutoDigit(max),
      style: widget.measureLabelStyle,
      textAlign: TextAlign.right,
    );
  }

  BorderSide domainLine() {
    return (widget.showDomainLine ?? false)
        ? widget.domainLineStyle != null
            ? widget.domainLineStyle!
            : const BorderSide()
        : BorderSide.none;
  }

  BorderSide measureLine() {
    return (widget.showMeasureLine ?? false)
        ? widget.measureLineStyle != null
            ? widget.measureLineStyle!
            : const BorderSide()
        : BorderSide.none;
  }

  EdgeInsetsGeometry paddingChart() {
    return EdgeInsets.only(
      bottom: (widget.verticalDirection ?? false)
          ? (widget.spaceMeasureLinetoChart ?? 0)
          : (widget.spaceDomainLinetoChart ?? 0),
      left: (widget.verticalDirection ?? false)
          ? (widget.spaceDomainLinetoChart ?? 0)
          : (widget.spaceMeasureLinetoChart ?? 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }
    return LayoutBuilder(builder: (context, constraintsOut) {
      if (widget.verticalDirection ?? false) {
        // vertical
        return Row(
          children: [
            if (widget.showDomainLabel ?? false)
              Padding(
                padding: EdgeInsets.only(
                  bottom: widget.spaceMeasureLinetoChart ?? 0,
                ),
                child: LayoutBuilder(
                    builder: (context, constrainsDomainLabelHorz) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(widget.listData.length, (index) {
                      DChartBarDataCustom item = widget.listData[index];
                      return Container(
                        alignment: Alignment.center,
                        height: (constrainsDomainLabelHorz.maxHeight /
                                widget.listData.length) -
                            (widget.spaceBetweenItem ??
                                ((constrainsDomainLabelHorz.maxHeight /
                                        widget.listData.length) *
                                    0.1)),
                        child: item.labelCustom ??
                            Text(
                              item.label,
                              style: widget.domainLabelStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                      );
                    }),
                  );
                }),
              ),
            SizedBox(width: widget.spaceDomainLabeltoChart ?? 5),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    // height: constraintsOut.maxHeight,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: measureLine(),
                        left: domainLine(),
                      ),
                    ),
                    child: Padding(
                      padding: paddingChart(),
                      child:
                          LayoutBuilder(builder: (context, constraintsChart) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...List.generate(widget.listData.length, (index) {
                              DChartBarDataCustom item = widget.listData[index];

                              return SizedBox(
                                width: (item.value / max) *
                                    constraintsChart.maxWidth,
                                height: (constraintsChart.maxHeight /
                                        widget.listData.length) -
                                    (widget.spaceBetweenItem ??
                                        ((constraintsChart.maxHeight /
                                                widget.listData.length) *
                                            0.1)),
                                child: _DChartBarItemValueView(
                                  barDataCustom: item,
                                  valuePadding: widget.valuePadding,
                                  valueAlign: widget.valueAlign,
                                  radiusBar: widget.radiusBar,
                                  verticalOffsetTooltip: 0,
                                ),
                              );
                            }),
                          ],
                        );
                      }),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Transform.translate(
                      offset: Offset(
                        0 +
                            (widget.spaceDomainLinetoChart ?? 0) +
                            ((widget.showMeasureLine ?? false)
                                ? (widget.measureLineStyle == null
                                    ? 0
                                    : widget.measureLineStyle!.width)
                                : 0),
                        12 +
                            ((widget.showMeasureLine ?? false)
                                ? (widget.measureLineStyle == null
                                    ? 0
                                    : widget.measureLineStyle!.width)
                                : 0) +
                            (widget.spaceMeasureLabeltoChart ?? 5),
                      ),
                      child: minLabel(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Transform.translate(
                        offset: Offset(
                          0,
                          12 +
                              ((widget.showMeasureLine ?? false)
                                  ? (widget.measureLineStyle == null
                                      ? 0
                                      : widget.measureLineStyle!.width)
                                  : 0) +
                              (widget.spaceMeasureLabeltoChart ?? 5),
                        ),
                        child: maxLabel()),
                  ),
                ],
              ),
            ),
          ],
        );
      }

      // horizontal
      return Row(
        children: [
          if (widget.showMeasureLabel ?? false)
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Transform.translate(
                  offset: const Offset(0, -4),
                  child: maxLabel(),
                ),
                Transform.translate(
                  offset: Offset(
                    0,
                    4 -
                        ((widget.showDomainLine ?? false)
                            ? (widget.domainLineStyle == null
                                ? 0
                                : widget.domainLineStyle!.width)
                            : 0) -
                        (widget.spaceDomainLinetoChart ?? 0),
                  ),
                  child: minLabel(),
                ),
              ],
            ),
          SizedBox(width: widget.spaceMeasureLabeltoChart ?? 5),
          Expanded(
            child: Container(
              height: constraintsOut.maxHeight,
              decoration: BoxDecoration(
                border: Border(
                  bottom: domainLine(),
                  left: measureLine(),
                ),
              ),
              child: Padding(
                padding: paddingChart(),
                child: LayoutBuilder(builder: (context, constraintsChart) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(widget.listData.length, (index) {
                        DChartBarDataCustom item = widget.listData[index];
                        double height =
                            (item.value / max) * constraintsChart.maxHeight;
                        return SizedBox(
                          width: (constraintsChart.maxWidth /
                                  widget.listData.length) -
                              (widget.spaceBetweenItem ??
                                  ((constraintsChart.maxWidth /
                                          widget.listData.length) *
                                      0.1)),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: height,
                                  child: _DChartBarItemValueView(
                                    barDataCustom: item,
                                    valuePadding: widget.valuePadding,
                                    valueAlign: widget.valueAlign,
                                    radiusBar: widget.radiusBar,
                                    verticalOffsetTooltip: (((item.value /
                                                    max) *
                                                constraintsChart.maxHeight) *
                                            0.5) +
                                        4,
                                  ),
                                ),
                              ),
                              if (widget.showDomainLabel ?? false)
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Transform.translate(
                                    offset: Offset(
                                      0,
                                      height == 0
                                          ? 20
                                          : 0 +
                                              15 +
                                              (widget.spaceDomainLabeltoChart ??
                                                  5) +
                                              ((widget.showDomainLine ?? false)
                                                  ? (widget.domainLineStyle ==
                                                          null
                                                      ? 0
                                                      : widget.domainLineStyle!
                                                          .width)
                                                  : 0) +
                                              (widget.spaceDomainLinetoChart ??
                                                  0),
                                    ),
                                    child: item.labelCustom ??
                                        Text(
                                          item.label,
                                          style: widget.domainLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      }),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      );
    });
  }
}

/// Data model for [DChartBarCustom]
class DChartBarDataCustom {
  /// color for item chart
  ///
  /// if null, will be set Colors.blue[100]
  final Color? color;

  /// color for animation ripple click
  final Color? splashColor;

  /// value for item chart
  final double value;

  /// view text which show in tooltip
  ///
  /// if null, will set 'Label: Value'
  final String? valueTooltip;

  /// label text below of chart item
  final String label;

  /// style for value text inside chart item view
  ///
  /// must be set true on [showValue] to see
  final TextStyle? valueStyle;

  /// you can full customization for label widget, like wrap with Transform widget
  final Widget? labelCustom;

  /// you can full customization for value widget
  ///
  /// value position is inside stack.
  ///
  /// so you can wrap your custom widget value like Align
  final Widget? valueCustom;

  /// set to true to show the value inside chart
  ///
  /// if null, will set to false
  final bool? showValue;

  /// elevation for box item chart
  final double? elevation;

  /// color for shadow, [elevation] has to bigger than 0
  final Color? shadowColor;

  /// action when you tap item bar view
  final Function? onTap;

  DChartBarDataCustom({
    this.color,
    required this.value,
    required this.label,
    this.valueStyle,
    this.showValue,
    this.valueTooltip,
    this.labelCustom,
    this.valueCustom,
    this.onTap,
    this.elevation,
    this.splashColor,
    this.shadowColor,
  });
}

class _DChartBarItemValueView extends StatelessWidget {
  const _DChartBarItemValueView({
    Key? key,
    this.valueAlign,
    required this.verticalOffsetTooltip,
    required this.barDataCustom,
    this.valuePadding,
    this.radiusBar,
  }) : super(key: key);

  final DChartBarDataCustom barDataCustom;
  final Alignment? valueAlign;
  final EdgeInsetsGeometry? valuePadding;
  final double verticalOffsetTooltip;
  final BorderRadius? radiusBar;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: barDataCustom.valueTooltip ??
          '${barDataCustom.label}: ${_numberAutoDigit(barDataCustom.value)}',
      preferBelow: false,
      verticalOffset: verticalOffsetTooltip,
      child: GestureDetector(
        onTap:
            barDataCustom.onTap == null ? null : () => barDataCustom.onTap!(),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Material(
              elevation: barDataCustom.elevation ?? 0,
              borderRadius: radiusBar,
              shadowColor: barDataCustom.shadowColor,
              color: barDataCustom.color ?? Colors.blue[100],
              child: InkWell(
                borderRadius: radiusBar,
                splashColor: barDataCustom.splashColor,
                onTap: barDataCustom.onTap == null
                    ? null
                    : () => barDataCustom.onTap!(),
                child: const SizedBox(),
              ),
            ),
            if (barDataCustom.showValue ?? false)
              barDataCustom.valueCustom ??
                  Align(
                    alignment: valueAlign ?? Alignment.topCenter,
                    child: Padding(
                      padding: valuePadding ?? const EdgeInsets.all(4),
                      child: Text(
                        _numberAutoDigit(barDataCustom.value),
                        style: barDataCustom.valueStyle,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

String _numberAutoDigit(double value, [int maxDigit = 3]) {
  if (value.toInt() == value) {
    return value.toInt().toString();
  } else {
    int digit = value.toString().split('.').last.length;
    if (digit > maxDigit) return value.toStringAsFixed(maxDigit);
    return value.toString();
  }
}

/// Time Series Chart\
class DChartTime extends StatelessWidget {
  /// Data Chart\
  /// as array 2 dimension,\
  /// where 1st as Group List and 2nd as List of ChartTimeData
  /// Example:\
  /// ```dart
  /// [
  ///   DChartTimeGroup(
  ///     groupId: 'Keyboard',
  ///     groupColor: Colors.blue,
  ///     data: [
  ///       DChartTimeData(time: DateTime(2023, 2, 1), value: 29),
  ///       DChartTimeData(time: DateTime(2023, 2, 3, 5), value: 73),
  ///       DChartTimeData(time: DateTime(2023, 2, 4), value: 54),
  ///     ],
  ///   ),
  /// ]
  /// ```
  final List<DChartTimeGroup> groupData;

  /// animate chart when it build?
  final bool? animate;

  /// color for line
  /// Default: Random, each group has same color
  final PrimaryColor? primaryColor;

  /// color for fill item chart
  final FillColor? fillColor;

  /// changed listener for selected point
  final ChangedListener? changedListener;

  /// chart title
  final String? title;

  /// chart subtitle\
  /// title must not null
  final String? subtitle;

  /// title position
  final DBehaviorPosition? titlePosition;

  /// title align
  final DJustify? titleJustify;

  /// inner padding\
  /// if DBehaviorPosition == horizontal, padding will be set beetween title & outside\
  /// if DBehaviorPosition == vertical, padding will be set beetween title & chart\
  /// Deafult: 0
  final int? innerPadding;

  /// inner padding\
  /// if DBehaviorPosition == horizontal, padding will be set between title & chart\
  /// if DBehaviorPosition == vertical, padding will be set between title & outside\
  /// Deafult: 0
  final int? outerPadding;

  /// padding between title & subtitle\
  /// Default: 0
  final int? titlePadding;

  /// style for title\
  /// available:
  /// - color
  /// - fontSize
  /// - height
  final TextStyle? titleStyle;

  /// style for subtitle\
  /// available:
  /// - color
  /// - fontSize
  /// - height
  final TextStyle? subtitleStyle;

  /// text direction\
  /// Right to Left - RTL\
  /// Left to Right - LTR\
  /// Default: LTR
  final TextDirection? textDirection;

  /// render chart\
  /// Default: Line
  // final RenderType? renderType;

  /// use one of this:\
  /// - DRenderLine
  /// - DRenderBar
  /// - DRenderTargetLine
  /// - DRenderPoint\
  /// Default: DRenderLine
  final _charts.SeriesRendererConfig<DateTime>? chartRender;

  /// flip chart vertical axis (measureAxis)
  final bool? flipVerticalAxis;

  /// visibility
  final bool? showMeasureLine;

  /// length label line\
  /// Default: 3
  final int? measureTickLength;

  /// set color measure line
  final Color? measureLineColor;

  /// line pattern
  final List<int>? measureLineDashPattern;

  /// thickness
  final int? measureLineThickness;

  /// label style for measureAxis
  /// available:
  /// - color
  /// - fontSize
  /// - height
  final TextStyle? measureLabelStyle;

  /// visibility
  final bool? showDomainLine;

  /// length label line\
  /// Default: 3
  final int? domainTickLength;

  /// set color domain line
  final Color? domainLineColor;

  /// line pattern
  final List<int>? domainLineDashPattern;

  /// thickness
  final int? domainLineThickness;

  /// label style for domainAxis
  /// available:
  /// - color
  /// - fontSize
  /// - height
  final TextStyle? domainLabelStyle;

  /// measure value start from zero\
  /// if false, will start from the minimum value\
  /// Work when there is just one group data\
  /// Default: true
  final bool? startFromZero;

  /// viewport domain limit\
  /// require [endDate]
  final DateTime? startDate;

  /// viewport domain limit\
  /// require [startDate]
  final DateTime? endDate;

  /// show default legend\
  /// Name: GroupId
  final bool? showLegend;

  /// legend position
  final DBehaviorPosition? legendPosition;

  /// legend align
  final DJustify? legendJustify;

  /// padding for legend
  final EdgeInsets? legendPadding;

  /// styling legend text/label
  final TextStyle? legendLabelStyle;

  /// set layout legend as horizontal
  final bool? legendHorizontally;

  /// connect with [legendHorizontally] when false\
  /// as much as possible to fill the available space in the row
  final int? legendMaxRow;

  /// connect with [legendHorizontally] when true\
  /// as much as possible to fill the available space in the column
  final int? legendMaxColumn;

  /// style value measure on legend
  /// will show when selected
  final LegendMeasure? legendMeasure;

  /// display title lagend
  final LegendTitle? legendTitle;

  /// set value on item data chart\
  /// Default: ''
  final CustomLabelValue? customLabelValue;

  /// fill area\
  /// default: group color with opacity 0.1
  final AreaColor? areaColor;

  /// symbol legend color
  /// default: groupColor
  final SeriesColor? seriesColor;

  /// set custom measure label\
  /// default: just value
  final MeasureLabel? measureLabel;

  /// set custom domain label\
  /// default: auto available from format 'MMM d'
  final DomainTimeLabel? domainLabel;

  const DChartTime({
    required this.groupData,
    this.animate,
    this.primaryColor,
    this.fillColor,
    this.changedListener,
    this.title,
    this.titlePosition,
    this.titleJustify,
    this.subtitle,
    this.innerPadding,
    this.outerPadding,
    this.titleStyle,
    this.subtitleStyle,
    this.titlePadding,
    this.textDirection,
    this.chartRender,
    this.flipVerticalAxis,
    this.showMeasureLine,
    this.measureTickLength,
    this.measureLineColor,
    this.measureLineDashPattern,
    this.measureLineThickness,
    this.measureLabelStyle,
    this.showDomainLine,
    this.domainTickLength,
    this.domainLabelStyle,
    this.domainLineColor,
    this.domainLineDashPattern,
    this.domainLineThickness,
    this.startFromZero,
    this.startDate,
    this.endDate,
    this.showLegend,
    this.legendJustify,
    this.legendPosition,
    this.legendPadding,
    this.legendLabelStyle,
    this.legendHorizontally,
    this.legendMaxRow,
    this.legendMaxColumn,
    this.legendMeasure,
    this.legendTitle,
    this.customLabelValue,
    this.areaColor,
    this.seriesColor,
    this.measureLabel,
    this.domainLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: textDirection ?? TextDirection.ltr,
      child: _charts.TimeSeriesChart(
        List.generate(groupData.length, (indexGroup) {
          DChartTimeGroup group = groupData[indexGroup];
          List<DChartTimeData> dataPergroup = group.data;
          // return List.generate(dataPergroup.length, (index) {
          Color colorPerGroup = groupData[indexGroup].groupColor ??
              Color((_math.Random().nextDouble() * 0xFFFFFF).toInt())
                  .withOpacity(1.0);
          return _charts.Series<DChartTimeData, DateTime>(
            id: group.groupId,
            data: List.generate(dataPergroup.length, (index) {
              return DChartTimeData(
                time: dataPergroup[index].time,
                value: dataPergroup[index].value,
                x: dataPergroup[index].x,
              );
            }).toList(),
            labelAccessorFn: (datum, index) {
              if (customLabelValue == null) return '';
              return customLabelValue!(group, datum, index);
            },
            domainFn: (datum, index) => datum.time,
            measureFn: (datum, index) => datum.value,
            colorFn: (datum, index) => _getColor(
              primaryColor == null
                  ? colorPerGroup
                  : primaryColor!(group, datum),
            ),
            areaColorFn: (datum, index) => _getColor(
              areaColor == null
                  ? colorPerGroup.withOpacity(0.1)
                  : areaColor!(group, datum, index),
            ),
            fillColorFn: (datum, index) => _getColor(
              fillColor == null
                  ? colorPerGroup
                  : fillColor!(group, datum, index),
            ),
            seriesColor: _getColor(
              seriesColor == null ? colorPerGroup : seriesColor!(group),
            ),
            displayName: legendTitle == null ? null : legendTitle!(group),
          );
          // }).toList();
        }),
        animate: false,
        flipVerticalAxis: flipVerticalAxis ?? false,
        defaultRenderer: chartRender,
        primaryMeasureAxis: _charts.NumericAxisSpec(
          showAxisLine: showMeasureLine,
          tickProviderSpec: _charts.BasicNumericTickProviderSpec(
            zeroBound: startFromZero ?? true,
          ),
          renderSpec: _charts.SmallTickRendererSpec(
            lineStyle: _charts.LineStyleSpec(
              color: measureLineColor == null
                  ? null
                  : _getColor(measureLineColor!),
              dashPattern: measureLineDashPattern,
              thickness: measureLineThickness,
            ),
            labelStyle: _getTextStyleSpec(measureLabelStyle),
            tickLengthPx: measureTickLength ?? 3,
            // labelAnchor: _charts.TickLabelAnchor.centered,
            // labelJustification: _charts.TickLabelJustification.inside,
          ),
          tickFormatterSpec: _charts.BasicNumericTickFormatterSpec(
            (measure) {
              if (measureLabel == null) return '$measure';
              return measureLabel!(measure);
            },
          ),
        ),
        domainAxis: _charts.DateTimeAxisSpec(
          showAxisLine: showDomainLine,
          viewport: (startDate != null && endDate != null)
              ? _charts.DateTimeExtents(
                  start: startDate!,
                  end: endDate!,
                )
              : null,
          renderSpec: _charts.SmallTickRendererSpec(
            lineStyle: _charts.LineStyleSpec(
              color:
                  domainLineColor == null ? null : _getColor(domainLineColor!),
              dashPattern: domainLineDashPattern,
              thickness: domainLineThickness,
            ),
            labelStyle: _getTextStyleSpec(domainLabelStyle),
            tickLengthPx: domainTickLength ?? 3,
          ),
          tickFormatterSpec: domainLabel == null
              ? null
              : _charts.BasicDateTimeTickFormatterSpec(
                  (datetime) => domainLabel!(datetime),
                ),
        ),
        behaviors: [
          if (title != null)
            _charts.ChartTitle(
              title!,
              behaviorPosition: _getBehaviorPosition(titlePosition),
              subTitle: subtitle,
              titleOutsideJustification: _getOutsideJustify(titleJustify),
              innerPadding: innerPadding ?? 0,
              outerPadding: outerPadding ?? 0,
              titleStyleSpec: titleStyle == null
                  ? null
                  : _charts.TextStyleSpec(
                      color: titleStyle!.color == null
                          ? null
                          : _charts.ColorUtil.fromDartColor(titleStyle!.color!),
                      fontSize: titleStyle!.fontSize?.toInt(),
                      lineHeight: titleStyle!.height,
                    ),
              subTitleStyleSpec: _getTextStyleSpec(subtitleStyle!),
              titlePadding: titlePadding ?? 0,
            ),
          if (showLegend ?? false)
            _charts.SeriesLegend(
              outsideJustification: _getOutsideJustify(legendJustify),
              cellPadding: legendPadding,
              position: _getBehaviorPosition(legendPosition),
              entryTextStyle: _getTextStyleSpec(legendLabelStyle),
              horizontalFirst: legendHorizontally,
              desiredMaxRows: legendMaxRow,
              desiredMaxColumns: legendMaxColumn,
              measureFormatter: legendMeasure,
              showMeasures: legendMeasure != null,
              legendDefaultMeasure: _charts.LegendDefaultMeasure.none,
            ),
          _charts.LinePointHighlighter(
            showHorizontalFollowLine:
                _charts.LinePointHighlighterFollowLineType.nearest,
            showVerticalFollowLine:
                _charts.LinePointHighlighterFollowLineType.nearest,
          ),
          _charts.SelectNearest(
            eventTrigger: _charts.SelectionTrigger.tapAndDrag,
          ),
        ],
        selectionModels: [
          _charts.SelectionModelConfig(
            type: _charts.SelectionModelType.info,
            changedListener: (model) {
              if (model.selectedDatum.isNotEmpty) {
                if (model.selectedDatum.first.datum is DChartTimeData) {
                  DChartTimeData item = model.selectedDatum.first.datum;
                  if (model.selectedSeries.isNotEmpty) {
                    if (changedListener != null) {
                      changedListener!(model.selectedSeries.first.id, item);
                    }
                  }
                }
              }
            },
          ),
        ],
      ),
    );
  }

  _charts.OutsideJustification? _getOutsideJustify(DJustify? justify) {
    switch (justify) {
      case DJustify.start:
        return _charts.OutsideJustification.start;
      case DJustify.startDrawArea:
        return _charts.OutsideJustification.startDrawArea;
      case DJustify.middle:
        return _charts.OutsideJustification.middle;
      case DJustify.middleDrawArea:
        return _charts.OutsideJustification.middleDrawArea;
      case DJustify.end:
        return _charts.OutsideJustification.end;
      case DJustify.endDrawArea:
        return _charts.OutsideJustification.endDrawArea;
      default:
        return null;
    }
  }
}

class DRenderLine extends _charts.SeriesRendererConfig<DateTime> {
  /// icon for all legend
  final IconData? legendIcon;

  /// set line visible\
  /// default: true
  final bool? showLine;

  /// set point visible\
  /// default: false
  final bool? showPoint;

  /// set area visible\
  /// default: false
  final bool? showArea;

  /// 0-1\
  /// default: 0.1
  final double? opacityArea;

  /// pattern for line
  final List<int>? dashPattern;

  /// size of point line\
  /// default: 3.5
  final double? pointSize;

  /// stroke width of line\
  /// default: 2
  final double? strokeWidth;

  DRenderLine({
    this.legendIcon,
    this.showLine,
    this.showPoint,
    this.showArea,
    this.opacityArea,
    this.dashPattern,
    this.pointSize,
    this.strokeWidth,
  });

  @override
  _charts.SeriesRenderer<DateTime> build() {
    return _charts.LineRenderer(
      config: _charts.LineRendererConfig(
        symbolRenderer: legendIcon == null ? null : _IconRenderer(legendIcon!),
        includeArea: showArea ?? false,
        areaOpacity: opacityArea == null
            ? 0.1
            : opacityArea! > 1
                ? 1
                : opacityArea! < 0
                    ? 0
                    : opacityArea!,
        dashPattern: dashPattern,
        includeLine: showLine ?? true,
        includePoints: showPoint ?? false,
        radiusPx: pointSize ?? 3.5,
        strokeWidthPx: strokeWidth ?? 2,
      ),
    );
  }

  @override
  String? get customRendererId => null;

  @override
  RendererAttributes get rendererAttributes => RendererAttributes();

  @override
  SymbolRenderer? get symbolRenderer => null;
}

class DRenderBar extends _charts.SeriesRendererConfig<DateTime> {
  /// icon for all legend
  final IconData? legendIcon;

  /// radius for corner bar\
  /// default: 0
  final int? barRadius;

  /// stroke width of line\
  /// default: 0
  final double? borderWidth;

  /// size width of bar\
  /// if null, auto\
  /// default: null
  final int? maxBarWidth;

  /// label position
  final RBLabelPosition? labelPosition;

  /// label style\
  /// active when position is inside\
  /// available:
  /// - color
  /// - fontSize
  /// - height
  final TextStyle? insideLabelStyle;

  /// label style\
  /// active when position is outside\
  /// available:
  /// - color
  /// - fontSize
  /// - height
  final TextStyle? outsideLabelStyle;

  /// align for ```dart RBLabelPosition.inside```\
  /// default: RBLabelAlign.start
  final RBLabelAlign? labelAlign;

  /// default: 5
  final int? labelSpace;

  /// if true, fill pattern will be solid\
  /// if false, fill pattern will be forwardHatch\
  /// default: true
  final bool? solidFill;

  /// type when data is group\
  /// default: RBGroupType.grouped
  final RBGroupType? groupType;

  /// space beetween bar group\
  /// default: 2
  final int? innerPaddingGroup;

  DRenderBar({
    this.legendIcon,
    this.barRadius,
    this.borderWidth,
    this.maxBarWidth,
    this.labelPosition,
    this.insideLabelStyle,
    this.outsideLabelStyle,
    this.labelAlign,
    this.labelSpace,
    this.solidFill,
    this.groupType,
    this.innerPaddingGroup,
  });

  @override
  _charts.SeriesRenderer<DateTime> build() {
    return _charts.BarRenderer(
      config: _charts.BarRendererConfig(
        symbolRenderer: legendIcon == null ? null : _IconRenderer(legendIcon!),
        strokeWidthPx: borderWidth ?? 2,
        cornerStrategy: _charts.ConstCornerStrategy(barRadius ?? 0),
        maxBarWidthPx: maxBarWidth,
        barRendererDecorator: _charts.BarLabelDecorator(
          labelPosition: _getBarLabelPosition(labelPosition),
          insideLabelStyleSpec: _getTextStyleSpec(insideLabelStyle),
          outsideLabelStyleSpec: _getTextStyleSpec(outsideLabelStyle),
          labelAnchor: _getBarLabelAnchor(labelAlign),
          labelPadding: labelSpace ?? 5,
        ),
        fillPattern: (solidFill ?? true)
            ? _charts.FillPatternType.solid
            : _charts.FillPatternType.forwardHatch,
        groupingType: _getBarGroupingType(groupType),
        barGroupInnerPaddingPx: innerPaddingGroup ?? 2,
      ),
    );
  }

  @override
  String? get customRendererId => null;

  @override
  RendererAttributes get rendererAttributes => RendererAttributes();

  @override
  SymbolRenderer? get symbolRenderer => null;
}

class DRenderTargetLine extends _charts.SeriesRendererConfig<DateTime> {
  /// icon for all legend
  final IconData? legendIcon;

  /// stroke width of line\
  /// default: 0
  final double? borderWidth;

  /// type when data is group\
  /// default: RBGroupType.grouped
  final RBGroupType? groupType;

  /// space beetween bar group\
  /// default: 2
  final int? innerPaddingGroup;

  /// pattern for line bar
  final List<int>? dashPattern;

  /// additional & substraction target line\
  /// bigger than 0, will getting longer\
  /// less than 0, will getting shorter
  /// direction: approaching groups in the same domain\
  /// default: 0
  final int? overInner;

  /// additional & substraction target line\
  /// bigger than 0, will getting longer\
  /// less than 0, will getting shorter
  /// direction: stay away from groups in the same domain\
  /// default: 0
  final int? overOuter;

  DRenderTargetLine({
    this.legendIcon,
    this.borderWidth,
    this.groupType,
    this.innerPaddingGroup,
    this.dashPattern,
    this.overInner,
    this.overOuter,
  });

  @override
  _charts.SeriesRenderer<DateTime> build() {
    return _charts.BarTargetLineRenderer(
      config: _charts.BarTargetLineRendererConfig(
        symbolRenderer: legendIcon == null ? null : _IconRenderer(legendIcon!),
        strokeWidthPx: borderWidth ?? 2,
        dashPattern: dashPattern,
        overDrawOuterPx: overOuter ?? 0,
        overDrawPx: overInner ?? 0,
        groupingType: _getBarGroupingType(groupType),
        barGroupInnerPaddingPx: innerPaddingGroup ?? 2,
      ),
    );
  }

  @override
  String? get customRendererId => null;

  @override
  RendererAttributes get rendererAttributes => RendererAttributes();

  @override
  SymbolRenderer? get symbolRenderer => null;
}

class DRenderPoint extends _charts.SeriesRendererConfig<DateTime> {
  /// icon for all legend
  final IconData? legendIcon;

  /// stroke width of line\
  /// default: 0
  final double? borderWidth;

  /// default: 3.5
  final double? pointSize;

  DRenderPoint({
    this.legendIcon,
    this.borderWidth,
    this.pointSize,
  });

  @override
  _charts.SeriesRenderer<DateTime> build() {
    return _charts.PointRenderer(
      config: _charts.PointRendererConfig(
        symbolRenderer: legendIcon == null ? null : _IconRenderer(legendIcon!),
        strokeWidthPx: borderWidth ?? 2,
        radiusPx: pointSize ?? 3.5,
      ),
    );
  }

  @override
  String? get customRendererId => null;

  @override
  RendererAttributes get rendererAttributes => RendererAttributes();

  @override
  SymbolRenderer? get symbolRenderer => null;
}
