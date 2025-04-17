part of '../../d_chart.dart';

abstract class ConfigSeriesBar<G, D, T> extends ConfigSeries<G, D, T> {
  const ConfigSeriesBar({
    super.seriesColor,
    super.customColor,
    // super.areaColor,
    super.fillColor,
    super.fillPattern,
    // super.dashPattern,
    // super.labelAccessor, // below instead
    String Function(G?, D, int?)? barLabel,
    super.strokeWidthPx,
    // super.radiusPx,
    super.measureOffset,
    super.domain,
    super.domainLowerBound,
    super.domainUpperBound,
    super.measure,
    super.measureLowerBound,
    super.measureUpperBound,
    this.barGroupInnerPaddingPx = 2,
    this.fillPatternBase = FillPattern.solid,
    this.cornerRadius = 2,
    this.barGroupingType = BarGroupingType.grouped,
    this.maxBarWidthPx,
    // this.minBarLengthPx = 0,
    this.stackedBarPaddingPx = 1,
    // this.strokeWidthPxBase = 0,
    this.weightPattern,
    this.showBarLabel = false,
    required this.barLabelDecorator,
  }) : super(labelAccessor: barLabel);

  /// default: 2
  final int barGroupInnerPaddingPx;

  /// fill type\
  /// default: FillPattern.solid
  final FillPattern fillPatternBase;

  /// bar corner radius\
  /// default: 2
  final int cornerRadius;

  /// type group\
  /// default: BarGroupingType.grouped
  final BarGroupingType barGroupingType;

  /// The maximum bar group width in pixels, or null if bars can be arbitrarily
  /// wide.
  final int? maxBarWidthPx;

  /// minimum bar length\
  /// default: 0
  // final int minBarLengthPx; // in chart.js this is for scale, but in this framework, i don't know what is it for

  /// The padding between bar stacks.
  /// default: 1\
  /// be affected by `strokeWidthPx`\
  /// to show padding? `stackedBarPaddingPx` > `strokeWidthPx`
  /// && `barGroupingType` is `BarGroupingType.stacked` or `BarGroupingType.groupedStacked`
  final int stackedBarPaddingPx;

  /// Stroke width of the target line.
  /// default: 0.0\
  // final double strokeWidthPxBase;

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

  /// show label on bar item
  ///
  /// default: false
  final bool showBarLabel;

  /// to decor label on bar item
  final BarLabelDecorator barLabelDecorator;

  @override
  common.BarRendererConfig<T> getRenderConfig() {
    return common.BarRendererConfig<T>(
      customRendererId: RenderType.bar.name,
      barGroupInnerPaddingPx: barGroupInnerPaddingPx,
      fillPattern: MethodCommon.fillPattern(fillPatternBase),
      groupingType: _getBarGroupingType(barGroupingType),
      cornerStrategy: common.ConstCornerStrategy(cornerRadius),
      maxBarWidthPx: maxBarWidthPx,
      // minBarLengthPx: minBarLengthPx,
      stackedBarPaddingPx: stackedBarPaddingPx,
      // strokeWidthPx: strokeWidthPxBase,
      weightPattern: weightPattern,
      barRendererDecorator: !showBarLabel
          ? null
          : barLabelDecorator.render() as common.BarRendererDecorator<T>,
    );
  }
}

class ConfigSeriesBarN extends ConfigSeriesBar<NumericGroup, NumericData, num> {
  const ConfigSeriesBarN({
    super.seriesColor,
    super.customColor,
    // super.areaColor,
    super.fillColor,
    super.fillPattern,
    // super.dashPattern,
    // super.labelAccessor, // below instead
    super.barLabel,
    super.strokeWidthPx,
    // super.radiusPx,
    super.measureOffset,
    super.domain,
    super.domainLowerBound,
    super.domainUpperBound,
    super.measure,
    super.measureLowerBound,
    super.measureUpperBound,
    super.barGroupInnerPaddingPx,
    super.fillPatternBase,
    super.cornerRadius,
    super.barGroupingType,
    super.maxBarWidthPx,
    // super.minBarLengthPx = 0,
    super.stackedBarPaddingPx,
    // super.strokeWidthPxBase,
    super.weightPattern,
    super.showBarLabel,
    super.barLabelDecorator = const BarLabelDecoratorN(),
  });
}

class ConfigSeriesBarO
    extends ConfigSeriesBar<OrdinalGroup, OrdinalData, String> {
  const ConfigSeriesBarO({
    super.seriesColor,
    super.customColor,
    // super.areaColor,
    super.fillColor,
    super.fillPattern,
    // super.dashPattern,
    // super.labelAccessor, below instead
    super.barLabel,
    super.strokeWidthPx,
    // super.radiusPx,
    super.measureOffset,
    super.domain,
    super.domainLowerBound,
    super.domainUpperBound,
    super.measure,
    super.measureLowerBound,
    super.measureUpperBound,
    super.barGroupInnerPaddingPx,
    // super.fillPattern = FillPattern.solid,
    super.cornerRadius,
    super.barGroupingType,
    super.maxBarWidthPx,
    // super.minBarLengthPx,
    super.stackedBarPaddingPx,
    // super.strokeWidthPxBase,
    super.weightPattern,
    super.showBarLabel,
    super.barLabelDecorator = const BarLabelDecoratorO(),
  });
}

class ConfigSeriesBarT extends ConfigSeriesBar<TimeGroup, TimeData, DateTime> {
  const ConfigSeriesBarT({
    super.seriesColor,
    super.customColor,
    // super.areaColor,
    super.fillColor,
    super.fillPattern,
    // super.dashPattern,
    // super.labelAccessor, below instead
    super.barLabel,
    super.strokeWidthPx,
    // super.radiusPx,
    super.measureOffset,
    super.domain,
    super.domainLowerBound,
    super.domainUpperBound,
    super.measure,
    super.measureLowerBound,
    super.measureUpperBound,
    super.barGroupInnerPaddingPx,
    // super.fillPattern = FillPattern.solid,
    super.cornerRadius,
    super.barGroupingType,
    super.maxBarWidthPx,
    // super.minBarLengthPx,
    super.stackedBarPaddingPx,
    // super.strokeWidthPx = 0.0,
    super.weightPattern,
    super.showBarLabel,
    super.barLabelDecorator = const BarLabelDecoratorT(),
  });
}

common.BarGroupingType _getBarGroupingType(BarGroupingType? type) {
  return switch (type) {
    BarGroupingType.groupedStacked => common.BarGroupingType.groupedStacked,
    BarGroupingType.stacked => common.BarGroupingType.stacked,
    _ => common.BarGroupingType.grouped,
  };
}
