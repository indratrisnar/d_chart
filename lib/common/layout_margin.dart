part of '../d_chart.dart';

class LayoutMargin {
  const LayoutMargin(
    this.left,
    this.top,
    this.right,
    this.bottom,
  );

  final int left;
  final int top;
  final int right;
  final int bottom;

  charts.LayoutConfig getRender() {
    return charts.LayoutConfig(
      leftMarginSpec: common.MarginSpec.fixedPixel(left),
      topMarginSpec: common.MarginSpec.fixedPixel(top),
      rightMarginSpec: common.MarginSpec.fixedPixel(right),
      bottomMarginSpec: common.MarginSpec.fixedPixel(bottom),
    );
  }
}
