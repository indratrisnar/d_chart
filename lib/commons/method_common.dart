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
}
