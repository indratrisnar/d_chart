import 'package:community_charts_common/community_charts_common.dart' as common;
import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;

import 'enums.dart';
import 'method_common.dart';
import 'symbol_render.dart';

abstract class ConfigRender {}

class ConfigRenderLine extends ConfigRender {
  /// Radius of points on the line, if [includePoints] is enabled.
  final double radiusPx;

  /// Stroke width of the line.
  final double strokeWidthPx;

  /// Dash pattern for the line.
  final List<int>? dashPattern;

  /// Configures whether a line representing the data will be drawn.
  final bool includeLine;

  /// Configures whether points representing the data will be drawn.
  final bool includePoints;

  /// Configures whether an area skirt representing the data will be drawn.
  ///
  /// An area skirt will be drawn from the line for each series, down to the
  /// domain axis. It will be layered underneath the primary line on the chart.
  ///
  /// The area skirt color will be a semi-transparent version of the series
  /// color, using [areaOpacity] as the opacity.
  ///
  /// When stacking is enabled, the bottom of each area skirt will instead be
  /// the previous line in the stack. The bottom area will be drawn down to the
  /// domain axis.
  final bool includeArea;

  /// Configures the opacity of the area skirt on the chart.\
  /// 0 - 1
  final double areaOpacity;

  /// Whether lines should have round end caps, or square if false.
  final bool roundEndCaps;

  ConfigRenderLine({
    this.radiusPx = 3.5,
    this.strokeWidthPx = 2.0,
    this.dashPattern,
    this.includeLine = true,
    this.includePoints = false,
    this.includeArea = false,
    this.areaOpacity = 0.1,
    this.roundEndCaps = false,
  });

  common.SeriesRendererConfig<num> getRenderNumeric(String? renderId) {
    return common.LineRendererConfig(
      customRendererId: renderId,
      areaOpacity: areaOpacity,
      dashPattern: dashPattern,
      includeArea: includeArea,
      includeLine: includeLine,
      includePoints: includePoints,
      radiusPx: radiusPx,
      roundEndCaps: roundEndCaps,
      strokeWidthPx: strokeWidthPx,
    );
  }

  common.SeriesRendererConfig<String> getRenderOrdinal(String? renderId) {
    return common.LineRendererConfig(
      customRendererId: renderId,
      areaOpacity: areaOpacity,
      dashPattern: dashPattern,
      includeArea: includeArea,
      includeLine: includeLine,
      includePoints: includePoints,
      radiusPx: radiusPx,
      roundEndCaps: roundEndCaps,
      strokeWidthPx: strokeWidthPx,
    );
  }

  common.SeriesRendererConfig<DateTime> getRenderTime(String? renderId) {
    return common.LineRendererConfig(
      customRendererId: renderId,
      areaOpacity: areaOpacity,
      dashPattern: dashPattern,
      includeArea: includeArea,
      includeLine: includeLine,
      includePoints: includePoints,
      radiusPx: radiusPx,
      roundEndCaps: roundEndCaps,
      strokeWidthPx: strokeWidthPx,
    );
  }
}

class ConfigRenderBar extends ConfigRender {
  /// default: 2
  final int barGroupInnerPaddingPx;

  /// fill type\
  /// default: FillPattern.solid
  final FillPattern fillPattern;

  /// bar radius\
  /// default: 2
  final int radius;

  /// type group\
  /// default: BarGroupingType.grouped
  final BarGroupingType barGroupingType;

  /// maximum bar width
  final int? maxBarWidthPx;

  /// minimum bar length\
  /// default: 0
  final int minBarLengthPx;

  /// padding between bar group stack\
  /// default: 1\
  /// be affected by `strokeWidthPx`\
  /// to show padding? `stackedBarPaddingPx` > `strokeWidthPx`
  /// && `barGroupingType` is `BarGroupingType.stacked` or `BarGroupingType.groupedStacked`
  final int stackedBarPaddingPx;

  /// stroke or border width\
  /// default: 0.0\
  final double strokeWidthPx;

  /// pattern weight bar
  final List<int>? weightPattern;

  ConfigRenderBar({
    this.barGroupInnerPaddingPx = 2,
    this.fillPattern = FillPattern.solid,
    this.radius = 2,
    this.barGroupingType = BarGroupingType.grouped,
    this.maxBarWidthPx,
    this.minBarLengthPx = 0,
    this.stackedBarPaddingPx = 1,
    this.strokeWidthPx = 0.0,
    this.weightPattern,
  });

  common.SeriesRendererConfig<num> getRenderNumeric(
    String? renderId,
    BarLabelDecorator? barLabelDecorator,
  ) {
    return common.BarRendererConfig(
      customRendererId: renderId,
      barGroupInnerPaddingPx: barGroupInnerPaddingPx,
      fillPattern: MethodCommon.fillPattern(fillPattern),
      cornerStrategy: common.ConstCornerStrategy(radius),
      groupingType: MethodCommon.barGroupingType(barGroupingType),
      maxBarWidthPx: maxBarWidthPx,
      minBarLengthPx: minBarLengthPx,
      stackedBarPaddingPx: stackedBarPaddingPx,
      strokeWidthPx: strokeWidthPx,
      weightPattern: weightPattern,
      barRendererDecorator: barLabelDecorator?.getRenderNumeric(),
    );
  }

  common.SeriesRendererConfig<String> getRenderOrdinal(
    String? renderId,
    BarLabelDecorator? barLabelDecorator,
  ) {
    return common.BarRendererConfig(
      customRendererId: renderId,
      barGroupInnerPaddingPx: barGroupInnerPaddingPx,
      fillPattern: MethodCommon.fillPattern(fillPattern),
      cornerStrategy: common.ConstCornerStrategy(radius),
      groupingType: MethodCommon.barGroupingType(barGroupingType),
      maxBarWidthPx: maxBarWidthPx,
      minBarLengthPx: minBarLengthPx,
      stackedBarPaddingPx: stackedBarPaddingPx,
      strokeWidthPx: strokeWidthPx,
      weightPattern: weightPattern,
      barRendererDecorator: barLabelDecorator?.getRenderOrdinal(),
    );
  }

  common.SeriesRendererConfig<DateTime> getRenderTime(
    String? renderId,
    BarLabelDecorator? barLabelDecorator,
  ) {
    return common.BarRendererConfig(
      customRendererId: renderId,
      barGroupInnerPaddingPx: barGroupInnerPaddingPx,
      fillPattern: MethodCommon.fillPattern(fillPattern),
      cornerStrategy: common.ConstCornerStrategy(radius),
      groupingType: MethodCommon.barGroupingType(barGroupingType),
      maxBarWidthPx: maxBarWidthPx,
      minBarLengthPx: minBarLengthPx,
      stackedBarPaddingPx: stackedBarPaddingPx,
      strokeWidthPx: strokeWidthPx,
      weightPattern: weightPattern,
      barRendererDecorator: barLabelDecorator?.getRenderTime(),
    );
  }
}

class ConfigRenderPoint extends ConfigRender {
  /// size plot point\
  /// default: 3.5
  final double radiusPx;

  /// render for symbol plot point
  /// - SymbolRenderCircle
  /// - SymbolRenderLine
  /// - SymbolRenderRect
  /// - SymbolRenderTriangle
  final SymbolRender? symbolRender;

  /// Stroke width of the target line.\
  /// as border in `SymbolRenderCircle`
  final double strokeWidthPx;

  ConfigRenderPoint({
    this.radiusPx = 3.5,
    this.symbolRender,
    this.strokeWidthPx = 0.0,
  });
  common.SeriesRendererConfig<num> getRenderNumeric(String? renderId) {
    return charts.PointRendererConfig(
      customRendererId: renderId,
      radiusPx: radiusPx,
      strokeWidthPx: strokeWidthPx,
      symbolRenderer: symbolRender?.getRenderer(),
    );
  }

  common.SeriesRendererConfig<String> getRenderOrdinal(String? renderId) {
    return charts.PointRendererConfig(
      customRendererId: renderId,
      radiusPx: radiusPx,
      strokeWidthPx: strokeWidthPx,
      symbolRenderer: symbolRender?.getRenderer(),
    );
  }

  common.SeriesRendererConfig<DateTime> getRenderTime(String? renderId) {
    return charts.PointRendererConfig(
      customRendererId: renderId,
      radiusPx: radiusPx,
      strokeWidthPx: strokeWidthPx,
      symbolRenderer: symbolRender?.getRenderer(),
    );
  }
}

class BarLabelDecorator {
  /// position label bar chart item
  final BarLabelAnchor? labelAnchor;

  /// Configures where to place the label relative to the bars.\
  /// default: `BarLabelPosition.auto`
  final BarLabelPosition barLabelPosition;

  /// Space before and after the label text.\
  /// default: 5
  final int labelPadding;

  BarLabelDecorator({
    this.labelAnchor,
    this.labelPadding = 5,
    this.barLabelPosition = BarLabelPosition.auto,
  });

  common.BarLabelDecorator<num> getRenderNumeric() {
    return common.BarLabelDecorator(
      labelAnchor: MethodCommon.barLabelAnchor(labelAnchor),
      labelPadding: labelPadding,
      labelPosition: MethodCommon.barLabelPosition(barLabelPosition),
    );
  }

  common.BarLabelDecorator<String> getRenderOrdinal() {
    return common.BarLabelDecorator(
      labelAnchor: MethodCommon.barLabelAnchor(labelAnchor),
      labelPadding: labelPadding,
      labelPosition: MethodCommon.barLabelPosition(barLabelPosition),
    );
  }

  common.BarLabelDecorator<DateTime> getRenderTime() {
    return common.BarLabelDecorator(
      labelAnchor: MethodCommon.barLabelAnchor(labelAnchor),
      labelPadding: labelPadding,
      labelPosition: MethodCommon.barLabelPosition(barLabelPosition),
    );
  }
}
