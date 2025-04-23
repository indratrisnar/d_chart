part of '../../d_chart.dart';

/// G -> Group -> e.g. OrdinalGroup
/// D -> Data -> e.g. OrdinalData
/// T -> Domain Type -> e.g. String
abstract class ConfigSeries<G, D, T> {
  const ConfigSeries({
    this.seriesColor,
    this.customColor,
    this.areaColor,
    this.fillColor,
    this.gradient,
    this.fillPattern,
    this.dashPattern,
    this.labelAccessor,
    this.strokeWidthPx,
    this.radiusPx,
    this.measureOffset,
    this.domain,
    this.domainLowerBound,
    this.domainUpperBound,
    this.measure,
    this.measureLowerBound,
    this.measureUpperBound,
  });

  /// set single color for entire series
  final Color? seriesColor;

  /// unlike seriesColor, this property allows for dynamic color assignments based on data points
  final Color Function(G group, D data, int? index)? customColor;

  /// `areaColor` returns the area color for a given data value.\
  /// If not provided, then group color will be used 10% opacity by default.\
  /// Specify for Line type
  final Color Function(G group, D data, int? index)? areaColor;

  /// set fill chart where has fill box like bar
  final Color? Function(G group, D data, int? index)? fillColor;

  /// set gradient color instead of fillColor
  final Gradient? Function(G group, D data, int? index)? gradient;

  /// default: solid
  final FillPattern Function(G group, D data, int? index)? fillPattern;

  /// set pattern\
  /// specify for line pattern
  final List<int>? Function(G group, D data, int? index)? dashPattern;

  /// set custom format value for label series
  /// work for bar type
  final String Function(G group, D data, int? index)? labelAccessor;

  /// allows for dynamic stroke width assignments based on data points
  final num? Function(G group, D data, int? index)? strokeWidthPx;

  /// allows for dynamic radius series assignments based on data points
  final num Function(G group, D data, int? index)? radiusPx;

  /// starting plot measure to draw chart
  final num Function(G group, D data, int? index)? measureOffset;

  /// custom domain value
  final T Function(G group, D data, int? index)? domain;

  /// custom lower domain value
  final T? Function(G group, D data, int? index)? domainLowerBound;

  /// custom upper domain value
  final T? Function(G group, D data, int? index)? domainUpperBound;

  /// custom measure value
  final num Function(G group, D data, int? index)? measure;

  /// custom lower measure value
  final num? Function(G group, D data, int? index)? measureLowerBound;

  /// custom upper measure value
  final num? Function(G group, D data, int? index)? measureUpperBound;

  getRenderConfig();

  common.Series<D, T> getConfig(G group) {
    return common.Series<D, T>(
      id: _defineG(group).id,
      data: List.from(_defineG(group).data),
      seriesCategory: _defineG(group).seriesCategory,
      domainFn: (datum, index) {
        return domain == null
            ? (_defineD(datum)).domain
            : domain!(group, datum, index);
      },
      domainLowerBoundFn: (datum, index) {
        return domainLowerBound == null
            ? (_defineD(datum)).domainLowerBound
            : domainLowerBound!(group, datum, index);
      },
      domainUpperBoundFn: (datum, index) {
        return domainUpperBound == null
            ? (_defineD(datum)).domainUpperBound
            : domainUpperBound!(group, datum, index);
      },
      measureFn: (datum, index) {
        return measure == null
            ? (_defineD(datum)).measure
            : measure!(group, datum, index);
      },
      measureLowerBoundFn: (datum, index) {
        return measureLowerBound == null
            ? (_defineD(datum)).measureLowerBound
            : measureLowerBound!(group, datum, index);
      },
      measureUpperBoundFn: (datum, index) {
        return measureUpperBound == null
            ? (_defineD(datum)).measureUpperBound
            : measureUpperBound!(group, datum, index);
      },
      seriesColor:
          seriesColor == null ? null : MethodCommon.chartColor(seriesColor!),
      colorFn: customColor == null
          ? null
          : (datum, index) {
              return MethodCommon.chartColor(
                customColor!(group, datum, index),
              );
            },
      areaColorFn: areaColor == null
          ? null
          : (datum, index) {
              return MethodCommon.chartColor(areaColor!(group, datum, index));
            },
      fillColorFn: fillColor == null
          ? null
          : (datum, index) {
              final setupColor = fillColor!(group, datum, index);
              if (setupColor == null) return null;
              return MethodCommon.chartColor(setupColor);
            },
      gradientFn: gradient == null
          ? null
          : (datum, index) => gradient!(group, datum, index),
      fillPatternFn: fillPattern == null
          ? null
          : (datum, index) {
              return MethodCommon.fillPattern(
                fillPattern!(group, datum, index),
              );
            },
      dashPatternFn: dashPattern == null
          ? null
          : (datum, index) {
              return dashPattern!(group, datum, index);
            },
      labelAccessorFn: labelAccessor == null
          ? null
          : (datum, index) {
              return labelAccessor!(group, datum, index);
            },
      strokeWidthPxFn: (datum, index) {
        return strokeWidthPx == null
            ? null
            : strokeWidthPx!(group, datum, index);
      },
      radiusPxFn: radiusPx == null
          ? null
          : (datum, index) {
              return radiusPx!(group, datum, index);
            },
      measureOffsetFn: measureOffset == null
          ? null
          : (datum, index) {
              return measureOffset!(group, datum, index);
            },
    );
  }

  ChartGroup _defineG(G value) {
    return switch (value.runtimeType) {
      NumericGroup => value as NumericGroup,
      OrdinalGroup => value as OrdinalGroup,
      _ => value as TimeGroup,
    };
  }

  ChartData _defineD(D value) {
    return switch (value.runtimeType) {
      NumericData => value as NumericData,
      OrdinalData => value as OrdinalData,
      _ => value as TimeData,
    };
  }
}
