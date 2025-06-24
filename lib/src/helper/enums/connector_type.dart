enum ConnectorType { solid, dash }

extension ConnectedLineTypeX on ConnectorType {
  bool get isSolid => this == ConnectorType.solid;
}
