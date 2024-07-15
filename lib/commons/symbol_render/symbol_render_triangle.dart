part of 'symbol_render.dart';

class SymbolRenderTriangle extends SymbolRender {
  /// fill circle\
  /// default: true
  final bool isSolid;

  SymbolRenderTriangle({
    this.isSolid = true,
  });

  @override
  common.SymbolRenderer getRenderer() {
    return common.TriangleSymbolRenderer(
      isSolid: isSolid,
    );
  }
}
