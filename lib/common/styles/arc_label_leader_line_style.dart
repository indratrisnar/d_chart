part of '../../d_chart.dart';

class ArcLabelLeaderLineStyle {
  const ArcLabelLeaderLineStyle({
    required this.color,
    required this.length,
    required this.thickness,
  });

  final Color color;
  final double length;
  final double thickness;

  common.ArcLabelLeaderLineStyleSpec getRender() {
    return common.ArcLabelLeaderLineStyleSpec(
      color: MethodCommon.chartColor(color),
      length: length,
      thickness: thickness,
    );
  }
}
