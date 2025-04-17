part of '../../d_chart.dart';

abstract class ConfigSeriesPie<G, D, T> extends ConfigSeries<G, D, T> {
  const ConfigSeriesPie({
    super.seriesColor,
    super.customColor,
    // super.areaColor,
    super.fillColor,
    super.fillPattern,
    // super.dashPattern,
    super.labelAccessor,
    super.strokeWidthPx,
    // super.radiusPx,
    // super.measureOffset,
    super.domain,
    super.domainLowerBound,
    super.domainUpperBound,
    super.measure,
    super.measureLowerBound,
    super.measureUpperBound,
    this.arcLength = math.pi * 2,
    this.arcWidth,
    this.arcLabelDecorator,
    this.arcRatio,
    this.startAngle = -math.pi / 2,
    // this.strokeWidthPx = 2.0,
  });

  /// Total arc length, in radians.
  ///
  /// The default arcLength is 2π.
  final double arcLength;

  /// If set, configures the arcWidth to be a percentage of the radius.
  final double? arcRatio;

  /// Fixed width of the arc within the radius.
  ///
  /// If arcRatio is set, this value will be ignored.
  final int? arcWidth;

  /// Start angle for pie slices, in radians.
  ///
  /// Angles are defined from the positive x axis in Cartesian space. The
  /// default startAngle is -π/2.
  final double startAngle;

  /// Stroke width of the border of the arcs.
  // final double strokeWidthPx;

  final ArcLabelDecorator<T>? arcLabelDecorator;

  @override
  common.ArcRendererConfig<T> getRenderConfig() {
    return common.ArcRendererConfig<T>(
      arcLength: arcLength,
      arcWidth: arcWidth,
      arcRendererDecorators: [
        if (arcLabelDecorator != null) arcLabelDecorator!.render(),
      ],
      startAngle: startAngle,
      // strokeWidthPx: strokeWidthPx,
      arcRatio: arcRatio,
    );
  }
}

class ConfigSeriesPieN extends ConfigSeriesPie<NumericGroup, NumericData, num> {
  const ConfigSeriesPieN({
    super.seriesColor,
    super.customColor,
    // super.areaColor,
    super.fillColor,
    super.fillPattern,
    // super.dashPattern,
    super.labelAccessor,
    super.strokeWidthPx,
    // super.radiusPx,
    // super.measureOffset,
    super.domain,
    super.domainLowerBound,
    super.domainUpperBound,
    super.measure,
    super.measureLowerBound,
    super.measureUpperBound,
    super.arcLength,
    super.arcWidth,
    super.arcLabelDecorator,
    super.arcRatio,
    super.startAngle,
    // super.strokeWidthPx = 2.0,
  });
}

class ConfigSeriesPieO
    extends ConfigSeriesPie<OrdinalGroup, OrdinalData, String> {
  const ConfigSeriesPieO({
    super.seriesColor,
    super.customColor,
    // super.areaColor,
    super.fillColor,
    super.fillPattern,
    // super.dashPattern,
    super.labelAccessor,
    super.strokeWidthPx,
    // super.radiusPx,
    // super.measureOffset,
    super.domain,
    super.domainLowerBound,
    super.domainUpperBound,
    super.measure,
    super.measureLowerBound,
    super.measureUpperBound,
    super.arcLength,
    super.arcWidth,
    super.arcLabelDecorator,
    super.arcRatio,
    super.startAngle,
    // super.strokeWidthPx = 2.0,
  });
}

class ConfigSeriesPieT extends ConfigSeriesPie<TimeGroup, TimeData, DateTime> {
  const ConfigSeriesPieT({
    super.seriesColor,
    super.customColor,
    // super.areaColor,
    super.fillColor,
    super.fillPattern,
    // super.dashPattern,
    super.labelAccessor,
    super.strokeWidthPx,
    // super.radiusPx,
    // super.measureOffset,
    super.domain,
    super.domainLowerBound,
    super.domainUpperBound,
    super.measure,
    super.measureLowerBound,
    super.measureUpperBound,
    super.arcLength,
    super.arcWidth,
    super.arcLabelDecorator,
    super.arcRatio,
    super.startAngle,
    // super.strokeWidthPx = 2.0,
  });
}
