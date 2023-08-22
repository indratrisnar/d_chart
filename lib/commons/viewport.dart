// Copyright 2018 the Charts project authors. Please see the AUTHORS file
// for details.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:community_charts_common/community_charts_common.dart' as common;

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
