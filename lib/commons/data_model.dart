import 'dart:ui';

import 'package:flutter/material.dart';

import 'enums.dart';

/// Ordinal Data
class OrdinalData {
  final String domain;
  final num measure;

  /// specifically for pie chart
  final Color? color;

  final dynamic other;

  /// Ordinal Data
  OrdinalData({
    required this.domain,
    required this.measure,
    this.color,
    this.other,
  });
}

/// Ordinal group
class OrdinalGroup {
  /// as key chart
  final String id;

  /// work when use in DChartCombo\
  /// default: `ChartType.line`
  final ChartType chartType;

  /// all data in same group has same color
  final Color? color;

  /// list of data
  final List<OrdinalData> data;

  /// Ordinal group
  OrdinalGroup({
    required this.id,
    this.chartType = ChartType.line,
    this.color,
    required this.data,
  });
}

/// Numeric Data
class NumericData {
  final num domain;
  final num measure;

  /// specifically for pie chart
  final Color? color;
  final dynamic other;

  /// Numeric Data
  NumericData({
    required this.domain,
    required this.measure,
    this.color,
    this.other,
  });
}

/// Numeric group
class NumericGroup {
  /// as key chart
  final String id;

  /// work when use in DChartCombo\
  /// default: `ChartType.line`
  final ChartType chartType;

  /// all data in same group has same color
  final Color? color;

  /// list of data
  final List<NumericData> data;

  /// Numeric group
  NumericGroup({
    required this.id,
    this.chartType = ChartType.line,
    this.color,
    required this.data,
  });
}

/// Time Data
class TimeData {
  final DateTime domain;
  final num measure;

  /// specifically for pie charts
  final Color? color;
  final dynamic other;

  /// Time Data
  TimeData({
    required this.domain,
    required this.measure,
    this.color,
    this.other,
  });
}

/// Time group
class TimeGroup {
  /// as key chart
  final String id;

  /// work when use in DChartCombo\
  /// default: `ChartType.line`
  final ChartType chartType;

  /// all data in same group has same color
  final Color? color;

  /// list of data
  final List<TimeData> data;

  /// Time group
  TimeGroup({
    required this.id,
    this.chartType = ChartType.line,
    this.color,
    required this.data,
  });
}
