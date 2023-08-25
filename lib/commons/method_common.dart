import 'dart:math';

import 'package:community_charts_common/community_charts_common.dart' as common;
import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';

import '../commons/enums.dart';

class MethodCommon {
  static charts.Color chartColor(Color? color) {
    return charts.ColorUtil.fromDartColor(color ?? randomColor());
  }

  static Color randomColor() {
    var generatedColor = Random().nextInt(Colors.primaries.length);
    return Colors.primaries[generatedColor];
  }

  static common.FillPatternType fillPattern(FillPattern pattern) {
    if (pattern == FillPattern.forwarHatch) {
      return common.FillPatternType.forwardHatch;
    }
    return common.FillPatternType.solid;
  }

  static common.BarGroupingType barGroupingType(BarGroupingType? type) {
    switch (type) {
      case BarGroupingType.groupedStacked:
        return common.BarGroupingType.groupedStacked;
      case BarGroupingType.stacked:
        return common.BarGroupingType.stacked;
      default:
        return common.BarGroupingType.grouped;
    }
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

  static common.BarLabelAnchor barLabelAnchor(BarLabelAnchor? type) {
    switch (type) {
      case BarLabelAnchor.start:
        return common.BarLabelAnchor.start;
      case BarLabelAnchor.middle:
        return common.BarLabelAnchor.middle;
      default:
        return common.BarLabelAnchor.end;
    }
  }

  static common.BarLabelPosition barLabelPosition(BarLabelPosition? type) {
    switch (type) {
      case BarLabelPosition.inside:
        return common.BarLabelPosition.inside;
      case BarLabelPosition.outside:
        return common.BarLabelPosition.outside;
      case BarLabelPosition.right:
        return common.BarLabelPosition.right;
      default:
        return common.BarLabelPosition.auto;
    }
  }

  static common.ArcLabelPosition arcLabelPosition(ArcLabelPosition? type) {
    switch (type) {
      case ArcLabelPosition.inside:
        return common.ArcLabelPosition.inside;
      case ArcLabelPosition.outside:
        return common.ArcLabelPosition.outside;
      default:
        return common.ArcLabelPosition.auto;
    }
  }
}
