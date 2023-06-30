import 'package:community_charts_common/community_charts_common.dart' as common;
import 'package:flutter/material.dart';
import 'method_common.dart';

class LineStyle {
  /// line color\
  /// default: Colors.grey
  final Color color;

  /// line pattern
  final List<int>? dashPattern;

  /// line thickness\
  /// default: 1
  final int? thickness;

  const LineStyle({
    this.color = Colors.grey,
    this.dashPattern,
    this.thickness,
  });

  common.LineStyleSpec getRender() {
    return common.LineStyleSpec(
      color: MethodCommon.chartColor(color),
      dashPattern: dashPattern,
      thickness: thickness,
    );
  }
}

class LabelStyle {
  /// line color\
  /// default: Colors.black87
  final Color color;

  /// text font size\
  /// default: 12
  final int? fontSize;

  const LabelStyle({
    this.color = Colors.black87,
    this.fontSize = 12,
  });

  common.TextStyleSpec getRender() {
    return common.TextStyleSpec(
      color: MethodCommon.chartColor(color),
      fontSize: fontSize,
    );
  }
}
