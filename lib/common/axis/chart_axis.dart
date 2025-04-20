part of '../../d_chart.dart';

/// T -> Domain Data Type
abstract class ChartAxis<T> {
  const ChartAxis({
    this.noRenderSpec = false,
    this.axisRenderType = AxisRenderType.smallTick,
    this.showAxisLine = true,
    this.axisLineStyle = const LineStyle(),
    this.gridlineStyle = const LineStyle(),
    this.tickLineStyle = const LineStyle(),
    this.tickLength = 3,
    this.tickLabelFormatter,
    this.labelStyle = const LabelStyle(),
    this.labelAnchor = LabelAnchor.centered,
    this.labelRotation = 0,
    this.minimumPaddingBetweenLabels,
    this.labelOffsetFromAxis,
    // this.labelOffsetFromTick,
    // this.labelCollisionOffsetFromAxis,
    // this.labelCollisionOffsetFromTick,
    // this.labelCollisionRotation,
    this.tickLabelJustification = TickLabelJustification.inside,
  });

  /// disable label and tick axis, but not axis line
  final bool noRenderSpec;

  /// default: AxisRenderType.smallTick
  final AxisRenderType axisRenderType;

  /// show axis line\
  /// default: true
  final bool showAxisLine;

  /// styling for axis line
  final LineStyle axisLineStyle;

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

  /// styling for axis tick label
  final LabelStyle labelStyle;

  /// label position based on tick axis\
  /// default: `LabelAnchor.centered`
  final LabelAnchor labelAnchor;

  /// default: 0 degree
  final int labelRotation;

  /// can be use as space beetween label.
  ///
  /// more smaller padding, then label will be getting closer,
  /// they can even collide with each other, take each other's place
  final int? minimumPaddingBetweenLabels;

  /// Distance from the axis line in px.
  final int? labelOffsetFromAxis;

  /// Absolute distance from the tick to the text if using start/end
  // final int? labelOffsetFromTick;

  /// Distance from the axis line in px when a collision between ticks has
  /// occurred.
  // final int? labelCollisionOffsetFromAxis;

  /// Absolute distance from the tick to the text when a collision between ticks
  /// has occurred.
  // final int? labelCollisionOffsetFromTick;

  /// Angle of rotation for tick labels, in degrees when a collision between
  /// ticks has occurred.
  // final int? labelCollisionRotation;

  /// Work on vertical axis
  final TickLabelJustification tickLabelJustification;

  axisSpec();

  common.RenderSpec<T> getRenderSpec() {
    if (noRenderSpec) {
      return common.NoneRenderSpec<T>(
        axisLineStyle: axisLineStyle.getRender(),
      );
    }
    return switch (axisRenderType) {
      AxisRenderType.gridline => _renderGridline(),
      _ => _renderSmallTick(),
    };
  }

  common.SmallTickRendererSpec<T> _renderSmallTick() {
    return common.SmallTickRendererSpec<T>(
      axisLineStyle: axisLineStyle.getRender(),
      labelAnchor: MethodCommon.tickLabelAnchor(labelAnchor),
      // labelCollisionOffsetFromAxisPx: labelCollisionOffsetFromAxis,
      // labelCollisionOffsetFromTickPx: labelCollisionOffsetFromTick,
      // labelCollisionRotation: labelCollisionRotation,
      labelJustification:
          MethodCommon.tickLabelJustification(tickLabelJustification),
      labelOffsetFromAxisPx: labelOffsetFromAxis,
      // labelOffsetFromTickPx: labelOffsetFromTick,
      labelRotation: labelRotation,
      labelStyle: labelStyle.getRender(),
      lineStyle: tickLineStyle.getRender(),
      minimumPaddingBetweenLabelsPx: minimumPaddingBetweenLabels,
      tickLengthPx: tickLength,
    );
  }

  common.GridlineRendererSpec<T> _renderGridline() {
    return common.GridlineRendererSpec<T>(
      axisLineStyle: axisLineStyle.getRender(),
      labelAnchor: MethodCommon.tickLabelAnchor(labelAnchor),
      // labelCollisionOffsetFromAxisPx: labelCollisionOffsetFromAxis,
      // labelCollisionOffsetFromTickPx: labelCollisionOffsetFromTick,
      // labelCollisionRotation: labelCollisionRotation,
      labelJustification:
          MethodCommon.tickLabelJustification(tickLabelJustification),
      labelOffsetFromAxisPx: labelOffsetFromAxis,
      // labelOffsetFromTickPx: labelOffsetFromTick,
      labelRotation: labelRotation,
      labelStyle: labelStyle.getRender(),
      lineStyle: gridlineStyle.getRender(),
      minimumPaddingBetweenLabelsPx: minimumPaddingBetweenLabels,
      tickLengthPx: tickLength,
    );
  }
}
