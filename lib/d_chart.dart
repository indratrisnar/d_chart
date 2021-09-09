library d_chart;

import 'package:charts_flutter/flutter.dart' as _charts;
import 'package:flutter/material.dart';

typedef BarColor<Color> = Color Function(
    Map<String, dynamic> barData, int? index);
Color setColorBar(
    BarColor<Color> barColor, Map<String, dynamic> barData, int? index) {
  return barColor(barData, index);
}

class DChart {
  static Widget bar({
    required List<Map<String, dynamic>> data,
    required BarColor<Color> colorBar,
    Color? borderColor,
    double? borderWidth,
    bool? animate,
    Duration? animationDuration,
    bool interaction = true,
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
    bool showBarValue = false,
    int? valueInBarFontSize = 14,
    Color? valueInBarColor,
    int? valueOutBarFontSize = 14,
    Color? valueOutBarColor,
  }) {
    axisLinePointTick = axisLinePointTick ?? axisLineTick;
    return _charts.BarChart(
      [
        _charts.Series<Map<String, dynamic>, String>(
          id: 'Sales',
          domainFn: (Map<String, dynamic> axis, _) => axis['domain'],
          measureFn: (Map<String, dynamic> axis, _) => axis['measure'],
          data: data,
          fillColorFn: (datum, index) {
            return _charts.ColorUtil.fromDartColor(colorBar(datum, index));
          },
          labelAccessorFn: (datum, index) => datum['measure'].toString(),
          strokeWidthPxFn: (datum, index) => borderWidth,
          seriesColor: borderColor == null
              ? null
              : _charts.ColorUtil.fromDartColor(borderColor),
          overlaySeries: true,
        ),
      ],
      barRendererDecorator: showBarValue
          ? _charts.BarLabelDecorator(
              labelAnchor: _charts.BarLabelAnchor.end,
              outsideLabelStyleSpec:
                  _textStyleSpec(valueOutBarFontSize, valueOutBarColor),
              insideLabelStyleSpec:
                  _textStyleSpec(valueInBarFontSize, valueInBarColor),
              labelPadding: 16,
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
          // labelJustification: _charts.TickLabelJustification.outside,
          labelOffsetFromAxisPx: measureLabelPaddingToAxisLine,
          labelOffsetFromTickPx: measureLabelPaddingToTick,
        ),
        showAxisLine: showMeasureLine,
        viewport: measureMin != null && measureMax != null
            ? _charts.NumericExtents(measureMin, measureMax)
            : null,
      ),
      animate: animate,
      animationDuration: animationDuration,
      defaultInteractions: interaction,
      vertical: verticalDirection,
    );
  }

  static _charts.TextStyleSpec _textStyleSpec(int? fontSize, Color? color) {
    return _charts.TextStyleSpec(
      color: color == null ? null : _charts.ColorUtil.fromDartColor(color),
      fontSize: fontSize,
    );
  }
}
