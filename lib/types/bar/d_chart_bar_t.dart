part of '../../d_chart.dart';

class DChartBarT extends BaseDChartT {
  const DChartBarT({
    super.key,
    required super.groupList,
    super.renderType,
    super.animate,
    super.animationDuration,
    DomainAxisT? super.domainAxis,
    MeasureAxis? super.measureAxis,
    MeasureAxis? super.secondaryMeasureAxis,
    super.useSecondaryMeasureAxis,
    super.layoutMargin,
    super.allowSliding,
    super.onUpdatedListener,
    super.onChangedListener,
    super.ltr,
    super.flipVerticalAxis,
    super.defaultInteractions,
    this.configSeriesBar = const ConfigSeriesBarT(),
    this.configSeriesBarTargetLine = const ConfigSeriesBarTargetLineT(),
    this.arrangeVertically = false,
    this.useUTC = false,
  });

  final ConfigSeriesBarT configSeriesBar;
  final ConfigSeriesBarTargetLineT configSeriesBarTargetLine;

  final bool arrangeVertically;

  /// DateTime Factory
  ///
  /// Local or UTC
  final bool useUTC;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: MethodCommon.isLTR(ltr),
      child: charts.TimeSeriesChart(
        List.generate(groupList.length, (indexGroup) {
          final group = groupList[indexGroup];
          final groupRenderType =
              renderType == null ? Constants.barRenderType : renderType!(group);
          final configSeries = switch (groupRenderType) {
            RenderType.barTargetLine => configSeriesBarTargetLine,
            _ => configSeriesBar,
          };
          final chartSeries = configSeries.getConfig(group)
            ..setAttribute(charts.rendererIdKey, groupRenderType.name);
          bool isUseSecondaryMeasureAxis = useSecondaryMeasureAxis == null
              ? false
              : useSecondaryMeasureAxis!(group);
          if (isUseSecondaryMeasureAxis) {
            return chartSeries
              ..setAttribute(
                common.measureAxisIdKey,
                Constants.secondaryMeasureAxisId,
              );
          }

          return chartSeries;
        }),

        // barGroupingType: common.BarGroupingType.grouped, // already stup inside ConfigSeriesBar
        dateTimeFactory: MethodCommon.dateTimeFactory(useUTC),
        flipVerticalAxis: flipVerticalAxis,
        defaultInteractions: defaultInteractions,
        animate: animate,
        animationDuration: animationDuration,
        defaultRenderer: configSeriesBar.getRenderConfig(),
        customSeriesRenderers: [
          configSeriesBar.getRenderConfig(),
          configSeriesBarTargetLine.getRenderConfig(),
        ],
        domainAxis: domainAxis?.axisSpec(),
        primaryMeasureAxis: measureAxis?.axisSpec(),
        secondaryMeasureAxis: secondaryMeasureAxis?.axisSpec(),
        layoutConfig: layoutMargin?.getRender() ?? LayoutMargin.defaultRender,
        behaviors: [
          if (allowSliding) charts.SlidingViewport(),
          if (allowSliding) charts.PanAndZoomBehavior(),
          // if (onUpdatedListener != null) charts.DomainHighlighter<String>(),
        ],
        selectionModels: [
          charts.SelectionModelConfig(
            updatedListener: onUpdatedListener == null
                ? null
                : (model) {
                    if (model.hasDatumSelection) {
                      onUpdatedListener!(model.selectedDatum.first.datum);
                    }
                  },
            changedListener: onChangedListener == null
                ? null
                : (model) {
                    if (model.hasDatumSelection) {
                      onChangedListener!(model.selectedDatum.first.datum);
                    }
                  },
          ),
        ],
      ),
    );
  }
}
