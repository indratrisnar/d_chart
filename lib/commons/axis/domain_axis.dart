part of 'axis.dart';

class DomainAxis extends ChartAxis {
  /// show domain line\
  /// default: true
  final bool showLine;

  /// styling for domain line
  final LineStyle lineStyle;

  /// styling for domain label
  final LabelStyle labelStyle;

  /// default: 5
  final int? gapAxisToLabel;

  /// label position based on tick axis\
  /// default: `LabelAnchor.centered`
  final LabelAnchor labelAnchor;

  /// tick axis length\
  /// default: 3
  final int tickLength;

  /// manage tick
  final NumericTickProvider? numericTickProvider;

  /// set limit view for domain axis
  final OrdinalViewport? ordinalViewport;

  /// set limit view for domain axis
  final NumericViewport? numericViewport;

  /// set limit view for domain axis
  final TimeViewport? timeViewport;

  /// tick label format
  final String Function(num? domain)? tickLabelFormatterN;

  /// tick label format for time series
  ///
  /// for Combo Time, need more width to show more label even there is minus padding.
  /// except for format like only number date.
  ///
  final String Function(DateTime domain)? tickLabelFormatterT;

  /// can be use as space beetween label.
  ///
  /// more smaller padding, then label will be getting closer,
  /// they can even collide with each other, take each other's place
  ///
  /// default: 0
  final int minimumPaddingBetweenLabels;

  /// starting point at center right.
  ///
  /// center right = 0 degree.
  ///
  /// default: 0
  final int labelRotation;

  const DomainAxis({
    this.showLine = true,
    this.lineStyle = const LineStyle(),
    this.labelStyle = const LabelStyle(),
    this.gapAxisToLabel = 5,
    this.labelAnchor = LabelAnchor.centered,
    this.tickLength = 3,
    this.ordinalViewport,
    this.numericViewport,
    this.timeViewport,
    this.tickLabelFormatterN,
    this.tickLabelFormatterT,
    this.minimumPaddingBetweenLabels = 0,
    this.labelRotation = 0,
    this.numericTickProvider,
    super.noRenderSpec,
    super.useGridLine,
    super.gridLineStyle,
    super.tickLineStyle,
  });
}
