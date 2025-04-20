part of '../../d_chart.dart';

class DChartBarO extends BaseDChartO {
  const DChartBarO({
    super.key,
    required super.groupList,
    super.renderType,
    super.animate,
    super.animationDuration,
    DomainAxisO super.domainAxis = const DomainAxisO(),
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
    this.configSeriesBar = const ConfigSeriesBarO(),
    this.configSeriesBarLane = const ConfigSeriesBarLaneO(),
    this.configSeriesBarTargetLine = const ConfigSeriesBarTargetLineO(),
    this.arrangeVertically = false,
  });

  final ConfigSeriesBarO configSeriesBar;
  final ConfigSeriesBarLaneO configSeriesBarLane;
  final ConfigSeriesBarTargetLineO configSeriesBarTargetLine;

  final bool arrangeVertically;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: MethodCommon.isLTR(ltr),
      child: charts.BarChart(
        List.generate(groupList.length, (indexGroup) {
          final group = groupList[indexGroup];
          final groupRenderType =
              renderType == null ? Constants.barRenderType : renderType!(group);
          final configSeries = switch (groupRenderType) {
            RenderType.barLane => configSeriesBarLane,
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
        vertical: !arrangeVertically,
        barRendererDecorator: configSeriesBarLane.barLabelDecorator.render(),
        flipVerticalAxis: flipVerticalAxis,
        defaultInteractions: defaultInteractions,
        animate: animate,
        animationDuration: animationDuration,
        defaultRenderer: configSeriesBar.getRenderConfig(),
        customSeriesRenderers: [
          configSeriesBar.getRenderConfig(),
          configSeriesBarLane.getRenderConfig(),
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
