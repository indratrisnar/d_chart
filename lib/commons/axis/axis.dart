part of '../../d_chart.dart';

/// T -> Domain Data Type
abstract class ChartAxis<T> {
  const ChartAxis({
    this.noRenderSpec = false,
    this.renderType = AxisRenderType.smallTick,
    this.showLine = true,
    this.lineStyle = const LineStyle(),
    this.gridlineStyle = const LineStyle(),
    this.tickLineStyle = const LineStyle(),
    this.tickLength = 3,
    this.tickLabelFormatter,
    this.labelStyle = const LabelStyle(),
    this.labelAnchor = LabelAnchor.centered,
    this.labelRotation = 0,
    this.minimumPaddingBetweenLabels = 0,
    this.labelOffsetFromAxis,
    this.labelOffsetFromTick,
    this.labelCollisionOffsetFromAxis,
    this.labelCollisionOffsetFromTick,
    this.labelCollisionRotation,
    this.tickLabelJustification,
  });

  /// disable label and tick axis
  final bool noRenderSpec;

  /// default: AxisRenderType.smallTick
  final AxisRenderType renderType;

  /// show domain line\
  /// default: true
  final bool showLine;

  /// styling for domain line
  final LineStyle lineStyle;

  /// styling of lines perpendicular to the axis line
  final LineStyle gridlineStyle;

  /// styling of tick line on axis
  final LineStyle tickLineStyle;

  /// tick axis length\
  /// default: 3
  final int tickLength;

  /// tick label format for time series
  /// domain value or measure value
  final String Function(T? value)? tickLabelFormatter;

  /// styling for domain label
  final LabelStyle labelStyle;

  /// label position based on tick axis\
  /// default: `LabelAnchor.centered`
  final LabelAnchor labelAnchor;

  /// starting point at center right.
  ///
  /// center right = 0 degree.
  ///
  /// default: 0
  final int labelRotation;

  /// can be use as space beetween label.
  ///
  /// more smaller padding, then label will be getting closer,
  /// they can even collide with each other, take each other's place
  final int? minimumPaddingBetweenLabels;

  /// Distance from the axis line in px.
  final int? labelOffsetFromAxis;

  /// Absolute distance from the tick to the text if using start/end
  final int? labelOffsetFromTick;

  /// Distance from the axis line in px when a collision between ticks has
  /// occurred.
  final int? labelCollisionOffsetFromAxis;

  /// Absolute distance from the tick to the text when a collision between ticks
  /// has occurred.
  final int? labelCollisionOffsetFromTick;

  /// Angle of rotation for tick labels, in degrees when a collision between
  /// ticks has occurred.
  final int? labelCollisionRotation;

  final TickLabelJustification? tickLabelJustification;

  axisSpec();

  common.RenderSpec<T> getRenderSpec() {
    if (noRenderSpec) {
      return common.NoneRenderSpec<T>(
        axisLineStyle: lineStyle.getRender(),
      );
    }
    return switch (renderType) {
      AxisRenderType.gridline => _renderGridline(),
      _ => _renderSmallTick(),
    };
  }

  common.SmallTickRendererSpec<T> _renderSmallTick() {
    return common.SmallTickRendererSpec<T>(
      axisLineStyle: lineStyle.getRender(),
      labelAnchor: MethodCommon.tickLabelAnchor(labelAnchor),
      labelCollisionOffsetFromAxisPx: labelCollisionOffsetFromAxis,
      labelCollisionOffsetFromTickPx: labelCollisionOffsetFromTick,
      labelCollisionRotation: labelCollisionRotation,
      labelJustification:
          MethodCommon.tickLabelJustification(tickLabelJustification),
      labelOffsetFromAxisPx: labelOffsetFromAxis,
      labelOffsetFromTickPx: labelOffsetFromTick,
      labelRotation: labelRotation,
      labelStyle: labelStyle.getRender(),
      lineStyle: tickLineStyle.getRender(),
      minimumPaddingBetweenLabelsPx: minimumPaddingBetweenLabels,
      tickLengthPx: tickLength,
    );
  }

  common.GridlineRendererSpec<T> _renderGridline() {
    return common.GridlineRendererSpec<T>(
      axisLineStyle: lineStyle.getRender(),
      labelAnchor: MethodCommon.tickLabelAnchor(labelAnchor),
      labelCollisionOffsetFromAxisPx: labelCollisionOffsetFromAxis,
      labelCollisionOffsetFromTickPx: labelCollisionOffsetFromTick,
      labelCollisionRotation: labelCollisionRotation,
      labelJustification:
          MethodCommon.tickLabelJustification(tickLabelJustification),
      labelOffsetFromAxisPx: labelOffsetFromAxis,
      labelOffsetFromTickPx: labelOffsetFromTick,
      labelRotation: labelRotation,
      labelStyle: labelStyle.getRender(),
      lineStyle: gridlineStyle.getRender(),
      minimumPaddingBetweenLabelsPx: minimumPaddingBetweenLabels,
      tickLengthPx: tickLength,
    );
  }
}
