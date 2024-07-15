part of 'decorator.dart';

class PointLabelDecorator {
  /// customize point label value
  final String Function(NumericData data)? labelFormatterN;

  /// customize point label value
  final String Function(OrdinalData data)? labelFormatterO;

  /// customize point label value
  final String Function(TimeData data)? labelFormatterT;

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

  /// selected point
  ///
  /// default: false
  final bool Function(NumericData data)? selectedN;

  /// selected point
  ///
  /// default: false
  final bool Function(OrdinalData data)? selectedO;

  /// selected point
  ///
  /// default: false
  final bool Function(TimeData data)? selectedT;

  /// set DataType like `PointLabelDecorator<NumericData>`
  /// or `PointLabelDecorator<OrdinalData>`
  PointLabelDecorator({
    this.labelFormatterN,
    this.labelFormatterO,
    this.labelFormatterT,
    this.labelStyle,
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
    this.selectedLabelStyle,
    this.selectedN,
    this.selectedO,
    this.selectedT,
  });

  common.PointLabelDecorator<num> getRenderNumeric() {
    return common.PointLabelDecorator<num>(
      labelStyleSpec: labelStyle?.getRender(),
      selectedLabelStyleSpec: selectedLabelStyle?.getRender(),
      horizontalPadding: horizontalPadding,
      verticalPadding: verticalPadding,
      labelCallback: (datum) {
        NumericData data = datum as NumericData;
        bool selected = selectedN == null ? false : selectedN!(data);
        String label = labelFormatterN == null
            ? data.measure.toString()
            : labelFormatterN!(data);
        return common.PointLabelSpec(
          selected: selected,
          label: label,
        );
      },
    );
  }

  common.PointLabelDecorator<String> getRenderOrdinal() {
    return common.PointLabelDecorator<String>(
      labelStyleSpec: labelStyle?.getRender(),
      selectedLabelStyleSpec: selectedLabelStyle?.getRender(),
      horizontalPadding: horizontalPadding,
      verticalPadding: verticalPadding,
      labelCallback: (datum) {
        OrdinalData data = datum as OrdinalData;
        bool selected = selectedO == null ? false : selectedO!(data);
        String label = labelFormatterN == null
            ? data.measure.toString()
            : labelFormatterO!(data);
        return common.PointLabelSpec(
          selected: selected,
          label: label,
        );
      },
    );
  }

  common.PointLabelDecorator<DateTime> getRenderTime() {
    return common.PointLabelDecorator<DateTime>(
      labelStyleSpec: labelStyle?.getRender(),
      selectedLabelStyleSpec: selectedLabelStyle?.getRender(),
      horizontalPadding: horizontalPadding,
      verticalPadding: verticalPadding,
      labelCallback: (datum) {
        TimeData data = datum as TimeData;
        bool selected = selectedT == null ? false : selectedT!(data);
        String label = labelFormatterT == null
            ? data.measure.toString()
            : labelFormatterT!(data);
        return common.PointLabelSpec(
          selected: selected,
          label: label,
        );
      },
    );
  }
}
