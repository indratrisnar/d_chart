part of 'config_render.dart';

abstract class ConfigRenderLine<D, T> {
  const ConfigRenderLine({
    this.radiusPx = 3.5,
    this.strokeWidthPx = 2.0,
    this.dashPattern,
    this.includeLine = true,
    this.includePoints = false,
    this.includeArea = false,
    this.areaOpacity = 0.1,
    this.roundEndCaps = false,
    this.showPointLabel = false,
    required this.pointLabelDecorator,
  });

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
  final PointLabelDecorator<D, T> pointLabelDecorator;

  common.LineRendererConfig<T> getRender([String? customRendererId]) {
    return common.LineRendererConfig<T>(
      customRendererId: customRendererId,
      areaOpacity: areaOpacity,
      dashPattern: dashPattern,
      includeArea: includeArea,
      includeLine: includeLine,
      includePoints: includePoints,
      radiusPx: radiusPx,
      roundEndCaps: roundEndCaps,
      strokeWidthPx: strokeWidthPx,
      pointRendererDecorators: [
        if (showPointLabel) pointLabelDecorator.render(),
      ],
    );
  }
}

class ConfigRenderLineN extends ConfigRenderLine<NumericData, num> {
  const ConfigRenderLineN({
    super.pointLabelDecorator = const PointLabelDecoratorN(),
    super.areaOpacity,
    super.dashPattern,
    super.includeArea,
    super.includeLine,
    super.includePoints,
    super.radiusPx,
    super.roundEndCaps,
    super.showPointLabel,
    super.strokeWidthPx,
  });
}

class ConfigRenderLineO extends ConfigRenderLine<OrdinalData, String> {
  const ConfigRenderLineO({
    super.pointLabelDecorator = const PointLabelDecoratorO(),
    super.areaOpacity,
    super.dashPattern,
    super.includeArea,
    super.includeLine,
    super.includePoints,
    super.radiusPx,
    super.roundEndCaps,
    super.showPointLabel,
    super.strokeWidthPx,
  });
}

class ConfigRenderLineT extends ConfigRenderLine<TimeData, DateTime> {
  const ConfigRenderLineT({
    super.pointLabelDecorator = const PointLabelDecoratorT(),
    super.areaOpacity,
    super.dashPattern,
    super.includeArea,
    super.includeLine,
    super.includePoints,
    super.radiusPx,
    super.roundEndCaps,
    super.showPointLabel,
    super.strokeWidthPx,
  });
}
