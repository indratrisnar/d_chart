part of 'data_model.dart';

/// Ordinal Data
class OrdinalData extends ChartData {
  final String domain;

  OrdinalData({
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
  });
}
