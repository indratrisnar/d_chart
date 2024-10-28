import 'package:community_charts_common/community_charts_common.dart' as common;

part 'symbol_render_rectangle_range.dart';
part 'symbol_render_cylinder.dart';

abstract class ComparisonSymbolRender {
  const ComparisonSymbolRender();

  common.PointSymbolRenderer getRenderer();
}
