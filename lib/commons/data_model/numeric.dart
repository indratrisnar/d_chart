part of 'data_model.dart';

/// Numeric Data
class NumericData extends ChartData {
  final num domain;

  NumericData({
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

/// Numeric group
class NumericGroup extends ChartGroup {
  /// list of data
  final List<NumericData> data;

  /// Numeric group
  NumericGroup({
    required super.id,
    required this.data,
    super.chartType,
    super.color,
    super.seriesCategory,
  });
}
