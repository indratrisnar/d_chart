part of 'data_model.dart';

/// Ordinal Data
class OrdinalData extends ChartData {
  final String domain;

  final String? domainLowerBound;

  final String? domainUpperBound;

  OrdinalData({
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
    super.useSecondaryMeasureAxis,
  });
}
