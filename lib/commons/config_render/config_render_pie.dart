part of 'config_render.dart';

abstract class ConfigRenderPie<T> {
  const ConfigRenderPie({
    this.arcLength = 2 * pi,
    this.arcWidth,
    this.arcLabelDecorator,
    this.arcRatio,
    this.startAngle = -pi / 2,
    this.strokeWidthPx = 2.0,
  });

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

  final ArcLabelDecorator<T>? arcLabelDecorator;

  common.ArcRendererConfig<T> getRender() {
    return common.ArcRendererConfig<T>(
      arcLength: arcLength,
      arcWidth: arcWidth,
      arcRendererDecorators: [
        if (arcLabelDecorator != null) arcLabelDecorator!.render(),
      ],
      startAngle: startAngle,
      strokeWidthPx: strokeWidthPx,
      arcRatio: arcRatio,
    );
  }
}

class ConfigRenderPieN extends ConfigRenderPie<num> {
  const ConfigRenderPieN({
    super.arcLabelDecorator,
    super.arcLength,
    super.arcRatio,
    super.arcWidth,
    super.startAngle,
    super.strokeWidthPx,
  });
}

class ConfigRenderPieO extends ConfigRenderPie<String> {
  const ConfigRenderPieO({
    super.arcLabelDecorator,
    super.arcLength,
    super.arcRatio,
    super.arcWidth,
    super.startAngle,
    super.strokeWidthPx,
  });
}

class ConfigRenderPieT extends ConfigRenderPie<DateTime> {
  const ConfigRenderPieT({
    super.arcLabelDecorator,
    super.arcLength,
    super.arcRatio,
    super.arcWidth,
    super.startAngle,
    super.strokeWidthPx,
  });
}
