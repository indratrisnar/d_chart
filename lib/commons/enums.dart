/// for type custom render
enum ChartType { line, bar, scatterPlot }

/// Defines the pattern for a color fill.
///
/// * [forwardHatch] defines a pattern of white lines angled up and to the right
///   on top of a bar filled with the fill color.
/// * [solid] defines a simple bar filled with the fill color. This is the
///   default pattern for bars.
enum FillPattern { solid, forwarHatch }

/// Defines the way multiple series of bars are renderered per domain.
///
/// * [grouped] - Render bars for each series that shares a domain value
///   side-by-side.
/// * [stacked] - Render bars for each series that shares a domain value in a
///   stack, ordered in the same order as the series list.
/// * [groupedStacked]: Render bars for each series that shares a domain value
///   in a group of bar stacks. Each stack will contain all the series that
///   share a series category.
enum BarGroupingType { grouped, groupedStacked, stacked }

/// label position based on tick axis
enum LabelAnchor {
  before,
  centered,
  after,

  /// The top most tick draws all text under the location.
  /// The bottom most tick draws all text above the location.
  /// The rest of the ticks are centered.
  inside,
}

/// position label bar chart item
enum BarLabelAnchor { start, middle, end }

/// Configures where to place the label relative to the bars.
enum BarLabelPosition {
  /// Automatically try to place the label inside the bar first and place it on
  /// the outside of the space available outside the bar is greater than space
  /// available inside the bar.
  auto,

  /// Always place label on the outside.
  outside,

  /// Always place label on the inside.
  inside,

  /// Right align the label with the horizontal bars. The label will be inside
  /// or above the bar based on the BarLabelVerticalPosition.
  right,
}
