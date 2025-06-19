enum RoadmapType { curve, straight }

extension RoadmapTypeX on RoadmapType {
  bool get isCurve => this == RoadmapType.curve;
}
