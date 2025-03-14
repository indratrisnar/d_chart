import 'package:flutter/material.dart';

/// used for comparisons nad progress
class DChartSingleBar extends StatelessWidget {
  /// set color for back side\
  /// Default: 10% opacity from [foregroundColor]
  final Color? backgroundColor;

  /// label between background and foreground\
  /// usually use widget Text/Icon
  final Widget? backgroundLabel;

  /// default: Alignment.centerRight
  final AlignmentGeometry? backgroundLabelAlign;

  /// default: const EdgeInsets.all(0)
  final EdgeInsetsGeometry? backgroundLabelPadding;

  /// set color for front side
  final Color foregroundColor;

  /// label in front of foreground\
  /// usually use widget Text/Icon
  final Widget? foregroundLabel;

  /// default: Alignment.centerRight
  final AlignmentGeometry? foregroundLabelAlign;

  /// default: const EdgeInsets.all(0)
  final EdgeInsetsGeometry? foregroundLabelPadding;

  /// radius for corner bar\
  /// set for back and front layer
  final BorderRadius? radius;

  /// value for divide\
  /// must 0 < value <= max
  final double value;

  /// max value\
  /// in percentage equal to 100%\
  /// must 0 >
  final double max;

  /// set click on background
  final void Function(double max)? onBackground;

  /// set click on foreground
  final void Function(double value)? onForground;

  /// direction\
  /// ltr -> Left to Right\
  /// if false -> Right to Left
  /// default: true
  final bool? ltr;

  const DChartSingleBar({
    super.key,
    this.backgroundColor,
    required this.foregroundColor,
    this.radius,
    required this.value,
    required this.max,
    this.onBackground,
    this.onForground,
    this.ltr,
    this.backgroundLabel,
    this.backgroundLabelAlign = Alignment.centerRight,
    this.backgroundLabelPadding = const EdgeInsets.all(0),
    this.foregroundLabel,
    this.foregroundLabelAlign = Alignment.centerRight,
    this.foregroundLabelPadding = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: (ltr ?? true) ? TextDirection.ltr : TextDirection.rtl,
      child: LayoutBuilder(
        builder: (_, constraints) {
          double newMax = max < 0 ? 0 : max;
          double newValue = value < 0
              ? 0
              : value > newMax
                  ? newMax
                  : value;
          double width = (newValue / newMax) * constraints.maxWidth;
          return Stack(
            children: [
              Material(
                color:
                    backgroundColor ?? foregroundColor.withValues(alpha: 0.1),
                borderRadius: radius,
                child: InkWell(
                  onTap:
                      onBackground == null ? null : () => onBackground!(newMax),
                  borderRadius: radius,
                  child: SizedBox(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                    child: backgroundLabel == null
                        ? null
                        : Align(
                            alignment: backgroundLabelAlign!,
                            child: Padding(
                              padding: backgroundLabelPadding!,
                              child: backgroundLabel,
                            ),
                          ),
                  ),
                ),
              ),
              Material(
                color: foregroundColor,
                borderRadius: radius,
                child: InkWell(
                  onTap:
                      onForground == null ? null : () => onForground!(newValue),
                  borderRadius: radius,
                  child: SizedBox(
                    width: width,
                    height: constraints.maxHeight,
                    child: foregroundLabel == null
                        ? null
                        : Align(
                            alignment: foregroundLabelAlign!,
                            child: Padding(
                              padding: foregroundLabelPadding!,
                              child: foregroundLabel,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
