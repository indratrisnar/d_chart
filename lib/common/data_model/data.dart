part of '../../d_chart.dart';

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
  final num? measure;

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

class NumericData extends ChartData<num> {
  const NumericData({
    required super.domain,
    required super.measure,
    super.domainLowerBound,
    super.measureLowerBound,
    super.domainUpperBound,
    super.measureUpperBound,
    super.others,
  });
}

class OrdinalData extends ChartData<String> {
  const OrdinalData({
    required super.domain,
    required super.measure,
    super.domainLowerBound,
    super.measureLowerBound,
    super.domainUpperBound,
    super.measureUpperBound,
    super.others,
  });
}

class TimeData extends ChartData<DateTime> {
  const TimeData({
    required super.domain,
    required super.measure,
    super.domainLowerBound,
    super.measureLowerBound,
    super.domainUpperBound,
    super.measureUpperBound,
    super.others,
  });
}
