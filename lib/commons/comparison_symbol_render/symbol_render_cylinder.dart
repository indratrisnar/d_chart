part of 'symbol_render.dart';

class ComparisonSymbolRenderCylinder extends ComparisonSymbolRender {
  const ComparisonSymbolRenderCylinder();
  @override
  common.PointSymbolRenderer getRenderer() {
    return common.CylinderSymbolRenderer();
  }
}
