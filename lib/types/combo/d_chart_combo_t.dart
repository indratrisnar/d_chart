part of '../../d_chart.dart';

class DChartComboT extends BaseDChartT {
  const DChartComboT({
    super.key,
    required super.groupList,
    super.renderType,
    super.animate,
    super.animationDuration,
    DomainAxisT super.domainAxis = const DomainAxisT(),
    MeasureAxis super.measureAxis = const MeasureAxis(),
    MeasureAxis super.secondaryMeasureAxis = const MeasureAxis(),
    super.useSecondaryMeasureAxis,
    super.layoutMargin,
    super.allowSliding,
    super.defaultInteractions,
    super.onUpdatedListener,
    super.onChangedListener,
    super.ltr,
    super.flipVerticalAxis,
    this.configSeriesBar = const ConfigSeriesBarT(),
    this.configSeriesBarTargetLine = const ConfigSeriesBarTargetLineT(),
    this.configSeriesLine = const ConfigSeriesLineT(),
    this.configSeriesScatter = const ConfigSeriesScatterT(),
  });

  final ConfigSeriesBarT configSeriesBar;
  final ConfigSeriesBarTargetLineT configSeriesBarTargetLine;
  final ConfigSeriesLineT configSeriesLine;
  final ConfigSeriesScatterT configSeriesScatter;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: MethodCommon.isLTR(ltr),
      child: charts.TimeSeriesChart(
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
        flipVerticalAxis: flipVerticalAxis,
        defaultInteractions: defaultInteractions,
        animate: animate,
        animationDuration: animationDuration,
        defaultRenderer: configSeriesBar.getRenderConfig(),
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
