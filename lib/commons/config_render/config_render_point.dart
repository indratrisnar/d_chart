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

  ConfigRenderPoint({
    this.radiusPx = 3.5,
    this.symbolRender,
    this.strokeWidthPx = 0.0,
    this.showPointLabel = false,
    this.pointLabelDecorator,
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
      ],
    );
  }
}
