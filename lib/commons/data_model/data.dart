part of 'model.dart';

class NumericData extends ChartData<num> {
  NumericData({
    required super.domain,
    required super.measure,
    super.domainLowerBound,
    super.measureLowerBound,
    super.domainUpperBound,
    super.measureUpperBound,
    super.color,
    super.other,
  });
}

class OrdinalData extends ChartData<String> {
  OrdinalData({
    required super.domain,
    required super.measure,
    super.domainLowerBound,
    super.measureLowerBound,
    super.domainUpperBound,
    super.measureUpperBound,
    super.color,
    super.other,
  });
}

class TimeData extends ChartData<DateTime> {
  TimeData({
    required super.domain,
    required super.measure,
    super.domainLowerBound,
    super.measureLowerBound,
    super.domainUpperBound,
    super.measureUpperBound,
    super.color,
    super.other,
  });
}
