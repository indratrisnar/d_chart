part of '../../d_chart.dart';

abstract class BarLabelDecorator<T> {
  const BarLabelDecorator({
    this.insideLabelAnchor,
    this.labelPadding = 5,
    this.barLabelPosition = BarLabelPosition.auto,
    this.insideLabelStyle,
    this.outsideLabelStyle,
  });

  /// position label bar chart item
  final BarLabelAnchor? insideLabelAnchor;

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

  common.BarLabelDecorator<T> render() {
    return common.BarLabelDecorator<T>(
      insideLabelStyleSpec: insideLabelStyle?.getRender(),
      outsideLabelStyleSpec: outsideLabelStyle?.getRender(),
      labelAnchor: _getBarLabelAnchor(insideLabelAnchor),
      labelPadding: labelPadding,
      labelPosition: _getBarLabelPosition(barLabelPosition),
      labelPlacement: common.BarLabelPlacement.opposeAxisBaseline,
      labelVerticalPosition: common.BarLabelVerticalPosition.middle,
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

class BarLabelDecoratorN extends BarLabelDecorator<num> {
  const BarLabelDecoratorN({
    super.barLabelPosition,
    super.insideLabelStyle,
    super.insideLabelAnchor,
    super.labelPadding,
    super.outsideLabelStyle,
  });
}

class BarLabelDecoratorO extends BarLabelDecorator<String> {
  const BarLabelDecoratorO({
    super.barLabelPosition,
    super.insideLabelStyle,
    super.insideLabelAnchor,
    super.labelPadding,
    super.outsideLabelStyle,
  });
}

class BarLabelDecoratorT extends BarLabelDecorator<DateTime> {
  const BarLabelDecoratorT({
    super.barLabelPosition,
    super.insideLabelStyle,
    super.insideLabelAnchor,
    super.labelPadding,
    super.outsideLabelStyle,
  });
}
