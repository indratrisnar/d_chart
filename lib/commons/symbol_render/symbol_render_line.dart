part of 'symbol_render.dart';

class SymbolRenderLine extends SymbolRender {
  /// pattern line
  final List<int>? dashPattern;

  /// fill line\
  /// default: true
  final bool isSolid;

  /// thickness of line
  final double? strokeWidth;

  SymbolRenderLine({
    this.dashPattern,
    this.isSolid = true,
    this.strokeWidth,
  });

  @override
  common.SymbolRenderer getRenderer() {
    return common.LineSymbolRenderer(
      dashPattern: dashPattern,
      isSolid: isSolid,
      strokeWidth: strokeWidth,
    );
  }
}
