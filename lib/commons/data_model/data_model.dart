import 'dart:ui';

import 'package:flutter/material.dart';

import '../enums.dart';

part 'numeric.dart';
part 'ordinal.dart';
part 'time.dart';

abstract class ChartGroup {
  /// as key chart
  final String id;

  /// for grouping stack
  final String? seriesCategory;

  /// work when use in DChartCombo\
  /// default: `ChartType.line`
  final ChartType chartType;

  /// all data in same group has same color
  final Color? color;

  /// default: false
  final bool useSecondaryMeasureAxis;

  ChartGroup({
    required this.id,
    this.seriesCategory,
    this.chartType = ChartType.line,
    this.color,
    this.useSecondaryMeasureAxis = false,
  });
}

abstract class ChartData {
  final num measure;

  final num? measureLowerBound;

  final num? measureUpperBound;

  /// specifically for pie chart
  final Color? color;

  final dynamic other;

  /// Chart Data
  ChartData({
    required this.measure,
    this.measureLowerBound,
    this.measureUpperBound,
    this.color,
    this.other,
  });
}
