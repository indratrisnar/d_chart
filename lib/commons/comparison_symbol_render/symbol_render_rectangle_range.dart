part of 'symbol_render.dart';

class ComparisonSymbolRenderRectangleRange extends ComparisonSymbolRender {
  const ComparisonSymbolRenderRectangleRange();
  @override
  common.PointSymbolRenderer getRenderer() {
    return common.RectangleRangeSymbolRenderer();
  }
}
