enum CurveConnectedLineType { left, right, top, bottom }

extension CurveConnectedLineTypeX on CurveConnectedLineType {
  bool get isLeft => this == CurveConnectedLineType.left;
  bool get isRight => this == CurveConnectedLineType.right;
  bool get isBottom => this == CurveConnectedLineType.bottom;
  bool get isTop => this == CurveConnectedLineType.top;
}
