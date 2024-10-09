import '../enums.dart';
import '../style/style.dart';
import '../tick/numeric_tick_provider.dart';
import '../viewport.dart';

part 'domain_axis.dart';
part 'measure_axis.dart';

abstract class ChartAxis {
  /// disable label and tick axis
  final bool noRenderSpec;

  /// default: false
  ///
  /// to use this type, set `noRenderSpec` to `false`
  final bool useGridLine;

  /// styling of lines perpendicular to the axis line
  final LineStyle gridLineStyle;

  /// styling of tick line on axis
  final LineStyle tickLineStyle;

  const ChartAxis({
    this.noRenderSpec = false,
    this.useGridLine = false,
    this.gridLineStyle = const LineStyle(),
    this.tickLineStyle = const LineStyle(),
  });
}
