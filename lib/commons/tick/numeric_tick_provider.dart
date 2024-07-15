import 'package:community_charts_common/community_charts_common.dart' as common;

class NumericTickProvider {
  /// automatically include zero in the data range.
  final bool? zeroBound;

  /// automatically choose the best tick count to produce the 'nicest' ticks but make sure we have this many.
  final int? desiredMinTickCount;

  /// automatically choose the best tick count to produce the 'nicest' ticks but make sure we don't have more than this many.
  final int? desiredMaxTickCount;

  /// the fixed number of ticks to try to make.
  ///
  /// Convenience that sets [desiredMinTickCount] and [desiredMaxTickCount] the same.
  ///
  /// Both min and max win out if they are set along with [desiredTickCount].
  final int? desiredTickCount;

  const NumericTickProvider({
    this.zeroBound,
    this.desiredTickCount,
    this.desiredMinTickCount,
    this.desiredMaxTickCount,
  });

  common.BasicNumericTickProviderSpec getRender() {
    return common.BasicNumericTickProviderSpec(
      zeroBound: zeroBound,
      desiredMaxTickCount: desiredMaxTickCount,
      desiredMinTickCount: desiredMinTickCount,
      desiredTickCount: desiredTickCount,
    );
  }
}
