import 'enums.dart';
import 'method_type.dart';
import 'style.dart';
import 'viewport.dart';

class DomainAxis {
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

  /// thick axis length\
  /// default: 3
  final int thickLength;

  /// set limit view for domain axis
  final OrdinalViewport? ordinalViewport;

  /// set limit view for domain axis
  final NumericViewport? numericViewport;

  /// set limit view for domain axis
  final TimeViewport? timeViewport;

  final LabelFormatterT? labelFormatterT;

  const DomainAxis({
    this.showLine = true,
    this.lineStyle = const LineStyle(),
    this.labelStyle = const LabelStyle(),
    this.gapAxisToLabel = 5,
    this.labelAnchor = LabelAnchor.centered,
    this.thickLength = 3,
    this.ordinalViewport,
    this.numericViewport,
    this.timeViewport,
    this.labelFormatterT,
  });
}

class MeasureAxis {
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

  /// thick axis length\
  /// default: 3
  final int thickLength;

  final int? desiredMinTickCount;

  final int? desiredMaxTickCount;

  /// minimal 2 count, as MinTick & MaxTick
  final int? desiredTickCount;

  /// format text label to show
  final MeasureFormat? labelFormat;

  /// Set the viewport of the measure axis
  final NumericViewport? numericViewport;

  const MeasureAxis({
    this.showLine = false,
    this.lineStyle = const LineStyle(),
    this.labelStyle = const LabelStyle(),
    this.gapAxisToLabel = 5,
    this.labelAnchor = LabelAnchor.centered,
    this.thickLength = 3,
    this.labelFormat,
    this.desiredMaxTickCount,
    this.desiredMinTickCount,
    this.desiredTickCount,
    this.numericViewport,
  });
}
