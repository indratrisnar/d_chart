part of 'decorator.dart';

class ArcLabelDecorator {
  /// Configures [TextStyleSpec] for labels placed inside the arcs.
  final LabelStyle insideLabelStyle;

  /// Configures [TextStyleSpec] for labels placed outside the arcs.
  final LabelStyle outsideLabelStyle;

  /// Configures [ArcLabelLeaderLineStyleSpec] for leader lines for labels
  /// placed outside the arcs.
  final ArcLabelLeaderLineStyle leaderLineStyle;

  /// Configures where to place the label relative to the arcs.
  final ArcLabelPosition labelPosition;

  /// Space before and after the label text.
  final int labelPadding;

  /// Whether or not to draw leader lines for labels placed outside the arcs.
  final bool showLeaderLines;

  ArcLabelDecorator({
    this.insideLabelStyle = const LabelStyle(
      fontSize: 12,
      color: Colors.white,
    ),
    this.outsideLabelStyle = const LabelStyle(
      fontSize: 12,
      color: Colors.black,
    ),
    this.leaderLineStyle = const ArcLabelLeaderLineStyle(
      color: Colors.black,
      length: 20.0,
      thickness: 1.0,
    ),
    this.labelPosition = ArcLabelPosition.auto,
    this.labelPadding = 5,
    this.showLeaderLines = true,
  });

  common.ArcLabelDecorator<String> getRenderOrdinal() {
    return common.ArcLabelDecorator<String>(
      insideLabelStyleSpec: insideLabelStyle.getRender(),
      outsideLabelStyleSpec: outsideLabelStyle.getRender(),
      labelPadding: labelPadding,
      labelPosition: _getArcLabelPosition(labelPosition),
      leaderLineStyleSpec: leaderLineStyle.getRender(),
      showLeaderLines: showLeaderLines,
    );
  }

  common.ArcLabelDecorator<num> getRenderNumeric() {
    return common.ArcLabelDecorator<num>(
      insideLabelStyleSpec: insideLabelStyle.getRender(),
      outsideLabelStyleSpec: outsideLabelStyle.getRender(),
      labelPadding: labelPadding,
      labelPosition: _getArcLabelPosition(labelPosition),
      leaderLineStyleSpec: leaderLineStyle.getRender(),
      showLeaderLines: showLeaderLines,
    );
  }

  common.ArcLabelDecorator<DateTime> getRenderTime() {
    return common.ArcLabelDecorator<DateTime>(
      insideLabelStyleSpec: insideLabelStyle.getRender(),
      outsideLabelStyleSpec: outsideLabelStyle.getRender(),
      labelPadding: labelPadding,
      labelPosition: _getArcLabelPosition(labelPosition),
      leaderLineStyleSpec: leaderLineStyle.getRender(),
      showLeaderLines: showLeaderLines,
    );
  }

  static common.ArcLabelPosition _getArcLabelPosition(ArcLabelPosition? type) {
    return switch (type) {
      ArcLabelPosition.inside => common.ArcLabelPosition.inside,
      ArcLabelPosition.outside => common.ArcLabelPosition.outside,
      _ => common.ArcLabelPosition.auto,
    };
  }
}
