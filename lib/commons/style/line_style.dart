part of 'style.dart';

class LineStyle {
  /// line color\
  /// default: Colors.grey
  final Color color;

  /// line pattern
  final List<int>? dashPattern;

  /// line thickness\
  /// default: 1
  final int? thickness;

  const LineStyle({
    this.color = Colors.black12,
    this.dashPattern,
    this.thickness,
  });

  common.LineStyleSpec getRender() {
    return common.LineStyleSpec(
      color: MethodCommon.chartColor(color),
      dashPattern: dashPattern,
      thickness: thickness,
    );
  }
}
