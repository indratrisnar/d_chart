import 'package:community_charts_common/community_charts_common.dart' as common;

abstract class SymbolRender {
  common.SymbolRenderer getRenderer();
}

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
