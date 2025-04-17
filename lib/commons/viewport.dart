part of '../d_chart.dart';

/// Viewport to cover [dataSize] data points starting at [startingDomain] value.
class OrdinalViewport {
  final String startingDomain;

  final int dataSize;

  /// Viewport to cover [dataSize] data points starting at [startingDomain] value.
  OrdinalViewport(this.startingDomain, this.dataSize);

  common.OrdinalViewport getRender() {
    return common.OrdinalViewport(startingDomain, dataSize);
  }
}

/// Represents the starting and ending extent of a dataset.
class NumericViewport {
  final num min;
  final num max;

  /// Precondition: [min] <= [max].\
  /// it is recommended that the min and max distance be greater than equal to 1.5
  const NumericViewport(this.min, this.max);

  common.NumericExtents getRender() {
    return common.NumericExtents(min, max);
  }
}

/// Represents the starting and ending extent of a dataset.
class TimeViewport {
  final DateTime start;
  final DateTime end;

  TimeViewport(this.start, this.end);

  common.DateTimeExtents getRender() {
    return common.DateTimeExtents(start: start, end: end);
  }
}
