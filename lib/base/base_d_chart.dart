part of '../d_chart.dart';

typedef BaseDChartN = BaseDChart<NumericGroup, NumericData, num>;
typedef BaseDChartO = BaseDChart<OrdinalGroup, OrdinalData, String>;
typedef BaseDChartT = BaseDChart<TimeGroup, TimeData, DateTime>;

abstract class BaseDChart<G, D, T> extends StatelessWidget {
  const BaseDChart({
    super.key,
    required this.groupList,
    this.renderType,
    this.animate = false,
    this.animationDuration = const Duration(milliseconds: 300),
    this.domainAxis,
    this.measureAxis,
    this.secondaryMeasureAxis,
    this.useSecondaryMeasureAxis,
    this.layoutMargin,
    this.allowSliding = false,
    this.onUpdatedListener,
    this.onChangedListener,
    this.ltr = true,
    this.flipVerticalAxis = false,
    this.defaultInteractions = false,
  });

  /// data per group
  final List<G> groupList;

  /// Render Type to draw chart
  final RenderType Function(G group)? renderType;

  /// animate chart when build\
  /// default: false
  final bool animate;

  /// duration animate a chart when build\
  /// default: `const Duration(milliseconds: 300)`
  final Duration animationDuration;

  /// customize domain axis
  final ChartAxis<T>? domainAxis;

  /// customize measure axis
  final ChartAxis<num>? measureAxis;

  /// customize secondary measure axis
  final ChartAxis<num>? secondaryMeasureAxis;

  /// Which measure to use for group
  final bool Function(G group)? useSecondaryMeasureAxis;

  /// margin from outer chart to wrapper box
  final LayoutMargin? layoutMargin;

  /// give user access to slide chart viewport\
  /// set initial viewport in domainAxis\
  /// if set true, this will affect to 'measure viewport'.
  /// measure viewport will auto adjust depend on min/max from item chart value\
  /// To fix this, set viewport in [measueAxis]\
  /// default: false
  final bool allowSliding;

  final bool defaultInteractions;

  /// listen which data is selected
  final void Function(D data)? onUpdatedListener;

  /// listen which data is changed selected
  final void Function(D data)? onChangedListener;

  /// Left to Right
  ///
  /// `true`: measureAxis -> chart -> secondaryMeasureAxis\
  /// domain: smaller -> bigger
  ///
  /// `false`: secondaryMeasureAxis <- chart <- measureAxis\
  /// domain: bigger <- smaller
  final bool ltr;

  /// sort reversed measure axis/
  /// default: false
  final bool flipVerticalAxis;
}
