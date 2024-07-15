part of 'config_render.dart';

class ConfigRenderBar extends ConfigRender {
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
  final BarLabelDecorator? barLabelDecorator;

  ConfigRenderBar({
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
    this.barLabelDecorator,
  });

  common.SeriesRendererConfig<num> getRenderNumeric(String? renderId) {
    return common.BarRendererConfig(
      customRendererId: renderId,
      barGroupInnerPaddingPx: barGroupInnerPaddingPx,
      fillPattern: MethodCommon.fillPattern(fillPattern),
      groupingType: _getBarGroupingType(barGroupingType),
      cornerStrategy: common.ConstCornerStrategy(radius),
      maxBarWidthPx: maxBarWidthPx,
      minBarLengthPx: minBarLengthPx,
      stackedBarPaddingPx: stackedBarPaddingPx,
      strokeWidthPx: strokeWidthPx,
      weightPattern: weightPattern,
      barRendererDecorator: showBarLabel
          ? barLabelDecorator?.getRenderNumeric() ??
              BarLabelDecorator().getRenderNumeric()
          : null,
    );
  }

  common.SeriesRendererConfig<String> getRenderOrdinal(String? renderId) {
    return common.BarRendererConfig(
      customRendererId: renderId,
      barGroupInnerPaddingPx: barGroupInnerPaddingPx,
      fillPattern: MethodCommon.fillPattern(fillPattern),
      groupingType: _getBarGroupingType(barGroupingType),
      cornerStrategy: common.ConstCornerStrategy(radius),
      maxBarWidthPx: maxBarWidthPx,
      minBarLengthPx: minBarLengthPx,
      stackedBarPaddingPx: stackedBarPaddingPx,
      strokeWidthPx: strokeWidthPx,
      weightPattern: weightPattern,
      barRendererDecorator: showBarLabel
          ? barLabelDecorator?.getRenderOrdinal() ??
              BarLabelDecorator().getRenderOrdinal()
          : null,
    );
  }

  common.SeriesRendererConfig<DateTime> getRenderTime(String? renderId) {
    return common.BarRendererConfig(
      customRendererId: renderId,
      barGroupInnerPaddingPx: barGroupInnerPaddingPx,
      fillPattern: MethodCommon.fillPattern(fillPattern),
      groupingType: _getBarGroupingType(barGroupingType),
      cornerStrategy: common.ConstCornerStrategy(radius),
      maxBarWidthPx: maxBarWidthPx,
      minBarLengthPx: minBarLengthPx,
      stackedBarPaddingPx: stackedBarPaddingPx,
      strokeWidthPx: strokeWidthPx,
      weightPattern: weightPattern,
      barRendererDecorator: showBarLabel
          ? barLabelDecorator?.getRenderTime() ??
              BarLabelDecorator().getRenderTime()
          : null,
    );
  }

  common.BarRendererConfig<String> getRenderBarO() {
    return common.BarRendererConfig(
      barGroupInnerPaddingPx: barGroupInnerPaddingPx,
      fillPattern: MethodCommon.fillPattern(fillPattern),
      groupingType: _getBarGroupingType(barGroupingType),
      cornerStrategy: common.ConstCornerStrategy(radius),
      maxBarWidthPx: maxBarWidthPx,
      minBarLengthPx: minBarLengthPx,
      stackedBarPaddingPx: stackedBarPaddingPx,
      strokeWidthPx: strokeWidthPx,
      weightPattern: weightPattern,
      barRendererDecorator: showBarLabel
          ? barLabelDecorator?.getRenderOrdinal() ??
              BarLabelDecorator().getRenderOrdinal()
          : null,
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
