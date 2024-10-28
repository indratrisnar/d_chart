part of 'data_model.dart';

/// Time Data
class TimeData extends ChartData {
  final DateTime domain;

  final DateTime? domainLowerBound;

  final DateTime? domainUpperBound;

  TimeData({
    required this.domain,
    this.domainLowerBound,
    this.domainUpperBound,
    required super.measure,
    super.measureLowerBound,
    super.measureUpperBound,
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
    super.useSecondaryMeasureAxis,
  });
}
