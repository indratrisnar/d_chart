import 'dart:ui';

import 'enums.dart';
import 'style.dart';

import 'data_model.dart';

typedef DomainFormat<D> = String Function(D domain);
typedef MeasureFormat = String Function(num? measure);

typedef AreaColorN = Color? Function(
    NumericGroup group, NumericData numericData, int? index);
typedef AreaColorO = Color? Function(
    OrdinalGroup group, OrdinalData ordinalData, int? index);
typedef AreaColorT = Color? Function(
    TimeGroup group, TimeData timeData, int? index);

typedef FillColorN = Color? Function(
    NumericGroup group, NumericData numericData, int? index);
typedef FillColorO = Color? Function(
    OrdinalGroup group, OrdinalData ordinalData, int? index);
typedef FillColorT = Color? Function(
    TimeGroup group, TimeData timeData, int? index);

typedef FillPatternN = FillPattern Function(
    NumericGroup group, NumericData numericData, int? index);
typedef FillPatternO = FillPattern Function(
    OrdinalGroup group, OrdinalData ordinalData, int? index);
typedef FillPatternT = FillPattern Function(
    TimeGroup group, TimeData timeData, int? index);

typedef BarLabelValueN = String Function(
    NumericGroup group, NumericData numericData, int? index);
typedef BarLabelValueO = String Function(
    OrdinalGroup group, OrdinalData ordinalData, int? index);
typedef BarLabelValueT = String Function(
    TimeGroup group, TimeData timeData, int? index);

typedef DashPatternN = List<int> Function(
    NumericGroup group, NumericData numericData, int? index);
typedef DashPatternO = List<int> Function(
    OrdinalGroup group, OrdinalData ordinalData, int? index);
typedef DashPatternT = List<int> Function(
    TimeGroup group, TimeData timeData, int? index);

typedef InsideBarLabelStyleN = LabelStyle Function(
    NumericGroup group, NumericData numericData, int? index);
typedef InsideBarLabelStyleO = LabelStyle Function(
    OrdinalGroup group, OrdinalData ordinalData, int? index);
typedef InsideBarLabelStyleT = LabelStyle Function(
    TimeGroup group, TimeData timeData, int? index);

typedef OutsideBarLabelStyleN = LabelStyle Function(
    NumericGroup group, NumericData numericData, int? index);
typedef OutsideBarLabelStyleO = LabelStyle Function(
    OrdinalGroup group, OrdinalData ordinalData, int? index);
typedef OutsideBarLabelStyleT = LabelStyle Function(
    TimeGroup group, TimeData timeData, int? index);
