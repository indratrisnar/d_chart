part of '../../d_chart.dart';

class NumericGroup extends ChartGroup<NumericData> {
  const NumericGroup({
    required super.id,
    required super.data,
    super.seriesCategory,
    super.others,
  });
}

class OrdinalGroup extends ChartGroup<OrdinalData> {
  const OrdinalGroup({
    required super.id,
    required super.data,
    super.seriesCategory,
    super.others,
  });
}

class TimeGroup extends ChartGroup<TimeData> {
  const TimeGroup({
    required super.id,
    required super.data,
    super.seriesCategory,
    super.others,
  });
}
