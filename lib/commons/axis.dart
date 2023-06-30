import 'method_type.dart';

import 'enums.dart';

import 'style.dart';

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

  const DomainAxis({
    this.showLine = true,
    this.lineStyle = const LineStyle(),
    this.labelStyle = const LabelStyle(),
    this.gapAxisToLabel = 5,
    this.labelAnchor = LabelAnchor.centered,
    this.thickLength = 3,
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
  });
}
