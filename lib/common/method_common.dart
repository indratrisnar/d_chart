part of '../d_chart.dart';

class MethodCommon {
  static charts.Color chartColor(Color color) {
    return charts.ColorUtil.fromDartColor(color);
  }

  static common.FillPatternType fillPattern(FillPattern pattern) {
    return switch (pattern) {
      FillPattern.forwarHatch => common.FillPatternType.forwardHatch,
      FillPattern.gradient => common.FillPatternType.gradient,
      _ => common.FillPatternType.solid,
    };
  }

  static common.TickLabelAnchor tickLabelAnchor(LabelAnchor? type) {
    switch (type) {
      case LabelAnchor.after:
        return common.TickLabelAnchor.after;
      case LabelAnchor.before:
        return common.TickLabelAnchor.before;
      case LabelAnchor.inside:
        return common.TickLabelAnchor.inside;
      default:
        return common.TickLabelAnchor.centered;
    }
  }

  static common.TickLabelJustification tickLabelJustification(
    TickLabelJustification? type,
  ) {
    if (type == TickLabelJustification.inside) {
      return common.TickLabelJustification.inside;
    }
    return common.TickLabelJustification.outside;
  }

  static TextDirection isLTR(bool ltr) {
    return ltr ? TextDirection.ltr : TextDirection.rtl;
  }

  static common.DateTimeFactory dateTimeFactory(bool useUTC) {
    return useUTC
        ? const common.UTCDateTimeFactory()
        : const common.LocalDateTimeFactory();
  }

  static common.BarLabelVerticalPosition barLabelVerticalPosition(
      BarLabelVerticalPosition type) {
    return switch (type) {
      BarLabelVerticalPosition.top => common.BarLabelVerticalPosition.top,
      _ => common.BarLabelVerticalPosition.middle,
    };
  }
}
