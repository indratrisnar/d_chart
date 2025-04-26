part of '../../d_chart.dart';

abstract class ConfigSeriesBarTargetLine<G, D, T>
    extends ConfigSeries<G, D, T> {
  const ConfigSeriesBarTargetLine({
    // super.seriesColor,
    super.customColor,
    // super.areaColor,
    // super.fillColor,
    super.strokeGradient,
    super.targetLineGradient,
    // super.fillPattern,
    super.dashPattern,
    // super.labelAccessor,
    super.strokeWidthPx,
    // super.radiusPx,
    super.measureOffset,
    super.domain,
    // super.domainLowerBound,
    // super.domainUpperBound,
    super.measure,
    // super.measureLowerBound,
    // super.measureUpperBound,
    this.barGroupInnerPaddingPx = 2,
    this.barGroupingType = BarGroupingType.grouped,
    this.weightPattern,
    this.dashPatternBase,
    this.overDrawOuterPx,
    this.overDrawPx = 0,
    this.roundEndCaps = true,
  }) : super();

  /// type group\
  /// default: BarGroupingType.grouped
  final BarGroupingType barGroupingType;

  /// default: 2
  final int barGroupInnerPaddingPx;

  /// Sets the series weight pattern. This is a pattern of weights used to
  /// calculate the width of bars within a bar group. If not specified, each bar
  /// in the group will have an equal width.
  ///
  /// The pattern will not repeat. If more series are assigned to the renderer
  /// than there are segments in the weight pattern, an error will be thrown.
  ///
  /// e.g. For the pattern [2, 1], the first bar in a group should be rendered
  /// twice as wide as the second bar.
  ///
  /// If the expected bar width of the chart is 12px, then the first bar will
  /// render at 16px and the second will render at 8px. The default weight
  /// pattern of null means that all bars should be the same width, or 12px in
  /// this case.
  ///
  /// Not used for stacked bars.
  final List<int>? weightPattern;

  final List<int>? dashPatternBase;

  /// The number of pixels that the line will extend beyond the bandwidth for
  /// every bar in a group.
  final int overDrawPx;

  /// The number of pixels that the line will extend beyond the bandwidth at the
  /// edges of the bar group.
  ///
  /// If set, this overrides overDrawPx for the beginning side of the first bar
  /// target line in the group, and the ending side of the last bar target line.
  /// overDrawPx will be used for overdrawing the target lines for interior
  /// sides of the bars.
  final int? overDrawOuterPx;

  /// Whether target lines should have round end caps, or square if false.
  final bool roundEndCaps;

  @override
  common.BarTargetLineRendererConfig<T> getRenderConfig() {
    return common.BarTargetLineRendererConfig<T>(
      customRendererId: RenderType.barTargetLine.name,
      barGroupInnerPaddingPx: barGroupInnerPaddingPx,
      groupingType: _getBarGroupingType(barGroupingType),
      weightPattern: weightPattern,
      dashPattern: dashPatternBase,
      overDrawOuterPx: overDrawOuterPx,
      overDrawPx: overDrawPx,
      roundEndCaps: roundEndCaps,
    );
  }
}

class ConfigSeriesBarTargetLineN
    extends ConfigSeriesBarTargetLine<NumericGroup, NumericData, num> {
  const ConfigSeriesBarTargetLineN({
    // super.seriesColor,
    super.customColor,
    // super.areaColor,
    // super.fillColor,
    super.strokeGradient,
    super.targetLineGradient,
    // super.fillPattern,
    super.dashPattern,
    // super.labelAccessor,
    super.strokeWidthPx,
    // super.radiusPx,
    super.measureOffset,
    super.domain,
    // super.domainLowerBound,
    // super.domainUpperBound,
    super.measure,
    // super.measureLowerBound,
    // super.measureUpperBound,
    super.barGroupInnerPaddingPx,
    super.barGroupingType,
    super.weightPattern,
    super.dashPatternBase,
    super.overDrawOuterPx,
    super.overDrawPx,
    super.roundEndCaps,
  });
}

class ConfigSeriesBarTargetLineO
    extends ConfigSeriesBarTargetLine<OrdinalGroup, OrdinalData, String> {
  const ConfigSeriesBarTargetLineO({
    // super.seriesColor,
    super.customColor,
    // super.areaColor,
    // super.fillColor,
    super.strokeGradient,
    super.targetLineGradient,
    // super.fillPattern,
    super.dashPattern,
    // super.labelAccessor,
    super.strokeWidthPx,
    // super.radiusPx,
    super.measureOffset,
    super.domain,
    // super.domainLowerBound,
    // super.domainUpperBound,
    super.measure,
    // super.measureLowerBound,
    // super.measureUpperBound,
    super.barGroupInnerPaddingPx,
    super.barGroupingType,
    super.weightPattern,
    super.dashPatternBase,
    super.overDrawOuterPx,
    super.overDrawPx,
    super.roundEndCaps,
  });
}

class ConfigSeriesBarTargetLineT
    extends ConfigSeriesBarTargetLine<TimeGroup, TimeData, DateTime> {
  const ConfigSeriesBarTargetLineT({
    // super.seriesColor,
    super.customColor,
    // super.areaColor,
    // super.fillColor,
    super.strokeGradient,
    super.targetLineGradient,
    // super.fillPattern,
    super.dashPattern,
    // super.labelAccessor,
    super.strokeWidthPx,
    // super.radiusPx,
    super.measureOffset,
    super.domain,
    // super.domainLowerBound,
    // super.domainUpperBound,
    super.measure,
    // super.measureLowerBound,
    // super.measureUpperBound,
    super.barGroupInnerPaddingPx,
    super.barGroupingType,
    super.weightPattern,
    super.dashPatternBase,
    super.overDrawOuterPx,
    super.overDrawPx,
    super.roundEndCaps,
  });
}
