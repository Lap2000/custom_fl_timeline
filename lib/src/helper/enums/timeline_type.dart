enum TimelineType { curve, straight }

extension TimelineTypeX on TimelineType {
  bool get isCurve => this == TimelineType.curve;
}
