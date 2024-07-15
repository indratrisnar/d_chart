import 'dart:ui';

import 'data_model/data_model.dart';
import 'enums.dart';
import 'style/style.dart';

typedef DomainFormat<D> = String Function(D domain);

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

typedef CustomLabelO = String Function(OrdinalData ordinalData, int? index);
typedef CustomLabelN = String Function(NumericData numericData, int? index);
typedef CustomLabelT = String Function(TimeData timeData, int? index);
