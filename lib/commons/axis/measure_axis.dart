part of 'axis.dart';

class MeasureAxis extends ChartAxis<num> {
  const MeasureAxis({
    this.viewport,
    this.numericTickProvider,
    super.gridlineStyle,
    super.labelAnchor,
    super.labelCollisionOffsetFromAxis,
    super.labelCollisionOffsetFromTick,
    super.labelCollisionRotation,
    super.labelOffsetFromAxis,
    super.labelOffsetFromTick,
    super.labelRotation,
    super.labelStyle,
    super.lineStyle,
    super.minimumPaddingBetweenLabels,
    super.noRenderSpec,
    super.renderType,
    super.showLine,
    super.tickLabelFormatter,
    super.tickLabelJustification,
    super.tickLength,
    super.tickLineStyle,
  });

  /// manage tick
  final NumericTickProvider? numericTickProvider;

  /// set limit view for measure axis
  final NumericViewport? viewport;

  @override
  common.NumericAxisSpec axisSpec() {
    return common.NumericAxisSpec(
      viewport: viewport?.getRender(),
      renderSpec: getRenderSpec(),
      showAxisLine: showLine,
      tickFormatterSpec: tickLabelFormatter == null
          ? null
          : common.BasicNumericTickFormatterSpec(
              tickLabelFormatter,
            ),
      tickProviderSpec: numericTickProvider?.getRender(),
    );
  }
}
