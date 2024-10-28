import 'dart:math';

import 'package:community_charts_common/community_charts_common.dart' as common;
import '../comparison_symbol_render/symbol_render.dart';

import '../decorator/decorator.dart';
import '../enums.dart';
import '../method_common.dart';
import '../symbol_render/symbol_render.dart';

part 'config_render_bar.dart';
part 'config_render_line.dart';
part 'config_render_pie.dart';
part 'config_render_point.dart';

abstract class ConfigRender {
  const ConfigRender();
}
