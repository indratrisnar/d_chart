part of '../../d_chart.dart';

abstract class ChartGroup<D> {
  const ChartGroup({
    required this.id,
    required this.data,
    required this.seriesCategory,
    required this.others,
  });

  /// as key chart
  final String id;

  /// list of data
  final List<D> data;

  /// for grouping stack
  final String? seriesCategory;

  /// custom object you designed
  final Object? others;
}

abstract class ChartData<T> {
  const ChartData({
    required this.measure,
    required this.domain,
    this.measureLowerBound,
    this.domainLowerBound,
    this.measureUpperBound,
    this.domainUpperBound,
    this.others,
  });

  final T domain;
  final num measure;

  final T? domainLowerBound;
  final num? measureLowerBound;

  final T? domainUpperBound;
  final num? measureUpperBound;

  /// custom object you designed
  final Object? others;

  Map<String, dynamic> toMap() => {
        'domain': domain,
        'measure': measure,
        'domainLowerBound': domainLowerBound,
        'measureLowerBound': measureLowerBound,
        'domainUpperBound': domainUpperBound,
        'measureUpperBound': measureUpperBound,
        'other': others,
      };
}
