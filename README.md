# d_chart

Simple way to show and use chart for Flutter with many option.
This package is built on top of [community_charts_flutter2](https://pub.dev/packages/community_charts_flutter2).

# Usage

- [Example](https://dchart.pages.dev/docs/3.0.0/example/)
- [Documentation](https://dchart.pages.dev/docs/3.0.0/usage)
- Wrap Chart with SizedBox, Container, AspectRatio etc to adjust chart size

  ```dart
  AspectRatio(
      aspectRatio: 16/9,
      child: DChartComboO(),
  ),
  ```

<br>

| Code | Type    | Domain   |
| ---- | ------- | -------- |
| N    | Numeric | num      |
| O    | Ordinal | String   |
| T    | Time    | DateTime |

- [Bar](https://dchart.pages.dev/docs/3.0.0/category/bar)
  - BarO
  - BarT
  - BarLaneO
  - BarTargetLineN
  - BarTargetLineO
  - BarTargetLineT
- [Line](https://dchart.pages.dev/docs/3.0.0/category/line)
  - LineN
  - LineT
- [Scatter](https://dchart.pages.dev/docs/3.0.0/category/scatter)
  - ScatterN
  - ScatterT
- [Combo](https://dchart.pages.dev/docs/3.0.0/category/combo)
  - ComboN
  - ComboO
  - ComboT
- [Pie](https://dchart.pages.dev/docs/3.0.0/types/pie)
  - PieN
  - PieO
  - PieT

<br>

# Tutor

Check My Tutorial & Course : [Watch](https://www.youtube.com/@flutterdelux)
