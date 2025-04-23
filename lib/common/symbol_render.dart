part of '../d_chart.dart';

abstract class SymbolRender {
  const SymbolRender({
    this.isSolid = true,
  });

  /// fill shape\
  /// default: true
  final bool isSolid;

  common.SymbolRenderer getRenderer();
}

class SymbolRenderCircle extends SymbolRender {
  const SymbolRenderCircle({
    super.isSolid,
  });

  @override
  common.SymbolRenderer getRenderer() {
    return common.CircleSymbolRenderer(
      isSolid: isSolid,
    );
  }
}

class SymbolRenderLine extends SymbolRender {
  const SymbolRenderLine({
    super.isSolid,
    this.dashPattern,
    this.strokeWidth,
  });

  /// pattern line
  final List<int>? dashPattern;

  /// thickness of line
  final double? strokeWidth;

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
  const SymbolRenderRect({
    super.isSolid,
  });

  @override
  common.SymbolRenderer getRenderer() {
    return common.RectSymbolRenderer(
      isSolid: isSolid,
    );
  }
}

class SymbolRenderRoundedRect extends SymbolRender {
  const SymbolRenderRoundedRect({
    super.isSolid,
    this.radius,
  });

  /// radius for corner rect
  final double? radius;

  @override
  common.SymbolRenderer getRenderer() {
    return common.RoundedRectSymbolRenderer(
      isSolid: isSolid,
      radius: radius,
    );
  }
}

class SymbolRenderTriangle extends SymbolRender {
  const SymbolRenderTriangle({
    super.isSolid,
  });

  @override
  common.SymbolRenderer getRenderer() {
    return common.TriangleSymbolRenderer(
      isSolid: isSolid,
    );
  }
}
