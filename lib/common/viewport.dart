part of '../d_chart.dart';

/// Represents the starting and ending extent of a dataset.
class NumericViewport {
  /// Precondition: [min] <= [max].\
  /// it is recommended that the min and max distance be greater than equal to 1.5
  const NumericViewport({
    required this.min,
    required this.max,
  });

  final num min;
  final num max;

  common.NumericExtents getRender() {
    return common.NumericExtents(min, max);
  }
}

/// Viewport to cover [dataSize] data points starting at [startingDomain] value.
class OrdinalViewport {
  /// Viewport to cover [dataSize] data points starting at [startingDomain] value.
  const OrdinalViewport({
    required this.startingDomain,
    required this.dataSize,
  });

  final String startingDomain;

  final int dataSize;

  common.OrdinalViewport getRender() {
    return common.OrdinalViewport(startingDomain, dataSize);
  }
}

/// Represents the starting and ending extent of a dataset.
class TimeViewport {
  const TimeViewport({
    required this.start,
    required this.end,
  });

  final DateTime start;
  final DateTime end;

  common.DateTimeExtents getRender() {
    return common.DateTimeExtents(start: start, end: end);
  }
}
