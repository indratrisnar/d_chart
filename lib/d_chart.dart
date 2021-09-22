library d_chart;

import 'package:charts_flutter/flutter.dart' as _charts;
import 'package:flutter/material.dart';

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

String _defaultBarValue(Map<String, dynamic> barData, int? index) => '';

class DChart {
  static Widget bar({
    required List<Map<String, dynamic>> data,
    required BarColor<Color> barColor,
    BarValue<String> barValue = _defaultBarValue,
    BarValueAnchor? barValueAnchor,
    BarValuePosition? barValuePosition,
    int? barValueFontSize = 14,
    Color? barValueColor,
    bool showBarValue = false,
    Color? borderColor,
    double? borderWidth,
    bool? animate,
    Duration? animationDuration,
    bool verticalDirection = true,
    bool? showMeasureLine,
    bool? showDomainLine,
    Color? axisLineColor,
    int? axisLineTick,
    int? axisLinePointTick,
    int? axisLinePointWidth,
    int? domainLabelRotation,
    int? domainLabelFontSize,
    Color? domainLabelColor,
    int? domainLabelPaddingToTick,
    int? domainLabelPaddingToAxisLine,
    int? measureLabelRotation,
    int? measureLabelFontSize,
    int? measureLabelPaddingToTick,
    int? measureLabelPaddingToAxisLine,
    Color? measureLabelColor,
    int? measureMin,
    int? measureMax,
    String? yAxisTitle,
    Color yAxisTitleColor = Colors.black,
    int yAxisTitleFontSize = 14,
    int yAxisTitleInPadding = 8,
    int yAxisTitleOutPadding = 0,
    TitlePositionY yAxisTitlePosition = TitlePositionY.left,
    String? xAxisTitle,
    Color xAxisTitleColor = Colors.black,
    int xAxisTitleFontSize = 14,
    int xAxisTitleInPadding = 8,
    int xAxisTitleOutPadding = 0,
    TitlePositionX xAxisTitlePosition = TitlePositionX.bottom,
    int? minimumPaddingBetweenLabel,
  }) {
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
              : _charts.ColorUtil.fromDartColor(borderColor),
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
                : _charts.ColorUtil.fromDartColor(axisLineColor),
            thickness: axisLineTick,
          ),
          labelAnchor: _charts.TickLabelAnchor.centered,
          lineStyle: _charts.LineStyleSpec(
            color: axisLineColor == null
                ? null
                : _charts.ColorUtil.fromDartColor(axisLineColor),
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
                : _charts.ColorUtil.fromDartColor(axisLineColor),
            thickness: axisLineTick,
          ),
          labelAnchor: _charts.TickLabelAnchor.centered,
          lineStyle: _charts.LineStyleSpec(
            color: axisLineColor == null
                ? null
                : _charts.ColorUtil.fromDartColor(axisLineColor),
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
            ? _charts.NumericExtents(measureMin, measureMax)
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

  static Widget line({
    required List<Map<String, dynamic>> data,
    required LineColor<Color> lineColor,
    LineColor<Color>? pointColor,
    LineColor<Color>? areaColor,
    bool includeArea = false,
    bool includePoints = false,
    double? lineWidth,
    bool? animate,
    Duration? animationDuration,
  }) {
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
              pointColor(datum, index, groupBarData['id']),
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

  static Widget pie({
    required List<Map<String, dynamic>> data,
    required PieColor fillColor,
    PieLabel? pieLabel,
    bool? animate,
    Duration? animationDuration,
    PieLabelPosition labelPosition = PieLabelPosition.auto,
    int labelFontSize = 12,
    Color labelColor = Colors.black,
    bool showLabelLine = true,
    Color labelLineColor = Colors.black,
    double labelLinelength = 16,
    double labelLineThickness = 1,
    int labelPadding = 5,
    int? donutWidth,
    double strokeWidth = 2,
  }) {
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
                : pieLabel(datum, index);
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

  static Widget gauge({
    required List<Map<String, dynamic>> data,
    required PieColor fillColor,
    PieLabel? pieLabel,
    bool? animate,
    Duration? animationDuration,
    PieLabelPosition labelPosition = PieLabelPosition.auto,
    int labelFontSize = 12,
    Color labelColor = Colors.black,
    bool showLabelLine = true,
    Color labelLineColor = Colors.black,
    double labelLinelength = 16,
    double labelLineThickness = 1,
    int labelPadding = 5,
    int? donutWidth,
    double strokeWidth = 2,
  }) {
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
                : pieLabel(datum, index);
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

  static _charts.TextStyleSpec _textStyleSpec(int? fontSize, Color? color) {
    return _charts.TextStyleSpec(
      color: color == null ? null : _charts.ColorUtil.fromDartColor(color),
      fontSize: fontSize,
    );
  }

  static _charts.BehaviorPosition? _getTitlePositionX(
      TitlePositionX? position) {
    switch (position) {
      case TitlePositionX.top:
        return _charts.BehaviorPosition.top;
      case TitlePositionX.bottom:
        return _charts.BehaviorPosition.bottom;
      default:
        return null;
    }
  }

  static _charts.BehaviorPosition? _getTitlePositionY(
      TitlePositionY? position) {
    switch (position) {
      case TitlePositionY.left:
        return _charts.BehaviorPosition.start;

      case TitlePositionY.right:
        return _charts.BehaviorPosition.end;

      default:
        return null;
    }
  }

  static _charts.BarLabelAnchor? _getBarValueAnchor(BarValueAnchor? position) {
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

  static _charts.BarLabelPosition _getBarValuePosition(
      BarValuePosition? position) {
    switch (position) {
      case BarValuePosition.inside:
        return _charts.BarLabelPosition.inside;
      case BarValuePosition.outside:
        return _charts.BarLabelPosition.outside;
      default:
        return _charts.BarLabelPosition.auto;
    }
  }

  static _charts.ArcLabelPosition _getPieLabelPosition(
      PieLabelPosition position) {
    switch (position) {
      case PieLabelPosition.inside:
        return _charts.ArcLabelPosition.inside;
      case PieLabelPosition.outside:
        return _charts.ArcLabelPosition.outside;
      default:
        return _charts.ArcLabelPosition.auto;
    }
  }
}

enum TitlePositionX { top, bottom }
enum TitlePositionY { left, right }
enum BarValueAnchor { start, middle, end }
enum BarValuePosition { inside, outside, auto }
enum PieLabelPosition { inside, outside, auto }
