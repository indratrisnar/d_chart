# d_chart

Simple way to show and use chart for Flutter with many option.
This package is built on top of [community_charts_flutter](https://pub.dev/packages/community_charts_flutter).

# Usage

- [Full Documentation](https://dchart.pages.dev/docs/usage)
- [Tutorial](https://dchart.pages.dev/docs/category/tutorial)
- Wrap Chart with Widget Size like SizedBox, Container, Aspecration etc to set root size for chart
- Example

```dart
AspectRatio(
    aspectRatio: 16/9,
    child: DChartComboO(),
),

SizedBox(
    width: 240,
    height: 200,
    child: DChartComboN(),
),
```

<br>

| Code | Type    | Domain   |
| ---- | ------- | -------- |
| N    | Numeric | Number   |
| O    | Ordinal | String   |
| T    | Time    | DateTime |

<br>

| <div style="width:30px">No</div> | <div style="width:120px">Type</div>                             | <div style="width:200px">Widget</div>                                                                | <div style="width:80px">Example</div>                                                                                                                                                                                         |
| :------------------------------: | --------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|                1                 | [Bar](https://dchart.pages.dev/docs/category/bar)               | <div style="height:40px">DChartBarO</div>DChartBarT                                                  | <image src="https://github.com/indratrisnar/d_chart/raw/master/pic/bar.png" caption="" alt="alter-text" height="" width="350" position="center" command="fill" option="q100" class="img-fluid" title=""  webp="false">        |
|                2                 | [Line](https://dchart.pages.dev/docs/category/line)             | <div style="height:40px">DChartLineN</div> DChartLineT                                               | <image src="https://github.com/indratrisnar/d_chart/raw/master/pic/line.png" caption="" alt="alter-text" height="" width="350" position="center" command="fill" option="q100" class="img-fluid" title=""  webp="false">       |
|                3                 | [Scatter](https://dchart.pages.dev/docs/category/scatter)       | <div style="height:40px">DChartScatterN</div> DChartScatterT                                         | <image src="https://github.com/indratrisnar/d_chart/raw/master/pic/scatter.png" caption="" alt="alter-text" height="" width="350" position="center" command="fill" option="q100" class="img-fluid" title=""  webp="false">    |
|                4                 | [Combo](https://dchart.pages.dev/docs/category/combo)           | <div style="height:40px">DChartComboN</div> <div style="height:40px">DChartComboO</div> DChartComboT | <image src="https://github.com/indratrisnar/d_chart/raw/master/pic/combo.png" caption="" alt="alter-text" height="" width="350" position="center" command="fill" option="q100" class="img-fluid" title=""  webp="false">      |
|                5                 | [Pie](https://dchart.pages.dev/docs/category/pie)               | <div style="height:40px">DChartPieN</div> <div style="height:40px">DChartPieO</div> DChartPieT       | <image src="https://github.com/indratrisnar/d_chart/raw/master/pic/pie.png" caption="" alt="alter-text" height="" width="350" position="center" command="fill" option="q100" class="img-fluid" title=""  webp="false">        |
|                6                 | [Bar Custom](https://dchart.pages.dev/docs/category/bar-custom) | DChartBarCustom                                                                                      | <image src="https://github.com/indratrisnar/d_chart/raw/master/pic/bar_custom.png" caption="" alt="alter-text" height="" width="350" position="center" command="fill" option="q100" class="img-fluid" title=""  webp="false"> |
|                7                 | [Single Bar](https://dchart.pages.dev/docs/category/single-bar) | DChartSingleBar                                                                                      | <image src="https://github.com/indratrisnar/d_chart/raw/master/pic/single_bar.png" caption="" alt="alter-text" height="" width="350" position="center" command="fill" option="q100" class="img-fluid" title=""  webp="false"> |

<br>

# Other

Support me for more feature & packages
[Donate](https://www.paypal.com/paypalme/indratrisnar)

Check my app : [Visit](https://indratrisnar.github.io/portfolio.html)

Check My Tutorial & Course : [Watch](https://www.youtube.com/channel/UC0d_xINEvCtlDCpWfBpnYpA)
