import 'package:flutter/material.dart';

/// Custom Bar Chart extends to default flutter framework
class DChartBarCustom extends StatefulWidget {
  const DChartBarCustom(
      {Key? key,
      this.max,
      required this.listData,
      this.verticalDirection,
      this.domainLineStyle,
      this.measureLineStyle,
      this.showDomainLine,
      this.showMeasureLine,
      this.spaceBetweenItem,
      this.valueAlign,
      this.domainLabelStyle,
      this.measureLabelStyle,
      this.showDomainLabel,
      this.showMeasureLabel,
      this.spaceDomainLabeltoChart,
      this.spaceMeasureLabeltoChart,
      this.showLoading,
      this.loadingDuration,
      this.valuePadding,
      this.radiusBar,
      this.spaceDomainLinetoChart,
      this.spaceMeasureLinetoChart})
      : super(key: key);

  /// Limit top value for value chart, beside top domainAxis Line
  ///
  /// Default: based on highest value from [listData]
  ///
  /// for minimum always set 0
  final double? max;

  /// Chart data.
  ///
  /// you can set custom style here for each item chart
  final List<DChartBarDataCustom> listData;

  /// Default of direction children chart is horizantally (false)
  final bool? verticalDirection;

  /// Style for Domain line,
  ///
  /// [showDomainLine] must be true if you want to see your custom style for this axis line
  final BorderSide? domainLineStyle;

  /// Style for Measure line,
  ///
  /// [showMeasureLine] must be true if you want to see your custom style for this axis line
  final BorderSide? measureLineStyle;

  /// to enable Domain Line, set to true
  ///
  /// Default: false
  final bool? showDomainLine;

  /// to enable Measure Line, set to true
  ///
  /// Default: false
  final bool? showMeasureLine;

  /// style for text label beside Domain Line
  final TextStyle? domainLabelStyle;

  /// style for text label beside Measure Line
  final TextStyle? measureLabelStyle;

  /// to enable Domain Label Text, set to true
  ///
  /// Default: false
  final bool? showDomainLabel;

  /// to enable Measure Label Text, set to true
  ///
  /// Default: false
  final bool? showMeasureLabel;

  /// Space between item chart,
  ///
  /// If you want to set chart width shortest, fill this space bigger,
  ///
  /// otherwise if you want to set chart width longer, fill this space smaller
  final double? spaceBetweenItem;

  /// space beetween Domain label & chart view,
  ///
  /// if null, then will be set 5
  final double? spaceDomainLabeltoChart;

  /// space beetween Measure label & chart view,
  ///
  /// if null, then will be set 5
  final double? spaceMeasureLabeltoChart;

  /// space beetween Domain line & chart view,
  ///
  /// if null, then will be set 0
  final double? spaceDomainLinetoChart;

  /// space beetween Measure line & chart view,
  ///
  /// if null, then will be set 0
  final double? spaceMeasureLinetoChart;

  /// Align for value text inside chart item
  ///
  /// if null, then will be set Alignment.topCenter
  final Alignment? valueAlign;

  /// padding for value text inside item chart view
  ///
  /// if null, then const EdgeInsets.all(4)
  final EdgeInsetsGeometry? valuePadding;

  /// show loading circle before show chart view
  ///
  /// if null, then will be set true
  final bool? showLoading;

  /// duration for show loading, must set [showLoading] true
  ///
  /// if null, then will be set Duration(milliseconds: 1200)
  final Duration? loadingDuration;

  /// radius for item bar view
  final BorderRadius? radiusBar;

  @override
  State<DChartBarCustom> createState() => _DChartBarCustomState();
}

class _DChartBarCustomState extends State<DChartBarCustom> {
  double max = 1;
  bool loading = false;

  @override
  void initState() {
    if (widget.showLoading ?? false) {
      setState(() {
        loading = true;
      });
      Future.delayed(
        widget.loadingDuration ?? const Duration(milliseconds: 1200),
        () {
          setState(() {
            loading = false;
          });
        },
      );
    }

    List list = widget.listData.map((e) => e).toList();
    list.sort((a, b) => a.value.compareTo(b.value));
    max = widget.max ?? list.last.value;

    super.initState();
  }

  Widget minLabel() {
    return Text(
      _numberAutoDigit(0),
      style: widget.measureLabelStyle,
      textAlign: TextAlign.right,
    );
  }

  Widget maxLabel() {
    return Text(
      _numberAutoDigit(max),
      style: widget.measureLabelStyle,
      textAlign: TextAlign.right,
    );
  }

  BorderSide domainLine() {
    return (widget.showDomainLine ?? false)
        ? widget.domainLineStyle != null
            ? widget.domainLineStyle!
            : const BorderSide()
        : BorderSide.none;
  }

  BorderSide measureLine() {
    return (widget.showMeasureLine ?? false)
        ? widget.measureLineStyle != null
            ? widget.measureLineStyle!
            : const BorderSide()
        : BorderSide.none;
  }

  EdgeInsetsGeometry paddingChart() {
    return EdgeInsets.only(
      bottom: (widget.verticalDirection ?? false)
          ? (widget.spaceMeasureLinetoChart ?? 0)
          : (widget.spaceDomainLinetoChart ?? 0),
      left: (widget.verticalDirection ?? false)
          ? (widget.spaceDomainLinetoChart ?? 0)
          : (widget.spaceMeasureLinetoChart ?? 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }
    return LayoutBuilder(builder: (context, constraintsOut) {
      if (widget.verticalDirection ?? false) {
        // vertical
        return verticalDirection();
      }

      // horizontal
      return horizontalDirection(constraintsOut);
    });
  }

  Row verticalDirection() {
    return Row(
      children: [
        if (widget.showDomainLabel ?? false)
          Padding(
            padding: EdgeInsets.only(
              bottom: widget.spaceMeasureLinetoChart ?? 0,
            ),
            child: LayoutBuilder(builder: (context, constrainsDomainLabelHorz) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(widget.listData.length, (index) {
                  DChartBarDataCustom item = widget.listData[index];
                  final height = (constrainsDomainLabelHorz.maxHeight /
                          widget.listData.length) -
                      (widget.spaceBetweenItem ??
                          ((constrainsDomainLabelHorz.maxHeight /
                                  widget.listData.length) *
                              0.1));
                  return Container(
                    alignment: Alignment.center,
                    height: height.isNaN ? 0 : height,
                    child: item.labelCustom ??
                        Text(
                          item.label,
                          style: widget.domainLabelStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                  );
                }),
              );
            }),
          ),
        SizedBox(width: widget.spaceDomainLabeltoChart ?? 5),
        Expanded(
          child: Stack(
            children: [
              Container(
                // height: constraintsOut.maxHeight,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: measureLine(),
                    left: domainLine(),
                  ),
                ),
                child: Padding(
                  padding: paddingChart(),
                  child: LayoutBuilder(builder: (context, constraintsChart) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(widget.listData.length, (index) {
                          DChartBarDataCustom item = widget.listData[index];
                          final width =
                              (item.value / max) * constraintsChart.maxWidth;
                          final height = (constraintsChart.maxHeight /
                                  widget.listData.length) -
                              (widget.spaceBetweenItem ??
                                  ((constraintsChart.maxHeight /
                                          widget.listData.length) *
                                      0.1));
                          return SizedBox(
                            width: width.isNaN ? 0 : width,
                            height: height.isNaN ? 0 : height,
                            child: _DChartBarItemValueView(
                              barDataCustom: item,
                              valuePadding: widget.valuePadding,
                              valueAlign: widget.valueAlign,
                              radiusBar: widget.radiusBar,
                              verticalOffsetTooltip: 0,
                            ),
                          );
                        }),
                      ],
                    );
                  }),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Transform.translate(
                  offset: Offset(
                    0 +
                        (widget.spaceDomainLinetoChart ?? 0) +
                        ((widget.showMeasureLine ?? false)
                            ? (widget.measureLineStyle == null
                                ? 0
                                : widget.measureLineStyle!.width)
                            : 0),
                    12 +
                        ((widget.showMeasureLine ?? false)
                            ? (widget.measureLineStyle == null
                                ? 0
                                : widget.measureLineStyle!.width)
                            : 0) +
                        (widget.spaceMeasureLabeltoChart ?? 5),
                  ),
                  child: minLabel(),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Transform.translate(
                    offset: Offset(
                      0,
                      12 +
                          ((widget.showMeasureLine ?? false)
                              ? (widget.measureLineStyle == null
                                  ? 0
                                  : widget.measureLineStyle!.width)
                              : 0) +
                          (widget.spaceMeasureLabeltoChart ?? 5),
                    ),
                    child: maxLabel()),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row horizontalDirection(BoxConstraints constraintsOut) {
    return Row(
      children: [
        if (widget.showMeasureLabel ?? false)
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Transform.translate(
                offset: const Offset(0, -4),
                child: maxLabel(),
              ),
              Transform.translate(
                offset: Offset(
                  0,
                  4 -
                      ((widget.showDomainLine ?? false)
                          ? (widget.domainLineStyle == null
                              ? 0
                              : widget.domainLineStyle!.width)
                          : 0) -
                      (widget.spaceDomainLinetoChart ?? 0),
                ),
                child: minLabel(),
              ),
            ],
          ),
        SizedBox(width: widget.spaceMeasureLabeltoChart ?? 5),
        Expanded(
          child: Container(
            height: constraintsOut.maxHeight,
            decoration: BoxDecoration(
              border: Border(
                bottom: domainLine(),
                left: measureLine(),
              ),
            ),
            child: Padding(
              padding: paddingChart(),
              child: LayoutBuilder(builder: (context, constraintsChart) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(widget.listData.length, (index) {
                      DChartBarDataCustom item = widget.listData[index];
                      final height =
                          (item.value / max) * constraintsChart.maxHeight;
                      final width =
                          (constraintsChart.maxWidth / widget.listData.length) -
                              (widget.spaceBetweenItem ??
                                  ((constraintsChart.maxWidth /
                                          widget.listData.length) *
                                      0.1));
                      return SizedBox(
                        width: width.isNaN ? 0 : width,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: SizedBox(
                                height: height.isNaN ? 0 : height,
                                child: _DChartBarItemValueView(
                                  barDataCustom: item,
                                  valuePadding: widget.valuePadding,
                                  valueAlign: widget.valueAlign,
                                  radiusBar: widget.radiusBar,
                                  verticalOffsetTooltip: (((item.value / max) *
                                              constraintsChart.maxHeight) *
                                          0.5) +
                                      4,
                                ),
                              ),
                            ),
                            if (widget.showDomainLabel ?? false)
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Transform.translate(
                                  offset: Offset(
                                    0,
                                    height == 0
                                        ? 20
                                        : 0 +
                                            15 +
                                            (widget.spaceDomainLabeltoChart ??
                                                5) +
                                            ((widget.showDomainLine ?? false)
                                                ? (widget.domainLineStyle ==
                                                        null
                                                    ? 0
                                                    : widget
                                                        .domainLineStyle!.width)
                                                : 0) +
                                            (widget.spaceDomainLinetoChart ??
                                                0),
                                  ),
                                  child: item.labelCustom ??
                                      Text(
                                        item.label,
                                        style: widget.domainLabelStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                ),
                              ),
                          ],
                        ),
                      );
                    }),
                  ],
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}

/// Data model for [DChartBarCustom]
class DChartBarDataCustom {
  /// color for item chart
  ///
  /// if null, will be set Colors.blue[100]
  final Color? color;

  /// color for animation ripple click
  final Color? splashColor;

  /// value for item chart
  final double value;

  /// view text which show in tooltip
  ///
  /// if null, will set 'Label: Value'
  final String? valueTooltip;

  /// label text below of chart item
  final String label;

  /// style for value text inside chart item view
  ///
  /// must be set true on [showValue] to see
  final TextStyle? valueStyle;

  /// you can full customization for label widget, like wrap with Transform widget
  final Widget? labelCustom;

  /// you can full customization for value widget
  ///
  /// value position is inside stack.
  ///
  /// so you can wrap your custom widget value like Align
  final Widget? valueCustom;

  /// set to true to show the value inside chart
  ///
  /// if null, will set to false
  final bool? showValue;

  /// elevation for box item chart
  final double? elevation;

  /// color for shadow, [elevation] has to bigger than 0
  final Color? shadowColor;

  /// action when you tap item bar view
  final Function? onTap;

  DChartBarDataCustom({
    this.color,
    required this.value,
    required this.label,
    this.valueStyle,
    this.showValue,
    this.valueTooltip,
    this.labelCustom,
    this.valueCustom,
    this.onTap,
    this.elevation,
    this.splashColor,
    this.shadowColor,
  });
}

class _DChartBarItemValueView extends StatelessWidget {
  const _DChartBarItemValueView({
    Key? key,
    this.valueAlign,
    required this.verticalOffsetTooltip,
    required this.barDataCustom,
    this.valuePadding,
    this.radiusBar,
  }) : super(key: key);

  final DChartBarDataCustom barDataCustom;
  final Alignment? valueAlign;
  final EdgeInsetsGeometry? valuePadding;
  final double verticalOffsetTooltip;
  final BorderRadius? radiusBar;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: barDataCustom.valueTooltip ??
          '${barDataCustom.label}: ${_numberAutoDigit(barDataCustom.value)}',
      preferBelow: false,
      verticalOffset: verticalOffsetTooltip,
      child: GestureDetector(
        onTap:
            barDataCustom.onTap == null ? null : () => barDataCustom.onTap!(),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Material(
              elevation: barDataCustom.elevation ?? 0,
              borderRadius: radiusBar,
              shadowColor: barDataCustom.shadowColor,
              color: barDataCustom.color ?? Colors.blue[100],
              child: InkWell(
                borderRadius: radiusBar,
                splashColor: barDataCustom.splashColor,
                onTap: barDataCustom.onTap == null
                    ? null
                    : () => barDataCustom.onTap!(),
                child: const SizedBox(),
              ),
            ),
            if (barDataCustom.showValue ?? false)
              barDataCustom.valueCustom ??
                  Align(
                    alignment: valueAlign ?? Alignment.topCenter,
                    child: Padding(
                      padding: valuePadding ?? const EdgeInsets.all(4),
                      child: Text(
                        _numberAutoDigit(barDataCustom.value),
                        style: barDataCustom.valueStyle,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

String _numberAutoDigit(double value, [int maxDigit = 3]) {
  if (value.toInt() == value) {
    return value.toInt().toString();
  } else {
    int digit = value.toString().split('.').last.length;
    if (digit > maxDigit) return value.toStringAsFixed(maxDigit);
    return value.toString();
  }
}
