part of 'symbol_render.dart';

class SymbolRenderCircle extends SymbolRender {
  /// fill circle\
  /// default: true
  final bool isSolid;

  SymbolRenderCircle({
    this.isSolid = true,
  });

  @override
  common.SymbolRenderer getRenderer() {
    return common.CircleSymbolRenderer(
      isSolid: isSolid,
    );
  }
}
