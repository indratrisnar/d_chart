import 'package:community_charts_common/community_charts_common.dart' as common;

part 'symbol_render_circle.dart';
part 'symbol_render_line.dart';
part 'symbol_render_rect.dart';
part 'symbol_render_rounded_rect.dart';
part 'symbol_render_triangle.dart';

abstract class SymbolRender {
  common.SymbolRenderer getRenderer();
}
