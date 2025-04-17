part of '../d_chart.dart';

abstract class ComparisonSymbolRender {
  const ComparisonSymbolRender();

  common.PointSymbolRenderer getRenderer();
}

class ComparisonSymbolRenderCylinder extends ComparisonSymbolRender {
  const ComparisonSymbolRenderCylinder();
  @override
  common.PointSymbolRenderer getRenderer() {
    return common.CylinderSymbolRenderer();
  }
}

class ComparisonSymbolRenderRectangleRange extends ComparisonSymbolRender {
  const ComparisonSymbolRenderRectangleRange();
  @override
  common.PointSymbolRenderer getRenderer() {
    return common.RectangleRangeSymbolRenderer();
  }
}
