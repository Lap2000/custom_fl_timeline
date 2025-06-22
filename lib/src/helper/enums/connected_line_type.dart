enum ConnectedLineType { solid, dash }

extension ConnectedLineTypeX on ConnectedLineType {
  bool get isSolid => this == ConnectedLineType.solid;
}
