import '../enums.dart';
import '../style/style.dart';
import '../tick/numeric_tick_provider.dart';
import '../viewport.dart';

part 'domain_axis.dart';
part 'measure_axis.dart';

abstract class ChartAxis {
  /// disable label and tick axis
  final bool noRenderSpec;

  const ChartAxis({
    this.noRenderSpec = false,
  });
}
