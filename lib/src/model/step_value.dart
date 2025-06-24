import 'package:flutter/widgets.dart';

class TimelineMilestone {
  TimelineMilestone(
    this.value, {
    this.color,
    this.time,
    this.isActivated = false,
  });

  /// Value of milestone
  final String value;

  /// Value of milestone
  final bool isActivated;

  /// Color
  final Color? color;

  /// Datetime
  final DateTime? time;
}
