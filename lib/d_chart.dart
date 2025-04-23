// Almost all of resource of this package from community_charts_flutter
// Copyright 2018 the Charts project authors. Please see the AUTHORS file
// for details.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

library d_chart;

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:community_charts_common2/community_charts_common2.dart'
    as common;
import 'package:community_charts_flutter2/community_charts_flutter2.dart'
    as charts;

part 'base/base_d_chart.dart';

part 'common/axis/chart_axis.dart';
part 'common/axis/domain_axis.dart';
part 'common/axis/measure_axis.dart';
part 'common/config_series/config_series.dart';
part 'common/config_series/config_series_bar.dart';
part 'common/config_series/config_series_bar_lane.dart';
part 'common/config_series/config_series_bar_target_line.dart';
part 'common/config_series/config_series_line.dart';
part 'common/config_series/config_series_pie.dart';
part 'common/config_series/config_series_scatter.dart';
part 'common/data_model/data.dart';
part 'common/data_model/group.dart';
part 'common/decorator/arc_label_decorator.dart';
part 'common/decorator/bar_label_decorator.dart';
part 'common/decorator/point_label_decorator.dart';
part 'common/styles/arc_label_leader_line_style.dart';
part 'common/styles/label_style.dart';
part 'common/styles/line_style.dart';
part 'common/tick/numeric_tick_provider.dart';
part 'common/comparison_symbol_render.dart';
part 'common/constants.dart';
part 'common/enums.dart';
part 'common/layout_margin.dart';
part 'common/method_common.dart';
part 'common/symbol_render.dart';
part 'common/viewport.dart';

part 'types/bar/d_chart_bar_o.dart';
part 'types/bar/d_chart_bar_t.dart';

part 'types/bar_custom/view.dart';

part 'types/combo/d_chart_combo_n.dart';
part 'types/combo/d_chart_combo_o.dart';
part 'types/combo/d_chart_combo_t.dart';

part 'types/line/d_chart_line_n.dart';
part 'types/line/d_chart_line_t.dart';

part 'types/pie/d_chart_pie.dart';

part 'types/scatter/d_chart_scatter_n.dart';
part 'types/scatter/d_chart_scatter_t.dart';
