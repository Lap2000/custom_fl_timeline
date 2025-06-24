enum PainterType { solid, dash }

extension PainterTypeX on PainterType {
  bool get isSolid => this == PainterType.solid;
}

enum MilestoneType { solid, dash }

extension MilestoneTypeX on MilestoneType {
  bool get isSolid => this == MilestoneType.solid;
}

enum CurveConnectorType { left, right, top, bottom }

extension CurveConnectedLineTypeX on CurveConnectorType {
  bool get isLeft => this == CurveConnectorType.left;
  bool get isRight => this == CurveConnectorType.right;
  bool get isBottom => this == CurveConnectorType.bottom;
  bool get isTop => this == CurveConnectorType.top;
}
