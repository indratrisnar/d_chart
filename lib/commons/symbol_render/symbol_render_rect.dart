part of 'symbol_render.dart';

class SymbolRenderRect extends SymbolRender {
  /// fill circle\
  /// default: true
  final bool isSolid;

  SymbolRenderRect({
    this.isSolid = true,
  });

  @override
  common.SymbolRenderer getRenderer() {
    return common.RectSymbolRenderer(
      isSolid: isSolid,
    );
  }
}
