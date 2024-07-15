part of 'axis.dart';

class MeasureAxis extends ChartAxis {
  /// show domain line\
  /// default: false
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

  /// format text label to show
  final String Function(num? measure)? tickLabelFormatter;

  /// set limit view for measure axis
  final NumericViewport? numericViewport;

  const MeasureAxis({
    this.showLine = false,
    this.lineStyle = const LineStyle(),
    this.labelStyle = const LabelStyle(),
    this.gapAxisToLabel = 5,
    this.labelAnchor = LabelAnchor.centered,
    this.tickLength = 3,
    this.tickLabelFormatter,
    this.numericTickProvider,
    this.numericViewport,
    super.noRenderSpec,
  });
}
