part of 'config_series.dart';

class ConfigSeriesT extends ConfigSeries<TimeGroup, TimeData, DateTime> {
  const ConfigSeriesT({
    super.seriesColor,
    super.customColor,
    super.areaColor,
    super.fillColor,
    super.fillPattern,
    super.dashPattern,
    super.labelAccessor,
    super.strokeWidthPx,
    super.radiusPx,
    super.measureOffset,
  });

  @override
  common.Series<TimeData, DateTime> getRender(
    TimeGroup group,
    ConfigSeries<TimeGroup, TimeData, DateTime> configSeries,
  ) {
    Color groupColor = group.color ??
        Colors.primaries[math.Random().nextInt(Colors.primaries.length)];
    return common.Series<TimeData, DateTime>(
      id: group.id,
      data: group.data,
      seriesCategory: group.seriesCategory,
      domainFn: (datum, index) => datum.domain,
      domainLowerBoundFn: (datum, index) => datum.domainLowerBound,
      domainUpperBoundFn: (datum, index) => datum.domainUpperBound,
      measureFn: (datum, index) => datum.measure,
      measureLowerBoundFn: (datum, index) => datum.measureLowerBound,
      measureUpperBoundFn: (datum, index) => datum.measureUpperBound,
      seriesColor:
          MethodCommon.chartColor(configSeries.seriesColor ?? groupColor),
      colorFn: configSeries.customColor == null
          ? null
          : (datum, index) {
              return MethodCommon.chartColor(
                configSeries.customColor!(group, datum, index),
              );
            },
      areaColorFn: configSeries.areaColor == null
          ? null
          : (datum, index) {
              final setupColor = configSeries.areaColor!(group, datum, index);
              return MethodCommon.chartColor(setupColor);
            },
      fillColorFn: configSeries.fillColor == null
          ? null
          : (datum, index) {
              final setupColor = configSeries.fillColor!(group, datum, index);
              if (setupColor == null) return null;
              return MethodCommon.chartColor(setupColor);
            },
      fillPatternFn: configSeries.fillPattern == null
          ? null
          : (datum, index) {
              return MethodCommon.fillPattern(
                configSeries.fillPattern!(group, datum, index),
              );
            },
      dashPatternFn: configSeries.dashPattern == null
          ? null
          : (datum, index) {
              return configSeries.dashPattern!(group, datum, index);
            },
      labelAccessorFn: configSeries.labelAccessor == null
          ? null
          : (datum, index) {
              return configSeries.labelAccessor!(group, datum, index);
            },
      strokeWidthPxFn: (datum, index) => configSeries.strokeWidthPx == null
          ? null
          : configSeries.strokeWidthPx!(group, datum, index),
      radiusPxFn: configSeries.radiusPx == null
          ? null
          : (datum, index) {
              return configSeries.radiusPx!(group, datum, index);
            },
      measureOffsetFn: configSeries.measureOffset == null
          ? null
          : (datum, index) {
              return configSeries.measureOffset!(group, datum, index);
            },
    );
  }
}
