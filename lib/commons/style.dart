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

import 'package:community_charts_common/community_charts_common.dart' as common;
import 'package:flutter/material.dart';

import 'method_common.dart';

class LineStyle {
  /// line color\
  /// default: Colors.grey
  final Color color;

  /// line pattern
  final List<int>? dashPattern;

  /// line thickness\
  /// default: 1
  final int? thickness;

  const LineStyle({
    this.color = Colors.grey,
    this.dashPattern,
    this.thickness,
  });

  common.LineStyleSpec getRender() {
    return common.LineStyleSpec(
      color: MethodCommon.chartColor(color),
      dashPattern: dashPattern,
      thickness: thickness,
    );
  }
}

class LabelStyle {
  /// line color\
  /// default: Colors.black87
  final Color color;

  /// text font size\
  /// default: 12
  final int? fontSize;

  const LabelStyle({
    this.color = Colors.black87,
    this.fontSize = 12,
  });

  common.TextStyleSpec getRender() {
    return common.TextStyleSpec(
      color: MethodCommon.chartColor(color),
      fontSize: fontSize,
    );
  }
}

class ArcLabelLeaderLineStyle {
  final Color color;
  final double length;
  final double thickness;

  const ArcLabelLeaderLineStyle({
    required this.color,
    required this.length,
    required this.thickness,
  });

  common.ArcLabelLeaderLineStyleSpec getRender() {
    return common.ArcLabelLeaderLineStyleSpec(
      color: MethodCommon.chartColor(color),
      length: length,
      thickness: thickness,
    );
  }
}
