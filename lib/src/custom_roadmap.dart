import 'package:flutter/material.dart';
import 'helper/helper.dart';
import 'model/model.dart';

import 'widgets/widgets.dart';

class CustomRoadMap extends StatelessWidget {
  const CustomRoadMap({
    super.key,
    this.circleRadius = 5,
    required this.values,
    this.padding = const EdgeInsets.all(8.0),
    this.connectedLineType = ConnectedLineType.solid,
    this.isShowDateTime = true,
    this.datetimeLocale,
    this.itemPadding = 20,
    this.linePadding = 12,
    this.formattedStyle = 'yyyy-MM-dd HH:mm',
    this.activatedColor = Colors.green,
    this.deactivatedColor = Colors.grey,
    this.activatedDateTimeColor = Colors.black,
    this.flex = const <int>[2, 5],
    this.textStyle = const TextStyle(),
    this.datetimeTextStyle = const TextStyle(),
  });

  /// circle roadmap radius
  final double circleRadius;

  /// values
  final List<StepValue> values;

  /// padding roadmap
  final EdgeInsets padding;

  /// Connected Line Type (solid, dash)
  final ConnectedLineType connectedLineType;

  /// Enable/Disable DateTime
  final bool isShowDateTime;

  /// DateTime Locale (Ex: 'en')
  final String? datetimeLocale;

  /// Padding bettween items
  final double itemPadding;

  /// Padding bettween line and text-datetime (horizontal)
  final double linePadding;

  /// formatted datetime (ex: 'yyyy-MM-dd HH:mm')
  final String formattedStyle;

  /// Deactivated Color (default: Colors.green)
  final Color deactivatedColor;

  /// Activated Color (default: Colors.green)
  final Color activatedColor;

  /// Activated DateTime Color (default: Colors.black)
  final Color activatedDateTimeColor;

  /// Flex (datetime - value)
  final List<int> flex;

  /// TextStyle - (without color)
  final TextStyle textStyle;

  /// Datetime TextStyle - (without color).
  /// Note: FittedBox in 1 line.
  final TextStyle datetimeTextStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: values.length,
              itemBuilder: (BuildContext context, int index) {
                return CustomMilestone(
                  item: values[index],
                  circleAtTheEnd: index == values.length - 1,
                  isActivated: values[index].isActivated,
                  connectedLineType: ConnectedLineType.solid,
                  isShowDateTime: isShowDateTime,
                  datetimeLocale: datetimeLocale,
                  formattedStyle: formattedStyle,
                  activatedColor: activatedColor,
                  deactivatedColor: deactivatedColor,
                  activatedDateTimeColor: activatedDateTimeColor,
                  flex: flex,
                  textStyle: textStyle,
                  datetimeTextStyle: datetimeTextStyle,
                  itemPadding: itemPadding,
                  linePadding: linePadding,
                  circleRadius: circleRadius,
                  children: values[index].extraValue,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
