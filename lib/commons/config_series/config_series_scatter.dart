part of '../../d_chart.dart';

abstract class ConfigSeriesScatter<G, D, T> extends ConfigSeries<G, D, T> {
  const ConfigSeriesScatter({
    super.seriesColor,
    super.customColor,
    super.areaColor,
    super.fillColor,
    super.fillPattern,
    super.dashPattern,
    super.labelAccessor,
    super.strokeWidthPx,
    super.radiusPx,
    super.measureOffset,
    super.domain,
    super.domainLowerBound,
    super.domainUpperBound,
    super.measure,
    super.measureLowerBound,
    super.measureUpperBound,
    this.radiusPxBase = 5,
    this.symbolRender,
    // this.strokeWidthPx = 0.0,
    this.showPointLabel = false,
    required this.pointLabelDecorator,
    this.showComparisonPoint = false,
    this.comparisonSymbolRender = const ComparisonSymbolRenderRectangleRange(),
  });

  /// size plot point\
  /// default: 5
  final double radiusPxBase;

  /// render for symbol plot point
  /// - SymbolRenderCircle
  /// - SymbolRenderLine
  /// - SymbolRenderRect
  /// - SymbolRenderTriangle
  final SymbolRender? symbolRender;

  /// Stroke width of the target line.\
  /// as border in `SymbolRenderCircle`
  // final double strokeWidthPx;

  /// show label on plot point
  ///
  /// default: false
  final bool showPointLabel;

  /// to decor label on plot point
  final PointLabelDecorator<D, T> pointLabelDecorator;

  /// will draw track chart for each point
  ///
  /// default: false
  final bool showComparisonPoint;

  /// - ComparisonSymbolRenderRectangleRange
  /// - ComparisonSymbolRenderCylinder
  /// default: ComparisonSymbolRenderRectangleRange
  final ComparisonSymbolRender comparisonSymbolRender;

  @override
  common.PointRendererConfig<T> getRenderConfig() {
    return common.PointRendererConfig<T>(
      customRendererId: RenderType.scatterPlot.name,
      radiusPx: radiusPxBase,
      // strokeWidthPx: strokeWidthPx,
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
    super.areaColor,
    super.fillColor,
    super.fillPattern,
    super.dashPattern,
    super.labelAccessor,
    super.strokeWidthPx,
    super.radiusPx,
    super.measureOffset,
    super.domain,
    super.domainLowerBound,
    super.domainUpperBound,
    super.measure,
    super.measureLowerBound,
    super.measureUpperBound,
    // super.radiusPx = 3.5,
    super.symbolRender,
    // super.strokeWidthPx = 0.0,
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
    super.areaColor,
    super.fillColor,
    super.fillPattern,
    super.dashPattern,
    super.labelAccessor,
    super.strokeWidthPx,
    super.radiusPx,
    super.measureOffset,
    super.domain,
    super.domainLowerBound,
    super.domainUpperBound,
    super.measure,
    super.measureLowerBound,
    super.measureUpperBound,
    // super.radiusPx = 3.5,
    super.symbolRender,
    // super.strokeWidthPx = 0.0,
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
    super.areaColor,
    super.fillColor,
    super.fillPattern,
    super.dashPattern,
    super.labelAccessor,
    super.strokeWidthPx,
    super.radiusPx,
    super.measureOffset,
    super.domain,
    super.domainLowerBound,
    super.domainUpperBound,
    super.measure,
    super.measureLowerBound,
    super.measureUpperBound,
    // super.radiusPx = 3.5,
    super.symbolRender,
    // super.strokeWidthPx = 0.0,
    super.showPointLabel,
    super.pointLabelDecorator = const PointLabelDecoratorT(),
    super.showComparisonPoint,
    super.comparisonSymbolRender,
  });
}
