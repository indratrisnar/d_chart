part of '../../d_chart.dart';

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
