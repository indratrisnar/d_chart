library d_chart;

import 'package:charts_flutter/flutter.dart' as _charts;
import 'package:flutter/material.dart';

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

  /// [yAxisTitle] return title for y/vertical axis
  String? yAxisTitle;

  /// [yAxisTitleColor] return color for title yAxis
  /// Default: Colors.black
  Color yAxisTitleColor;

  /// [yAxisTitleFontSize] return fontSize for title yAxis
  /// Default: 14
  int yAxisTitleFontSize;

  /// [yAxisTitleInPadding] return padding between title and yAxis
  /// Default: 8
  int yAxisTitleInPadding;

  /// [yAxisTitleOutPadding] return padding between title and out box / margin
  /// Default: 0
  int yAxisTitleOutPadding;

  /// [yAxisTitlePosition] return TitlePositionY
  /// Default: TitlePositionY.left
  TitlePositionY yAxisTitlePosition;

  /// [xAxisTitle] return title for x/horizontal axis
  String? xAxisTitle;

  /// [yAxisTitleColor] return color for title xAxis
  /// Default: Colors.black
  Color xAxisTitleColor;

  /// [xAxisTitleFontSize] return fontSize for title xAxis
  /// Default: 14
  int xAxisTitleFontSize;

  /// [xAxisTitleInPadding] return padding between title and xAxis
  /// Default: 8
  int xAxisTitleInPadding;

  /// [xAxisTitleOutPadding] return padding between title and out box / margin
  /// Default: 0
  int xAxisTitleOutPadding;

  /// [xAxisTitlePosition] return TitlePositionX
  /// Default: TitlePositionX.bottom
  TitlePositionX xAxisTitlePosition;

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
    this.xAxisTitleColor = Colors.black,
    this.xAxisTitleFontSize = 14,
    this.xAxisTitleInPadding = 8,
    this.xAxisTitleOutPadding = 0,
    this.xAxisTitlePosition = TitlePositionX.bottom,
    this.yAxisTitle,
    this.yAxisTitleColor = Colors.black,
    this.yAxisTitleFontSize = 14,
    this.yAxisTitleInPadding = 8,
    this.yAxisTitleOutPadding = 0,
    this.yAxisTitlePosition = TitlePositionY.left,
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
          behaviorPosition: _getTitlePositionY(yAxisTitlePosition),
          titleStyleSpec: _textStyleSpec(yAxisTitleFontSize, yAxisTitleColor),
          outerPadding: yAxisTitleInPadding,
          innerPadding: yAxisTitleOutPadding,
          layoutPreferredSize: yAxisTitle == null ? 0 : null,
        ),
        _charts.ChartTitle(
          xAxisTitle ?? '',
          behaviorPosition: _getTitlePositionX(xAxisTitlePosition),
          titleStyleSpec: _textStyleSpec(xAxisTitleFontSize, xAxisTitleColor),
          outerPadding: xAxisTitleOutPadding,
          innerPadding: xAxisTitleInPadding,
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
