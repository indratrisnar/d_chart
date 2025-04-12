part of 'config_render.dart';

abstract class ConfigRenderPoint<D, T> {
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

  const ConfigRenderPoint({
    this.radiusPx = 3.5,
    this.symbolRender,
    this.strokeWidthPx = 0.0,
    this.showPointLabel = false,
    required this.pointLabelDecorator,
    this.showComparisonPoint = false,
    this.comparisonSymbolRender = const ComparisonSymbolRenderRectangleRange(),
  });

  common.PointRendererConfig<T> getRender(String? renderId) {
    return common.PointRendererConfig<T>(
      customRendererId: renderId,
      radiusPx: radiusPx,
      strokeWidthPx: strokeWidthPx,
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

class ConfigRenderPointN extends ConfigRenderPoint<NumericData, num> {
  const ConfigRenderPointN({
    super.pointLabelDecorator = const PointLabelDecoratorN(),
    super.comparisonSymbolRender,
    super.radiusPx,
    super.showComparisonPoint,
    super.showPointLabel,
    super.strokeWidthPx,
    super.symbolRender,
  });
}

class ConfigRenderPointO extends ConfigRenderPoint<OrdinalData, String> {
  const ConfigRenderPointO({
    super.pointLabelDecorator = const PointLabelDecoratorO(),
    super.comparisonSymbolRender,
    super.radiusPx,
    super.showComparisonPoint,
    super.showPointLabel,
    super.strokeWidthPx,
    super.symbolRender,
  });
}

class ConfigRenderPointT extends ConfigRenderPoint<TimeData, DateTime> {
  const ConfigRenderPointT({
    super.pointLabelDecorator = const PointLabelDecoratorT(),
    super.comparisonSymbolRender,
    super.radiusPx,
    super.showComparisonPoint,
    super.showPointLabel,
    super.strokeWidthPx,
    super.symbolRender,
  });
}
