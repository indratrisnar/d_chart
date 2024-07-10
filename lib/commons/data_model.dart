import 'dart:ui';

import 'package:flutter/material.dart';

import 'enums.dart';

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

  ChartGroup({
    required this.id,
    this.seriesCategory,
    this.chartType = ChartType.line,
    this.color,
  });
}

abstract class ChartData {
  final num measure;

  /// specifically for pie chart
  final Color? color;

  final dynamic other;

  /// Chart Data
  ChartData({
    required this.measure,
    this.color,
    this.other,
  });
}

/// Ordinal Data
class OrdinalData extends ChartData {
  final String domain;

  OrdinalData({
    required this.domain,
    required super.measure,
    super.color,
    super.other,
  });

  Map<String, dynamic> toMap() => {
        'domain': domain,
        'measure': measure,
        'color': color,
        'other': other,
      };
}

/// Ordinal group
class OrdinalGroup extends ChartGroup {
  /// list of data
  final List<OrdinalData> data;

  OrdinalGroup({
    required super.id,
    required this.data,
    super.chartType,
    super.color,
    super.seriesCategory,
  });
}

/// Numeric Data
class NumericData extends ChartData {
  final num domain;

  NumericData({
    required this.domain,
    required super.measure,
    super.color,
    super.other,
  });

  Map<String, dynamic> toMap() => {
        'domain': domain,
        'measure': measure,
        'color': color,
        'other': other,
      };
}

/// Numeric group
class NumericGroup extends ChartGroup {
  /// list of data
  final List<NumericData> data;

  /// Numeric group
  NumericGroup({
    required super.id,
    required this.data,
    super.chartType,
    super.color,
    super.seriesCategory,
  });
}

/// Time Data
class TimeData extends ChartData {
  final DateTime domain;

  TimeData({
    required this.domain,
    required super.measure,
    super.color,
    super.other,
  });

  Map<String, dynamic> toMap() => {
        'domain': domain,
        'measure': measure,
        'color': color,
        'other': other,
      };
}

/// Time group
class TimeGroup extends ChartGroup {
  /// list of data
  final List<TimeData> data;

  /// Time group
  TimeGroup({
    required super.id,
    required this.data,
    super.chartType,
    super.color,
    super.seriesCategory,
  });
}
