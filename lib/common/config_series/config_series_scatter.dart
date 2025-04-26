part of '../../d_chart.dart';

abstract class ConfigSeriesScatter<G, D, T> extends ConfigSeries<G, D, T> {
  const ConfigSeriesScatter({
    super.seriesColor,
    super.customColor,
    // super.areaColor,
    // super.fillColor, below instead
    Color? Function(G group, D data, int? index)? pointColor,
    // super.gradient, below instead
    final Gradient? Function(G group, D data, int? index)? pointGradient,
    super.strokeGradient,
    // super.fillPattern,
    super.dashPattern,
    super.labelAccessor,
    super.strokeWidthPx,
    // super.radiusPx,
    num Function(G group, D data, int? index)? pointRadius,
    super.measureOffset,
    super.domain,
    super.domainLowerBound,
    super.domainUpperBound,
    super.measure,
    super.measureLowerBound,
    super.measureUpperBound,
    this.pointRadiusBase = 5,
    this.strokeWidthBase = 0,
    this.symbolRender,
    this.showComparisonPoint = false,
    this.comparisonSymbolRender = const ComparisonSymbolRenderRectangleRange(),
    this.showPointLabel = false,
    required this.pointLabelDecorator,
  }) : super(
          fillColor: pointColor,
          radiusPx: pointRadius,
          fillGradient: pointGradient,
        );

  /// render symbol for plot point
  /// - SymbolRenderCircle
  /// - SymbolRenderLine
  /// - SymbolRenderRect
  /// - SymbolRenderTriangle
  final SymbolRender? symbolRender;

  /// size plot point\
  /// default: 5
  final double pointRadiusBase;

  /// Stroke width of the symbol.
  final double strokeWidthBase;

  /// will draw track chart for each point
  ///
  /// default: false
  final bool showComparisonPoint;

  /// - ComparisonSymbolRenderRectangleRange
  /// - ComparisonSymbolRenderCylinder
  /// default: ComparisonSymbolRenderRectangleRange
  final ComparisonSymbolRender comparisonSymbolRender;

  /// show label on plot point
  ///
  /// default: false
  final bool showPointLabel;

  /// to decor label on plot point
  final PointLabelDecorator<D, T> pointLabelDecorator;

  @override
  common.PointRendererConfig<T> getRenderConfig() {
    return common.PointRendererConfig<T>(
      customRendererId: RenderType.scatterPlot.name,
      radiusPx: pointRadiusBase,
      strokeWidthPx: strokeWidthBase,
      symbolRenderer: symbolRender?.getRenderer(),
      pointRendererDecorators: [
        if (showPointLabel) pointLabelDecorator.render(),
        if (showComparisonPoint)
          common.ComparisonPointsDecorator(
            symbolRenderer: comparisonSymbolRender.getRenderer(),
          ),
      ],
    );
  }
}

class ConfigSeriesScatterN
    extends ConfigSeriesScatter<NumericGroup, NumericData, num> {
  const ConfigSeriesScatterN({
    super.seriesColor,
    super.customColor,
    // super.areaColor,
    // super.fillColor,
    super.pointColor,
    super.pointGradient,
    super.strokeGradient,
    // super.fillPattern,
    super.dashPattern,
    super.labelAccessor,
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
    super.symbolRender,
    super.pointRadiusBase,
    super.strokeWidthBase,
    super.showPointLabel,
    super.pointLabelDecorator = const PointLabelDecoratorN(),
    super.showComparisonPoint,
    super.comparisonSymbolRender,
  });
}

class ConfigSeriesScatterO
    extends ConfigSeriesScatter<OrdinalGroup, OrdinalData, String> {
  const ConfigSeriesScatterO({
    super.seriesColor,
    super.customColor,
    // super.areaColor,
    // super.fillColor,
    super.pointColor,
    super.pointGradient,
    super.strokeGradient,
    // super.fillPattern,
    super.dashPattern,
    super.labelAccessor,
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
    super.symbolRender,
    super.pointRadiusBase,
    super.strokeWidthBase,
    super.showPointLabel,
    super.pointLabelDecorator = const PointLabelDecoratorO(),
    super.showComparisonPoint,
    super.comparisonSymbolRender,
  });
}

class ConfigSeriesScatterT
    extends ConfigSeriesScatter<TimeGroup, TimeData, DateTime> {
  const ConfigSeriesScatterT({
    super.seriesColor,
    super.customColor,
    // super.areaColor,
    // super.fillColor,
    super.pointColor,
    super.pointGradient,
    super.strokeGradient,
    // super.fillPattern,
    super.dashPattern,
    super.labelAccessor,
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
    super.symbolRender,
    super.pointRadiusBase,
    super.strokeWidthBase,
    super.showPointLabel,
    super.pointLabelDecorator = const PointLabelDecoratorT(),
    super.showComparisonPoint,
    super.comparisonSymbolRender,
  });
}
