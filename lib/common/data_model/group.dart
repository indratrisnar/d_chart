part of '../../d_chart.dart';

abstract class ChartGroup<D> {
  const ChartGroup({
    required this.id,
    required this.data,
    required this.seriesCategory,
    required this.others,
  });

  /// as key group
  final String id;

  /// list of group data
  final List<D> data;

  /// for grouping stack
  final String? seriesCategory;

  /// custom object you designed
  final Object? others;
}

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
