import 'package:community_charts_common/community_charts_common.dart' as common;
import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;

class LayoutMargin {
  final int left;
  final int top;
  final int right;
  final int bottom;

  LayoutMargin(this.left, this.top, this.right, this.bottom);

  charts.LayoutConfig getRender() {
    return charts.LayoutConfig(
      leftMarginSpec: common.MarginSpec.fixedPixel(left),
      topMarginSpec: common.MarginSpec.fixedPixel(top),
      rightMarginSpec: common.MarginSpec.fixedPixel(right),
      bottomMarginSpec: common.MarginSpec.fixedPixel(bottom),
    );
  }

  static charts.LayoutConfig get defaultRender {
    return charts.LayoutConfig(
      leftMarginSpec: common.MarginSpec.fixedPixel(20),
      topMarginSpec: common.MarginSpec.fixedPixel(20),
      rightMarginSpec: common.MarginSpec.fixedPixel(20),
      bottomMarginSpec: common.MarginSpec.fixedPixel(20),
    );
  }
}
