enum TimelineOrientation { vertical, horizontal }

extension TimelineOrientationX on TimelineOrientation {
  bool get isVertical => this == TimelineOrientation.vertical;
}
