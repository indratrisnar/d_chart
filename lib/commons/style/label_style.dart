part of 'style.dart';

class LabelStyle {
  /// line color\
  /// default: Colors.black87
  final Color color;

  /// text font size\
  /// default: 12
  final int? fontSize;

  /// weight of text, thickness of text
  final FontWeight fontWeight;

  /// such as height inside Flutter TextStyle
  final double? lineHeight;

  const LabelStyle({
    this.color = Colors.black87,
    this.fontSize = 12,
    this.fontWeight = FontWeight.normal,
    this.lineHeight,
  });

  common.TextStyleSpec getRender() {
    return common.TextStyleSpec(
      color: MethodCommon.chartColor(color),
      fontSize: fontSize,
      fontWeight: fontWeight.value.toString(),
      lineHeight: lineHeight,
    );
  }
}
