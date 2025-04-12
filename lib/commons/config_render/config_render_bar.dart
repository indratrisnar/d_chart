part of 'config_render.dart';

abstract class ConfigRenderBar<T> {
  const ConfigRenderBar({
    this.barGroupInnerPaddingPx = 2,
    this.fillPattern = FillPattern.solid,
    this.radius = 2,
    this.barGroupingType = BarGroupingType.grouped,
    this.maxBarWidthPx,
    this.minBarLengthPx = 0,
    this.stackedBarPaddingPx = 1,
    this.strokeWidthPx = 0.0,
    this.weightPattern,
    this.showBarLabel = false,
    required this.barLabelDecorator,
  });

  /// default: 2
  final int barGroupInnerPaddingPx;

  /// fill type\
  /// default: FillPattern.solid
  final FillPattern fillPattern;

  /// bar radius\
  /// default: 2
  final int radius;

  /// type group\
  /// default: BarGroupingType.grouped
  final BarGroupingType barGroupingType;

  /// maximum bar width
  final int? maxBarWidthPx;

  /// minimum bar length\
  /// default: 0
  final int minBarLengthPx;

  /// padding between bar group stack\
  /// default: 1\
  /// be affected by `strokeWidthPx`\
  /// to show padding? `stackedBarPaddingPx` > `strokeWidthPx`
  /// && `barGroupingType` is `BarGroupingType.stacked` or `BarGroupingType.groupedStacked`
  final int stackedBarPaddingPx;

  /// stroke or border width\
  /// default: 0.0\
  final double strokeWidthPx;

  /// pattern weight bar
  final List<int>? weightPattern;

  /// show label on bar item
  ///
  /// default: false
  final bool showBarLabel;

  /// to decor label on bar item
  final BarLabelDecorator<T> barLabelDecorator;

  common.BarRendererConfig<T> getRender([String? customRendererId]) {
    return common.BarRendererConfig<T>(
      customRendererId: customRendererId,
      barGroupInnerPaddingPx: barGroupInnerPaddingPx,
      fillPattern: MethodCommon.fillPattern(fillPattern),
      groupingType: _getBarGroupingType(barGroupingType),
      cornerStrategy: common.ConstCornerStrategy(radius),
      maxBarWidthPx: maxBarWidthPx,
      minBarLengthPx: minBarLengthPx,
      stackedBarPaddingPx: stackedBarPaddingPx,
      strokeWidthPx: strokeWidthPx,
      weightPattern: weightPattern,
      barRendererDecorator: !showBarLabel ? null : barLabelDecorator.render(),
    );
  }

  common.BarGroupingType _getBarGroupingType(BarGroupingType? type) {
    return switch (type) {
      BarGroupingType.groupedStacked => common.BarGroupingType.groupedStacked,
      BarGroupingType.stacked => common.BarGroupingType.stacked,
      _ => common.BarGroupingType.grouped,
    };
  }
}

class ConfigRenderBarN extends ConfigRenderBar<num> {
  const ConfigRenderBarN({
    super.barLabelDecorator = const BarLabelDecoratorN(),
    super.barGroupInnerPaddingPx,
    super.barGroupingType,
    super.fillPattern,
    super.maxBarWidthPx,
    super.minBarLengthPx,
    super.radius,
    super.showBarLabel,
    super.stackedBarPaddingPx,
    super.strokeWidthPx,
    super.weightPattern,
  });
}

class ConfigRenderBarO extends ConfigRenderBar<String> {
  const ConfigRenderBarO({
    super.barLabelDecorator = const BarLabelDecoratorO(),
    super.barGroupInnerPaddingPx,
    super.barGroupingType,
    super.fillPattern,
    super.maxBarWidthPx,
    super.minBarLengthPx,
    super.radius,
    super.showBarLabel,
    super.stackedBarPaddingPx,
    super.strokeWidthPx,
    super.weightPattern,
  });
}

class ConfigRenderBarT extends ConfigRenderBar<DateTime> {
  const ConfigRenderBarT({
    super.barLabelDecorator = const BarLabelDecoratorT(),
    super.barGroupInnerPaddingPx,
    super.barGroupingType,
    super.fillPattern,
    super.maxBarWidthPx,
    super.minBarLengthPx,
    super.radius,
    super.showBarLabel,
    super.stackedBarPaddingPx,
    super.strokeWidthPx,
    super.weightPattern,
  });
}
