part of '../../d_chart.dart';

class LineStyle {
  const LineStyle({
    this.color = Colors.black12,
    this.dashPattern,
    this.thickness,
  });

  /// line color\
  /// default: Colors.black12
  final Color color;

  /// line pattern
  final List<int>? dashPattern;

  /// line thickness\
  /// default: 1
  final int? thickness;

  common.LineStyleSpec getRender() {
    return common.LineStyleSpec(
      color: MethodCommon.chartColor(color),
      dashPattern: dashPattern,
      thickness: thickness,
    );
  }
}
