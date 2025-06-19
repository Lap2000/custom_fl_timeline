enum RoadMapOrientation { vertical, horizontal }

extension RoadMapOrientationX on RoadMapOrientation {
  bool get isVertical => this == RoadMapOrientation.vertical;
}
