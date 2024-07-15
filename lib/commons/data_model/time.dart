part of 'data_model.dart';

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
