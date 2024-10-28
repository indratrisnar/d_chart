## 2.10.0

- Secondary Measure Axis

  - ChartGroup:  
    `useSecondaryMeasureAxis` : `false`
  - to activate this axis, set `useSecondaryMeasureAxis` to true and add `secondaryMeasureAxis` property
  - Reference:
    - [Only Secondary](https://juliansteenbakker.github.io/community_charts/flutter/example/axes/bar_secondary_axis_only)
    - [Both](https://juliansteenbakker.github.io/community_charts/flutter/example/axes/bar_secondary_axis)
  - This update specially for Bar Chart and useful for comparing Series that have different units (if both)

- Track chart
  - ConfigRenderPoint
    - `showComparisonPoint` : `false`
    - `comparisonSymbolRender` : `ComparisonSymbolRenderRectangleRange()`
  - Data Model  
    LowerBound & UpperBound for each Data Item  
    This value affect to Area such as in Line Chart

## 2.9.1

- solution for issue [#36](https://github.com/indratrisnar/d_chart/issues/36)

## 2.9.0

- LineStyle:  
  default color from `Colors.grey` to `Colors.black12`

- Axis (Domain & Measure)

  - new property for feature Grid Line:
    - `useGridLine` default to `false`
    - `gridLineStyle` default to `LineStyle()`
  - new property for styling tick axis
    - `tickLineStyle` default to `LineStyle()`

- Grid Line Render

  - Combo Numeric
  - Line Numeric
  - Scatter Numeric
  - Bar Ordinal
  - Combo Ordinal
  - Bar Time
  - Combo Time
  - Line Time
  - Scatter Time

- project sdk version  
  change from `">=3.4.3 <4.0.0"` to `^3.5.1`

## 2.8.0

- bar label styling / decoration move to Config Render Bar
- restructure/segmentation styling, formatter and decorator for each chart
- new point decorator
- remove unused property in some chart type
- fontweight and lineheight on Label Style
- tickLabelFormatter for domain type Numeric and Time
- numeric tick provider to manage tick on axis

## 2.7.1

- new property:
  - onUpdatedListener
  - onChangedListener
- upgrade dart sdk to 3.4.3 or flutter 3.22.2
- upgrade community_chart to 1.0.4

## 2.6.9

- new property in Axis "noRenderSpec" to disable label and tick axis

## 2.6.8

- reorganize data models
- add series category to Group Model, used for Grouped Stacked
- web docs url, changed

## 2.6.7

- new web documentation

## 2.6.6

- fix position property of:
  - labelRotation
  - minimumPaddingBetweenLabels

## 2.6.5

- new property:
  - layoutMargin
  - allowSliding
  - viewport for measureAxis -> only numeric

## 2.6.4

- new property in domain axis:
  - labelRotation
  - minimumPaddingBetweenLabels
  - 2 property above can use to show more label in time series widget
- update base package
  - community_charts_flutter: 1.0.1 to 1.0.2
  - community_charts_common: 1.0.1 to 1.0.2

## 2.6.3

- resimple import with single import, but can still import separate
- Chart widget was removed:
  - DChartBar
  - DChartLine
  - DChartScatter
  - DChartPie
  - DChartTime

## 2.6.2

add new property `labelFormatterT` to set custom view label domain for Chart Time:

- DChartBarT
- DChartComboT
- DChartLineT
- DChartScatterT

## 2.6.1

- update readme
- all documentation move to [https://flutterdlux.netlify.app/d_chart/](https://flutterdlux.netlify.app/d_chart/)

## 2.6.0

deprecated chart widget:

- DChartBar
- DChartLine
- DChartScatter
- DChartPie
- DChartTime

new pie chart where include donut & gauge:

- DChartPieN
- DChartPieO
- DChartPieT

## 2.5.1

- add propert flipVertical to Combo Time

## 2.5.0

add new chart:

- DChartLineN
- DChartScatterN
- DChartBarT
- DChartLineT
- DChartScatterT

## 2.4.0

- add new chart (copy from combo) & set to single bar chart [DChartBarO]
- add full documentation web
- add viewport for combo and DChartBarO

## 2.3.0

- change sdk: ">=2.17.0 <4.0.0"
- Chart Combo\
  Support multi type: line, plot, bar\
  also can single just line/plot/bar
- update package resource depend on:
  community_charts_flutter: ^1.0.1
  community_charts_common: ^1.0.1

## 2.2.11

- update src DChartSingleBar
- add documentation for DChartSingleBar
- add example image for DChartScatter

## 2.2.10

- add DChartScatter example documentation

## 2.2.9

- update comment on color DChartTime
- add link tutor DCharTime [DRenderBar]
- add link tutor DCharTime [Issue Symbol Renderer When Change Render Type]
- add link tutor DCharTime [Color]
- add link tutor DCharTime [Action Listener]

## 2.2.8

- add link tutor DCharTime [DRenderLine] & [DRenderTargetLine]
- remove property borderWith and legendIon in DRenderPoint

## 2.2.7

- remove property areaOpacity in DRenderLine

## 2.2.6

- add link tutor DCharTime [Legend]

## 2.2.5

- add link tutor DCharTime [Title & Subtitle]
- restyle default source (has no effect on the others)

## 2.2.4

- add new chart: DChartSingleBar
  used for percentage comparisons

## 2.1.4

- add link tutor measure DChartTime

## 2.1.3

- fix showMeasureLabel on DChartBarCustom

## 2.1.2

- add properti domainLabelAlignVertical to DChartBarCustom

## 2.1.1

- add link tutor domain DChartTime

## 2.1.0

- add src DChartScatter (new chart)

## 2.0.2

- add tutorial for Intro DChartTime

## 2.0.1

- error/bug LegendMeasure typedef fixed

## 2.0.0

- add Time Series Chart, called DChartTime
- DChartTime pic
- DChartTime example

## 1.0.2

- add tutor link for DChartBarCustom

## 1.0.1

fix bug on DChartBarCustom

- when value is null, label domain is gone (Fixed)

## 1.0.0

migrate source from 'charts_flutter' to 'community_charts_flutter'\
how to use package: nothing different\
Fix issue => Warning: Operand of null-aware operation '!' has type 'SchedulerBinding' which excludes null.

## 0.1.0

add new view for custom bar, DChartBarCustom

## 0.0.4

Add Youtube Tutorial.

## 0.0.3

Bug fix.

## 0.0.2

Change call widget.

Before -> call via method
example: DChart.bar()

After -> call via class
example: DChartBar

## 0.0.1

Chart Type :

- Chart Bar (Simple, Horizontal, Vertical & Custom)
- Chart Line (Simple, Point, Area & Custom)
- Chart Pie (Simple, Donut & Custom)
- Chart Gauge (Simple & Custom)
