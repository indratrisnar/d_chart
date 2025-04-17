part of '../../d_chart.dart';

class DChartComboN extends BaseDChartN {
  const DChartComboN({
    super.key,
    required super.groupList,
    super.renderType,
    super.animate,
    super.animationDuration,
    DomainAxisN? super.domainAxis,
    MeasureAxis? super.measureAxis,
    MeasureAxis? super.secondaryMeasureAxis,
    super.useSecondaryMeasureAxis,
    super.layoutMargin,
    super.allowSliding,
    super.onUpdatedListener,
    super.onChangedListener,
    super.ltr,
    super.defaultInteractions,
    this.configSeriesBar = const ConfigSeriesBarN(),
    this.configSeriesBarTargetLine = const ConfigSeriesBarTargetLineN(),
    this.configSeriesLine = const ConfigSeriesLineN(),
    this.configSeriesScatter = const ConfigSeriesScatterN(),
  });

  final ConfigSeriesBarN configSeriesBar;
  final ConfigSeriesBarTargetLineN configSeriesBarTargetLine;
  final ConfigSeriesLineN configSeriesLine;
  final ConfigSeriesScatterN configSeriesScatter;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: MethodCommon.isLTR(ltr),
      child: charts.NumericComboChart(
        List.generate(groupList.length, (indexGroup) {
          final group = groupList[indexGroup];
          final groupRenderType = renderType == null
              ? Constants.comboRenderType
              : renderType!(group);
          final configSeries = switch (groupRenderType) {
            RenderType.barTargetLine => configSeriesBarTargetLine,
            RenderType.line => configSeriesLine,
            RenderType.scatterPlot => configSeriesScatter,
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
        defaultInteractions: defaultInteractions,
        animate: animate,
        animationDuration: animationDuration,
        // defaultRenderer: configSeriesLine.getRenderConfig(),
        customSeriesRenderers: [
          configSeriesBar.getRenderConfig(),
          configSeriesBarTargetLine.getRenderConfig(),
          configSeriesLine.getRenderConfig(),
          configSeriesScatter.getRenderConfig(),
        ],
        domainAxis: domainAxis?.axisSpec(),
        primaryMeasureAxis: measureAxis?.axisSpec(),
        secondaryMeasureAxis: secondaryMeasureAxis?.axisSpec(),
        layoutConfig: layoutMargin?.getRender() ?? LayoutMargin.defaultRender,
        behaviors: [
          if (allowSliding) charts.SlidingViewport(),
          if (allowSliding) charts.PanAndZoomBehavior(),
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
