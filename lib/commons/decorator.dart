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
import 'style.dart';

import 'enums.dart';
import 'method_common.dart';

class BarLabelDecorator {
  /// position label bar chart item
  final BarLabelAnchor? labelAnchor;

  /// Configures where to place the label relative to the bars.\
  /// default: `BarLabelPosition.auto`
  final BarLabelPosition barLabelPosition;

  /// Space before and after the label text.\
  /// default: 5
  final int labelPadding;

  BarLabelDecorator({
    this.labelAnchor,
    this.labelPadding = 5,
    this.barLabelPosition = BarLabelPosition.auto,
  });

  common.BarLabelDecorator<num> getRenderNumeric() {
    return common.BarLabelDecorator(
      labelAnchor: MethodCommon.barLabelAnchor(labelAnchor),
      labelPadding: labelPadding,
      labelPosition: MethodCommon.barLabelPosition(barLabelPosition),
    );
  }

  common.BarLabelDecorator<String> getRenderOrdinal() {
    return common.BarLabelDecorator(
      labelAnchor: MethodCommon.barLabelAnchor(labelAnchor),
      labelPadding: labelPadding,
      labelPosition: MethodCommon.barLabelPosition(barLabelPosition),
    );
  }

  common.BarLabelDecorator<DateTime> getRenderTime() {
    return common.BarLabelDecorator(
      labelAnchor: MethodCommon.barLabelAnchor(labelAnchor),
      labelPadding: labelPadding,
      labelPosition: MethodCommon.barLabelPosition(barLabelPosition),
    );
  }
}

class ArcLabelDecorator {
  /// Configures [TextStyleSpec] for labels placed inside the arcs.
  final LabelStyle insideLabelStyle;

  /// Configures [TextStyleSpec] for labels placed outside the arcs.
  final LabelStyle outsideLabelStyle;

  /// Configures [ArcLabelLeaderLineStyleSpec] for leader lines for labels
  /// placed outside the arcs.
  final ArcLabelLeaderLineStyle leaderLineStyle;

  /// Configures where to place the label relative to the arcs.
  final ArcLabelPosition labelPosition;

  /// Space before and after the label text.
  final int labelPadding;

  /// Whether or not to draw leader lines for labels placed outside the arcs.
  final bool showLeaderLines;

  ArcLabelDecorator({
    this.insideLabelStyle = const LabelStyle(
      fontSize: 12,
      color: Colors.white,
    ),
    this.outsideLabelStyle = const LabelStyle(
      fontSize: 12,
      color: Colors.black,
    ),
    this.leaderLineStyle = const ArcLabelLeaderLineStyle(
      color: Colors.black,
      length: 20.0,
      thickness: 1.0,
    ),
    this.labelPosition = ArcLabelPosition.auto,
    this.labelPadding = 5,
    this.showLeaderLines = true,
  });

  common.ArcLabelDecorator<String> getRenderOrdinal() {
    return common.ArcLabelDecorator<String>(
      insideLabelStyleSpec: insideLabelStyle.getRender(),
      outsideLabelStyleSpec: outsideLabelStyle.getRender(),
      labelPadding: labelPadding,
      labelPosition: MethodCommon.arcLabelPosition(labelPosition),
      leaderLineStyleSpec: leaderLineStyle.getRender(),
      showLeaderLines: showLeaderLines,
    );
  }

  common.ArcLabelDecorator<num> getRenderNumeric() {
    return common.ArcLabelDecorator<num>(
      insideLabelStyleSpec: insideLabelStyle.getRender(),
      outsideLabelStyleSpec: outsideLabelStyle.getRender(),
      labelPadding: labelPadding,
      labelPosition: MethodCommon.arcLabelPosition(labelPosition),
      leaderLineStyleSpec: leaderLineStyle.getRender(),
      showLeaderLines: showLeaderLines,
    );
  }

  common.ArcLabelDecorator<DateTime> getRenderTime() {
    return common.ArcLabelDecorator<DateTime>(
      insideLabelStyleSpec: insideLabelStyle.getRender(),
      outsideLabelStyleSpec: outsideLabelStyle.getRender(),
      labelPadding: labelPadding,
      labelPosition: MethodCommon.arcLabelPosition(labelPosition),
      leaderLineStyleSpec: leaderLineStyle.getRender(),
      showLeaderLines: showLeaderLines,
    );
  }
}
