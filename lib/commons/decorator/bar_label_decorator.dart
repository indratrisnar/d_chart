part of 'decorator.dart';

class BarLabelDecorator {
  /// position label bar chart item
  final BarLabelAnchor? labelAnchor;

  /// Configures where to place the label relative to the bars.\
  /// default: `BarLabelPosition.auto`
  final BarLabelPosition barLabelPosition;

  /// Space before and after the label text.\
  /// default: 5
  final int labelPadding;

  /// style for label when the position is inside
  final LabelStyle? insideLabelStyle;

  /// style for label when the position is outside
  final LabelStyle? outsideLabelStyle;

  BarLabelDecorator({
    this.labelAnchor,
    this.labelPadding = 5,
    this.barLabelPosition = BarLabelPosition.auto,
    this.insideLabelStyle,
    this.outsideLabelStyle,
  });

  common.BarLabelDecorator<num> getRenderNumeric() {
    return common.BarLabelDecorator(
      insideLabelStyleSpec: insideLabelStyle?.getRender(),
      outsideLabelStyleSpec: outsideLabelStyle?.getRender(),
      labelAnchor: _getBarLabelAnchor(labelAnchor),
      labelPadding: labelPadding,
      labelPosition: _getBarLabelPosition(barLabelPosition),
    );
  }

  common.BarLabelDecorator<String> getRenderOrdinal() {
    return common.BarLabelDecorator(
      insideLabelStyleSpec: insideLabelStyle?.getRender(),
      outsideLabelStyleSpec: outsideLabelStyle?.getRender(),
      labelAnchor: _getBarLabelAnchor(labelAnchor),
      labelPadding: labelPadding,
      labelPosition: _getBarLabelPosition(barLabelPosition),
    );
  }

  common.BarLabelDecorator<DateTime> getRenderTime() {
    return common.BarLabelDecorator(
      insideLabelStyleSpec: insideLabelStyle?.getRender(),
      outsideLabelStyleSpec: outsideLabelStyle?.getRender(),
      labelAnchor: _getBarLabelAnchor(labelAnchor),
      labelPadding: labelPadding,
      labelPosition: _getBarLabelPosition(barLabelPosition),
    );
  }

  common.BarLabelAnchor _getBarLabelAnchor(BarLabelAnchor? type) {
    return switch (type) {
      BarLabelAnchor.start => common.BarLabelAnchor.start,
      BarLabelAnchor.middle => common.BarLabelAnchor.middle,
      _ => common.BarLabelAnchor.end,
    };
  }

  common.BarLabelPosition _getBarLabelPosition(BarLabelPosition? type) {
    return switch (type) {
      BarLabelPosition.inside => common.BarLabelPosition.inside,
      BarLabelPosition.outside => common.BarLabelPosition.outside,
      BarLabelPosition.right => common.BarLabelPosition.right,
      _ => common.BarLabelPosition.auto,
    };
  }
}
