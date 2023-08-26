# d_chart

D'Chart is the development of an existing package chart, namely **community_charts_flutter**.\
The purpose of this pakage is simple way to use chart from [community_charts_flutter](https://pub.dev/packages/community_charts_flutter).

# Usage

- [Full Documentation](https://flutterdlux.netlify.app/d_chart/)
- [Tutorial](https://www.youtube.com/watch?v=mdMayNHY7so&list=PLMeCG4xYek-OiZKkbBC7ZFvvsbKhr1HJD&pp=gAQBiAQB)
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

| <div style="width:30px">No</div> | <div style="width:120px">Type</div>                                       | <div style="width:200px">Widget</div>                                                                | <div style="width:80px">Example</div>                                                                                                                                                                                         |
| :------------------------------: | ------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|                1                 | [Bar](https://flutterdlux.netlify.app/d_chart/widgets/bar/)               | <div style="height:40px">DChartBarO</div>DChartBarT                                                  | <image src="https://github.com/indratrisnar/d_chart/raw/master/pic/bar.png" caption="" alt="alter-text" height="" width="350" position="center" command="fill" option="q100" class="img-fluid" title=""  webp="false">        |
|                2                 | [Line](https://flutterdlux.netlify.app/d_chart/widgets/line/)             | <div style="height:40px">DChartLineN</div> DChartLineT                                               | <image src="https://github.com/indratrisnar/d_chart/raw/master/pic/line.png" caption="" alt="alter-text" height="" width="350" position="center" command="fill" option="q100" class="img-fluid" title=""  webp="false">       |
|                3                 | [Scatter](https://flutterdlux.netlify.app/d_chart/widgets/scatter/)       | <div style="height:40px">DChartScatterN</div> DChartScatterT                                         | <image src="https://github.com/indratrisnar/d_chart/raw/master/pic/scatter.png" caption="" alt="alter-text" height="" width="350" position="center" command="fill" option="q100" class="img-fluid" title=""  webp="false">    |
|                4                 | [Combo](https://flutterdlux.netlify.app/d_chart/widgets/combo/)           | <div style="height:40px">DChartComboN</div> <div style="height:40px">DChartComboO</div> DChartComboT | <image src="https://github.com/indratrisnar/d_chart/raw/master/pic/combo.png" caption="" alt="alter-text" height="" width="350" position="center" command="fill" option="q100" class="img-fluid" title=""  webp="false">      |
|                5                 | [Pie](https://flutterdlux.netlify.app/d_chart/widgets/pie/)               | <div style="height:40px">DChartPieN</div> <div style="height:40px">DChartPieO</div> DChartPieT       | <image src="https://github.com/indratrisnar/d_chart/raw/master/pic/pie.png" caption="" alt="alter-text" height="" width="350" position="center" command="fill" option="q100" class="img-fluid" title=""  webp="false">        |
|                6                 | [Bar Custom](https://flutterdlux.netlify.app/d_chart/widgets/bar_custom/) | DChartBarCustom                                                                                      | <image src="https://github.com/indratrisnar/d_chart/raw/master/pic/bar_custom.png" caption="" alt="alter-text" height="" width="350" position="center" command="fill" option="q100" class="img-fluid" title=""  webp="false"> |
|                7                 | [Single Bar](https://flutterdlux.netlify.app/d_chart/widgets/single_bar/) | DChartSingleBar                                                                                      | <image src="https://github.com/indratrisnar/d_chart/raw/master/pic/single_bar.png" caption="" alt="alter-text" height="" width="350" position="center" command="fill" option="q100" class="img-fluid" title=""  webp="false"> |

<br>

# Other

Support me for more feature & packages
[Donate](https://www.paypal.com/paypalme/indratrisnar)

Check my app : [Visit](https://indratrisnar.github.io/projects.html)

Check My Tutorial & Course : [Watch](https://www.youtube.com/channel/UC0d_xINEvCtlDCpWfBpnYpA)
