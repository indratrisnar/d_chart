part of '../../d_chart.dart';

class DomainAxisN extends ChartAxis<num> {
  const DomainAxisN({
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

  /// set limit view for domain axis
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

class DomainAxisO extends ChartAxis<String> {
  const DomainAxisO({
    this.viewport,
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

  /// set limit view for domain axis
  final OrdinalViewport? viewport;

  @override
  common.OrdinalAxisSpec axisSpec() {
    return common.OrdinalAxisSpec(
      viewport: viewport?.getRender(),
      renderSpec: getRenderSpec(),
      showAxisLine: showLine,
    );
  }
}

class DomainAxisT extends ChartAxis<DateTime> {
  const DomainAxisT({
    this.viewport,
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

  /// set limit view for domain axis
  final TimeViewport? viewport;

  @override
  common.DateTimeAxisSpec axisSpec() {
    return common.DateTimeAxisSpec(
      viewport: viewport?.getRender(),
      renderSpec: getRenderSpec(),
      showAxisLine: showLine,
      tickFormatterSpec: tickLabelFormatter == null
          ? null
          : common.BasicDateTimeTickFormatterSpec(tickLabelFormatter!),
    );
  }
}
