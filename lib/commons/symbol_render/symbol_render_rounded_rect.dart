part of 'symbol_render.dart';

class SymbolRenderRoundedRect extends SymbolRender {
  /// fill circle\
  /// default: true
  final bool isSolid;

  /// radius for corner rect
  final double? radius;

  SymbolRenderRoundedRect({
    this.isSolid = true,
    this.radius,
  });

  @override
  common.SymbolRenderer getRenderer() {
    return common.RoundedRectSymbolRenderer(
      isSolid: isSolid,
      radius: radius,
    );
  }
}
