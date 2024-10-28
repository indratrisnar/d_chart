part of 'config_render.dart';

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

  /// show label on plot point
  ///
  /// default: false
  final bool showPointLabel;

  /// to decor label on plot point
  final PointLabelDecorator? pointLabelDecorator;

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
    this.pointLabelDecorator,
    this.showComparisonPoint = false,
    this.comparisonSymbolRender = const ComparisonSymbolRenderRectangleRange(),
  });
  common.SeriesRendererConfig<num> getRenderNumeric(String? renderId) {
    return common.PointRendererConfig(
      customRendererId: renderId,
      radiusPx: radiusPx,
      strokeWidthPx: strokeWidthPx,
      symbolRenderer: symbolRender?.getRenderer(),
      pointRendererDecorators: [
        if (showPointLabel)
          pointLabelDecorator?.getRenderNumeric() ??
              PointLabelDecorator().getRenderNumeric(),
        if (showComparisonPoint)
          common.ComparisonPointsDecorator(
            symbolRenderer: comparisonSymbolRender.getRenderer(),
          ),
      ],
    );
  }

  common.SeriesRendererConfig<String> getRenderOrdinal(String? renderId) {
    return common.PointRendererConfig(
      customRendererId: renderId,
      radiusPx: radiusPx,
      strokeWidthPx: strokeWidthPx,
      symbolRenderer: symbolRender?.getRenderer(),
      pointRendererDecorators: [
        if (showPointLabel)
          pointLabelDecorator?.getRenderOrdinal() ??
              PointLabelDecorator().getRenderOrdinal(),
        if (showComparisonPoint)
          common.ComparisonPointsDecorator(
            symbolRenderer: comparisonSymbolRender.getRenderer(),
          ),
      ],
    );
  }

  common.SeriesRendererConfig<DateTime> getRenderTime(String? renderId) {
    return common.PointRendererConfig(
      customRendererId: renderId,
      radiusPx: radiusPx,
      strokeWidthPx: strokeWidthPx,
      symbolRenderer: symbolRender?.getRenderer(),
      pointRendererDecorators: [
        if (showPointLabel)
          pointLabelDecorator?.getRenderTime() ??
              PointLabelDecorator().getRenderTime(),
        if (showComparisonPoint)
          common.ComparisonPointsDecorator(
            symbolRenderer: comparisonSymbolRender.getRenderer(),
          ),
      ],
    );
  }

  common.PointRendererConfig<num> getRenderPointN() {
    return common.PointRendererConfig(
      radiusPx: radiusPx,
      strokeWidthPx: strokeWidthPx,
      symbolRenderer: symbolRender?.getRenderer(),
      pointRendererDecorators: [
        if (showPointLabel)
          pointLabelDecorator?.getRenderNumeric() ??
              PointLabelDecorator().getRenderNumeric(),
        if (showComparisonPoint)
          common.ComparisonPointsDecorator(
            symbolRenderer: comparisonSymbolRender.getRenderer(),
          ),
      ],
    );
  }
}
