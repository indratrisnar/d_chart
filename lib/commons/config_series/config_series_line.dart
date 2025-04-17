part of '../../d_chart.dart';

abstract class ConfigSeriesLine<G, D, T> extends ConfigSeries<G, D, T> {
  const ConfigSeriesLine({
    super.seriesColor,
    super.customColor,
    super.areaColor,
    // super.fillColor, below instead
    final Color? Function(G, D, int?)? pointColor,
    // super.fillPattern,
    super.dashPattern,
    // super.labelAccessor,
    super.strokeWidthPx,
    // super.radiusPx, below instead
    num Function(G, D, int?)? pointRadius,
    super.measureOffset,
    super.domain,
    super.domainLowerBound,
    super.domainUpperBound,
    super.measure,
    super.measureLowerBound,
    super.measureUpperBound,
    this.pointRadiusBase = 3.5,
    this.strokeWidthPxBase = 2.0,
    this.dashPatternBase,
    this.includeLine = true,
    this.includePoints = false,
    this.includeArea = false,
    this.areaOpacity = 0.1,
    this.roundEndCaps = false,
    this.includePointLabel = false,
    this.stacked = false,
    required this.pointLabelDecorator,
    this.pointSymbol = const SymbolRenderCircle(),
  }) : super(fillColor: pointColor, radiusPx: pointRadius);

  /// Radius of points on the line, if [includePoints] is enabled.
  final double pointRadiusBase;

  /// Stroke width of the line.
  final double strokeWidthPxBase;

  /// Dash pattern for the line.
  final List<int>? dashPatternBase;

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

  /// show label on plot point
  ///
  /// default: false
  final bool includePointLabel;

  /// to decor label on plot point
  final PointLabelDecorator<D, T> pointLabelDecorator;

  /// symbol for point
  ///
  /// Circle, Line, Rect, RoundedRect, Triangle
  ///
  /// default: SymbolRenderCircle
  final SymbolRender pointSymbol;

  /// adjust the offset of one chart above another chart
  ///
  /// default: false
  final bool stacked;

  @override
  common.LineRendererConfig<T> getRenderConfig() {
    return common.LineRendererConfig<T>(
      customRendererId: RenderType.line.name,
      areaOpacity: areaOpacity,
      dashPattern: dashPatternBase,
      includeArea: includeArea,
      includeLine: includeLine,
      includePoints: includePoints,
      radiusPx: pointRadiusBase,
      roundEndCaps: roundEndCaps,
      strokeWidthPx: strokeWidthPxBase,
      symbolRenderer: pointSymbol.getRenderer(),
      // layoutPaintOrder: common.LayoutViewPaintOrder.line, // still no active
      stacked: stacked,
      pointRendererDecorators: [
        if (includePointLabel) pointLabelDecorator.render(),
      ],
    );
  }
}

class ConfigSeriesLineN
    extends ConfigSeriesLine<NumericGroup, NumericData, num> {
  const ConfigSeriesLineN({
    super.seriesColor,
    super.customColor,
    super.areaColor,
    // super.fillColor,
    super.pointColor,
    // super.fillPattern,
    super.dashPattern,
    // super.labelAccessor,
    super.strokeWidthPx,
    // super.radiusPx,
    super.pointRadius,
    super.measureOffset,
    super.domain,
    super.domainLowerBound,
    super.domainUpperBound,
    super.measure,
    super.measureLowerBound,
    super.measureUpperBound,
    super.pointRadiusBase,
    super.strokeWidthPxBase,
    super.dashPatternBase,
    super.includeLine,
    super.includePoints,
    super.includeArea,
    super.areaOpacity,
    super.roundEndCaps,
    super.includePointLabel,
    super.pointSymbol,
    super.stacked,
    super.pointLabelDecorator = const PointLabelDecoratorN(),
  });
}

class ConfigSeriesLineO
    extends ConfigSeriesLine<OrdinalGroup, OrdinalData, String> {
  const ConfigSeriesLineO({
    super.seriesColor,
    super.customColor,
    super.areaColor,
    // super.fillColor,
    super.pointColor,
    // super.fillPattern,
    super.dashPattern,
    // super.labelAccessor,
    super.strokeWidthPx,
    // super.radiusPx,
    super.pointRadius,
    super.measureOffset,
    super.domain,
    super.domainLowerBound,
    super.domainUpperBound,
    super.measure,
    super.measureLowerBound,
    super.measureUpperBound,
    super.pointRadiusBase,
    super.strokeWidthPxBase,
    super.dashPatternBase,
    super.includeLine,
    super.includePoints,
    super.includeArea,
    super.areaOpacity,
    super.roundEndCaps,
    super.includePointLabel,
    super.pointSymbol,
    super.stacked,
    super.pointLabelDecorator = const PointLabelDecoratorO(),
  });
}

class ConfigSeriesLineT
    extends ConfigSeriesLine<TimeGroup, TimeData, DateTime> {
  const ConfigSeriesLineT({
    super.seriesColor,
    super.customColor,
    super.areaColor,
    // super.fillColor,
    super.pointColor,
    // super.fillPattern,
    super.dashPattern,
    // super.labelAccessor,
    super.strokeWidthPx,
    // super.radiusPx,
    super.pointRadius,
    super.measureOffset,
    super.domain,
    super.domainLowerBound,
    super.domainUpperBound,
    super.measure,
    super.measureLowerBound,
    super.measureUpperBound,
    super.pointRadiusBase,
    super.strokeWidthPxBase,
    super.dashPatternBase,
    super.includeLine,
    super.includePoints,
    super.includeArea,
    super.areaOpacity,
    super.roundEndCaps,
    super.includePointLabel,
    super.pointSymbol,
    super.stacked,
    super.pointLabelDecorator = const PointLabelDecoratorT(),
  });
}
