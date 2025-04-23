part of '../../d_chart.dart';

class DomainAxisN extends ChartAxis<num> {
  const DomainAxisN({
    super.noRenderSpec,
    super.axisRenderType,
    super.showAxisLine,
    super.axisLineStyle,
    super.gridlineStyle,
    super.tickLineStyle,
    super.tickLength,
    super.tickLabelFormatter,
    super.labelStyle,
    super.labelAnchor,
    super.labelRotation,
    super.minimumPaddingBetweenLabels,
    super.labelOffsetFromAxis,
    // super.labelOffsetFromTick,
    // super.labelCollisionOffsetFromAxis,
    // super.labelCollisionOffsetFromTick,
    // super.labelCollisionRotation,
    super.tickLabelJustification,
    this.viewport,
    this.numericTickProvider,
  });

  /// manage tick
  final NumericTickProvider? numericTickProvider;

  /// set limit view for domain axis
  final NumericViewport? viewport;

  @override
  common.NumericAxisSpec axisSpec() {
    return common.NumericAxisSpec(
      viewport: viewport?.getRender(),
      renderSpec: getRenderSpec(),
      showAxisLine: showAxisLine,
      tickFormatterSpec: tickLabelFormatter == null
          ? null
          : common.BasicNumericTickFormatterSpec(
              tickLabelFormatter,
            ),
      tickProviderSpec: numericTickProvider?.getRender(),
    );
  }
}

class DomainAxisO extends ChartAxis<String> {
  const DomainAxisO({
    this.viewport,
    super.gridlineStyle,
    super.labelAnchor,
    // super.labelCollisionOffsetFromAxis,
    // super.labelCollisionOffsetFromTick,
    // super.labelCollisionRotation,
    super.labelOffsetFromAxis,
    // super.labelOffsetFromTick,
    super.labelRotation,
    super.labelStyle,
    super.axisLineStyle,
    super.minimumPaddingBetweenLabels,
    super.noRenderSpec,
    super.axisRenderType,
    super.showAxisLine,
    super.tickLabelJustification,
    super.tickLength,
    super.tickLineStyle,
  });

  /// set limit view for domain axis
  final OrdinalViewport? viewport;

  @override
  common.OrdinalAxisSpec axisSpec() {
    return common.OrdinalAxisSpec(
      viewport: viewport?.getRender(),
      renderSpec: getRenderSpec(),
      showAxisLine: showAxisLine,
    );
  }
}

class DomainAxisT extends ChartAxis<DateTime> {
  const DomainAxisT({
    this.viewport,
    super.gridlineStyle,
    super.labelAnchor,
    // super.labelCollisionOffsetFromAxis,
    // super.labelCollisionOffsetFromTick,
    // super.labelCollisionRotation,
    super.labelOffsetFromAxis,
    // super.labelOffsetFromTick,
    super.labelRotation,
    super.labelStyle,
    super.axisLineStyle,
    super.minimumPaddingBetweenLabels,
    super.noRenderSpec,
    super.axisRenderType,
    super.showAxisLine,
    super.tickLabelFormatter,
    super.tickLabelJustification,
    super.tickLength,
    super.tickLineStyle,
  });

  /// set limit view for domain axis
  final TimeViewport? viewport;

  @override
  common.DateTimeAxisSpec axisSpec() {
    return common.DateTimeAxisSpec(
      viewport: viewport?.getRender(),
      renderSpec: getRenderSpec(),
      showAxisLine: showAxisLine,
      tickFormatterSpec: tickLabelFormatter == null
          ? null
          : common.BasicDateTimeTickFormatterSpec(tickLabelFormatter!),
    );
  }
}
