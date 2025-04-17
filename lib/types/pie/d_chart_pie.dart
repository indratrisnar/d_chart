part of '../../d_chart.dart';

abstract class DChartPie<G, D, T> extends BaseDChart<G, D, T> {
  DChartPie({
    super.key,
    required G group,
    super.animate,
    super.animationDuration,
    super.layoutMargin,
    super.onUpdatedListener,
    super.onChangedListener,
    super.ltr,
    super.defaultInteractions,
    required this.configSeriesPie,
  }) : super(groupList: [group]);

  final ConfigSeriesPie<G, D, T> configSeriesPie;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: MethodCommon.isLTR(ltr),
      child: charts.PieChart<T>(
        List.generate(groupList.length, (indexGroup) {
          final group = groupList[indexGroup];
          return configSeriesPie.getConfig(group);
        }),
        defaultInteractions: defaultInteractions,
        animate: animate,
        animationDuration: animationDuration,
        defaultRenderer: configSeriesPie.getRenderConfig(),
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

class DChartPieN extends DChartPie<NumericGroup, NumericData, num> {
  DChartPieN({
    super.key,
    required List<NumericData> data,
    super.animate,
    super.animationDuration,
    super.layoutMargin,
    super.onUpdatedListener,
    super.onChangedListener,
    super.ltr,
    super.defaultInteractions,
    ConfigSeriesPieN super.configSeriesPie = const ConfigSeriesPieN(),
  }) : super(group: NumericGroup(id: 'DChartPieN', data: data));
}

class DChartPieO extends DChartPie<OrdinalGroup, OrdinalData, String> {
  DChartPieO({
    super.key,
    required List<OrdinalData> data,
    super.animate,
    super.animationDuration,
    super.layoutMargin,
    super.onUpdatedListener,
    super.onChangedListener,
    super.ltr,
    super.defaultInteractions,
    ConfigSeriesPieO super.configSeriesPie = const ConfigSeriesPieO(),
  }) : super(group: OrdinalGroup(id: 'DChartPieO', data: data));
}

class DChartPieT extends DChartPie<TimeGroup, TimeData, DateTime> {
  DChartPieT({
    super.key,
    required List<TimeData> data,
    super.animate,
    super.animationDuration,
    super.layoutMargin,
    super.onUpdatedListener,
    super.onChangedListener,
    super.ltr,
    super.defaultInteractions,
    ConfigSeriesPieT super.configSeriesPie = const ConfigSeriesPieT(),
  }) : super(group: TimeGroup(id: 'DChartPieT', data: data));
}
