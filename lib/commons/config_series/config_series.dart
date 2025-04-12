import 'package:community_charts_common/community_charts_common.dart' as common;
import 'package:flutter/material.dart';
import '../data_model/model.dart';

import '../enums.dart';
import 'dart:math' as math;

import '../method_common.dart';

part 'config_series_n.dart';
part 'config_series_o.dart';
part 'config_series_t.dart';

/// G -> Group -> e.g. OrdinalGroup
/// D -> Data -> e.g. OrdinalData
/// T -> Type -> e.g. String
abstract class ConfigSeries<G, D, T> {
  const ConfigSeries({
    this.seriesColor,
    this.customColor,
    this.areaColor,
    this.fillColor,
    this.fillPattern,
    this.dashPattern,
    this.labelAccessor,
    this.strokeWidthPx,
    this.radiusPx,
    this.measureOffset,
  });

  /// set single color for entire series
  final Color? seriesColor;

  /// unlike seriesColor, this property allows for dynamic color assignments based on data points
  final Color Function(G? group, D data, int? index)? customColor;

  /// `areaColor` returns the area color for a given data value.\
  /// If not provided, then group color will be used 10% opacity by default.\
  /// Specify for Line type
  ///
  /// to activate custom areaColor,\
  /// `ConfigRenderLine -> includeArea` must be `true`
  final Color Function(G? group, D data, int? index)? areaColor;

  /// set fill chart where has fill box like bar\
  /// default: random color
  final Color? Function(G? group, D data, int? index)? fillColor;

  /// custom fill pattern\
  /// default: solid
  final FillPattern Function(G? group, D data, int? index)? fillPattern;

  /// set pattern\
  /// specify for line pattern
  final List<int>? Function(G? group, D data, int? index)? dashPattern;

  /// set custom format value for label series
  /// work for bar type
  final String Function(G? group, D data, int? index)? labelAccessor;

  /// allows for dynamic stroke width assignments based on data points
  final num? Function(G? group, D data, int? index)? strokeWidthPx;

  /// allows for dynamic radius series assignments based on data points
  final num Function(G? group, D data, int? index)? radiusPx;

  /// starting plot measure to draw chart
  final num Function(G? group, D data, int? index)? measureOffset;

  common.Series<D, T> getRender(
    G group,
    ConfigSeries<G, D, T> configSeries,
  );
}
