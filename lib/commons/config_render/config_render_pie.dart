part of 'config_render.dart';

class ConfigRenderPie {
  /// Total arc length, in radians.
  ///
  /// The default arcLength is 2π.
  final double arcLength;

  /// If set, configures the arcWidth to be a percentage of the radius.
  final double? arcRatio;

  /// Fixed width of the arc within the radius.
  ///
  /// If arcRatio is set, this value will be ignored.
  final int? arcWidth;

  /// Start angle for pie slices, in radians.
  ///
  /// Angles are defined from the positive x axis in Cartesian space. The
  /// default startAngle is -π/2.
  final double startAngle;

  /// Stroke width of the border of the arcs.
  final double strokeWidthPx;

  final ArcLabelDecorator? arcLabelDecorator;

  const ConfigRenderPie({
    this.arcLength = 2 * pi,
    this.arcWidth,
    this.arcLabelDecorator,
    this.arcRatio,
    this.startAngle = -pi / 2,
    this.strokeWidthPx = 2.0,
  });

  common.ArcRendererConfig<String> getRenderOrdinal() {
    return common.ArcRendererConfig<String>(
      arcLength: arcLength,
      arcWidth: arcWidth,
      arcRendererDecorators: [
        if (arcLabelDecorator != null) arcLabelDecorator!.getRenderOrdinal(),
      ],
      startAngle: startAngle,
      strokeWidthPx: strokeWidthPx,
      arcRatio: arcRatio,
    );
  }

  common.ArcRendererConfig<num> getRenderNumeric() {
    return common.ArcRendererConfig<num>(
      arcLength: arcLength,
      arcWidth: arcWidth,
      arcRendererDecorators: [
        if (arcLabelDecorator != null) arcLabelDecorator!.getRenderNumeric(),
      ],
      startAngle: startAngle,
      strokeWidthPx: strokeWidthPx,
      arcRatio: arcRatio,
    );
  }

  common.ArcRendererConfig<DateTime> getRenderTime() {
    return common.ArcRendererConfig<DateTime>(
      arcLength: arcLength,
      arcWidth: arcWidth,
      arcRendererDecorators: [
        if (arcLabelDecorator != null) arcLabelDecorator!.getRenderTime(),
      ],
      startAngle: startAngle,
      strokeWidthPx: strokeWidthPx,
      arcRatio: arcRatio,
    );
  }
}
