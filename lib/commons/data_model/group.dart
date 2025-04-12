part of 'model.dart';

class NumericGroup extends ChartGroup<NumericData> {
  const NumericGroup({
    required super.id,
    required super.data,
    super.chartType,
    super.color,
    super.seriesCategory,
  });
}

class OrdinalGroup extends ChartGroup<OrdinalData> {
  const OrdinalGroup({
    required super.id,
    required super.data,
    super.chartType,
    super.color,
    super.seriesCategory,
  });
}

class TimeGroup extends ChartGroup<TimeData> {
  const TimeGroup({
    required super.id,
    required super.data,
    super.chartType,
    super.color,
    super.seriesCategory,
  });
}
