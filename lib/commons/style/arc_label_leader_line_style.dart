part of 'style.dart';

class ArcLabelLeaderLineStyle {
  final Color color;
  final double length;
  final double thickness;

  const ArcLabelLeaderLineStyle({
    required this.color,
    required this.length,
    required this.thickness,
  });

  common.ArcLabelLeaderLineStyleSpec getRender() {
    return common.ArcLabelLeaderLineStyleSpec(
      color: MethodCommon.chartColor(color),
      length: length,
      thickness: thickness,
    );
  }
}
