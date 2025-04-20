part of '../../d_chart.dart';

/// D -> ChartData -> NumericData
/// T -> Domain Type -> num
abstract class PointLabelDecorator<D, T> {
  const PointLabelDecorator({
    this.labelFormatter,
    this.selected,
    this.labelStyle,
    this.selectedLabelStyle,
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
  });

  /// customize point label value
  final String Function(D data)? labelFormatter;

  /// selected point
  ///
  /// default: false
  final bool Function(D data)? selected;

  /// for styling label point
  final LabelStyle? labelStyle;

  /// for styling label point with state selected
  final LabelStyle? selectedLabelStyle;

  /// padding horizontal
  ///
  /// padding > 0, will be more to left
  ///
  /// padding < 0, will be more to right
  ///
  /// default: 0
  final int horizontalPadding;

  /// padding vertical
  ///
  /// padding > 0, will be more to top
  ///
  /// padding < 0, will be more to bottom
  ///
  /// default: 0
  final int verticalPadding;

  common.PointLabelDecorator<T> render() {
    return common.PointLabelDecorator<T>(
      labelStyleSpec: labelStyle?.getRender(),
      selectedLabelStyleSpec: selectedLabelStyle?.getRender(),
      horizontalPadding: horizontalPadding,
      verticalPadding: verticalPadding,
      labelCallback: (datum) {
        final data = datum as D;
        bool isSelected = selected == null ? false : selected!(data);
        String label = labelFormatter == null
            ? (data as ChartData<T>).measure.toString()
            : labelFormatter!(datum);
        return common.PointLabelSpec(
          selected: isSelected,
          label: label,
        );
      },
    );
  }
}

class PointLabelDecoratorN extends PointLabelDecorator<NumericData, num> {
  const PointLabelDecoratorN({
    super.horizontalPadding,
    super.labelFormatter,
    super.labelStyle,
    super.selected,
    super.selectedLabelStyle,
    super.verticalPadding,
  });
}

class PointLabelDecoratorO extends PointLabelDecorator<OrdinalData, String> {
  const PointLabelDecoratorO({
    super.horizontalPadding,
    super.labelFormatter,
    super.labelStyle,
    super.selected,
    super.selectedLabelStyle,
    super.verticalPadding,
  });
}

class PointLabelDecoratorT extends PointLabelDecorator<TimeData, DateTime> {
  const PointLabelDecoratorT({
    super.horizontalPadding,
    super.labelFormatter,
    super.labelStyle,
    super.selected,
    super.selectedLabelStyle,
    super.verticalPadding,
  });
}
