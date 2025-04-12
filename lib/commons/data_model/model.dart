import 'package:flutter/material.dart';
import '../enums.dart';

part 'data.dart';
part 'group.dart';

abstract class ChartGroup<D> {
  const ChartGroup({
    required this.id,
    required this.data,
    this.seriesCategory,
    this.chartType = ChartType.line,
    this.color,
    this.useSecondaryMeasureAxis = false,
  });

  /// as key chart
  final String id;

  /// list of data
  final List<D> data;

  /// for grouping stack
  final String? seriesCategory;

  /// work when use in DChartCombo\
  /// default: `ChartType.line`
  final ChartType chartType;

  /// all data in same group has same color
  final Color? color;

  final bool useSecondaryMeasureAxis;
}

abstract class ChartData<T> {
  const ChartData({
    required this.measure,
    required this.domain,
    this.measureLowerBound,
    this.domainLowerBound,
    this.measureUpperBound,
    this.domainUpperBound,
    this.color,
    this.other,
  });

  final T domain;
  final num measure;

  final T? domainLowerBound;
  final num? measureLowerBound;

  final T? domainUpperBound;
  final num? measureUpperBound;

  /// specifically for pie chart
  final Color? color;

  final dynamic other;

  Map<String, dynamic> toMap() => {
        'domain': domain,
        'measure': measure,
        'color': color,
        'other': other,
      };
}
