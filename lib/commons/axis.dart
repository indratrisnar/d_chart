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

  /// label format for time series
  ///
  /// for Combo Time, need more width to show more label even there is minus padding.
  /// except for format like only number date.
  ///
  final LabelFormatterT? labelFormatterT;

  /// can be use as space beetween label.
  ///
  /// more smaller padding, then label will be getting closer,
  /// they can even collide with each other, take each other's place
  ///
  /// default: 0
  final int minimumPaddingBetweenLabels;

  /// starting point at center right.
  ///
  /// center right = 0 degree. starting 30 - 90, will be affect to height of chart widget
  ///
  /// default: 0
  final int labelRotation;

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
    this.minimumPaddingBetweenLabels = 0,
    this.labelRotation = 0,
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

  /// set limit view for measure axis
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
