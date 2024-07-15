part of 'config_render.dart';

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

  /// show label on plot point
  ///
  /// default: false
  final bool showPointLabel;

  /// to decor label on plot point
  final PointLabelDecorator? pointLabelDecorator;

  ConfigRenderLine({
    this.radiusPx = 3.5,
    this.strokeWidthPx = 2.0,
    this.dashPattern,
    this.includeLine = true,
    this.includePoints = false,
    this.includeArea = false,
    this.areaOpacity = 0.1,
    this.roundEndCaps = false,
    this.showPointLabel = false,
    this.pointLabelDecorator,
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
      pointRendererDecorators: [
        if (showPointLabel)
          pointLabelDecorator?.getRenderNumeric() ??
              PointLabelDecorator().getRenderNumeric(),
      ],
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
      pointRendererDecorators: [
        if (showPointLabel)
          pointLabelDecorator?.getRenderOrdinal() ??
              PointLabelDecorator().getRenderOrdinal(),
      ],
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
      pointRendererDecorators: [
        if (showPointLabel)
          pointLabelDecorator?.getRenderTime() ??
              PointLabelDecorator().getRenderTime(),
      ],
    );
  }

  common.LineRendererConfig<num> getRenderLineN() {
    return common.LineRendererConfig(
      areaOpacity: areaOpacity,
      dashPattern: dashPattern,
      includeArea: includeArea,
      includeLine: includeLine,
      includePoints: includePoints,
      radiusPx: radiusPx,
      roundEndCaps: roundEndCaps,
      strokeWidthPx: strokeWidthPx,
      pointRendererDecorators: [
        if (showPointLabel)
          pointLabelDecorator?.getRenderNumeric() ??
              PointLabelDecorator().getRenderNumeric(),
      ],
    );
  }
}
