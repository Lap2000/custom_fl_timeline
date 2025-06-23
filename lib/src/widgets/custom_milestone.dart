import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../flutter_roadmap.dart';

class CustomMilestone extends StatelessWidget {
  const CustomMilestone({
    super.key,
    required this.item,
    this.children = const <Widget>[],
    this.circleAtTheEnd = false,
    this.itemPadding = 20,
    this.linePadding = 12,
    this.formattedStyle = 'yyyy-MM-dd HH:mm',
    this.activatedColor = Colors.green,
    this.isActivated = false,
    this.circleRadius = 5,
    this.connectedLineType = ConnectedLineType.solid,
  });

  /// Item Model -> Value
  final StepValue item;

  /// Widgets below item.value (ex: textbutton --> click to show something)
  final List<Widget> children;

  /// Milestone inclues one circle without connected line
  final bool circleAtTheEnd;

  /// Padding bettween items
  final double itemPadding;

  /// Padding bettween line and text-datetime (horizontal)
  final double linePadding;

  /// formatted datetime (ex: 'yyyy-MM-dd HH:mm')
  final String formattedStyle;

  /// Activated Color (default: Colors.green)
  final Color activatedColor;

  /// Activted -> circle color and text (default: false)
  final bool isActivated;

  /// Circle radius
  final double circleRadius;

  /// Connected Line Type (solid, dash)
  final ConnectedLineType connectedLineType;

  @override
  Widget build(BuildContext context) {
    final String formatted =
        DateFormat(formattedStyle).format(item.time ?? DateTime(0));

    final TextStyle textStyle =
        TextStyle(color: isActivated ? activatedColor : Colors.grey);

    final TextStyle datetimeStrStyle =
        TextStyle(color: isActivated ? Colors.black : Colors.grey);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(formatted.split(' ').first, style: datetimeStrStyle),
              Text(formatted.split(' ').last, style: datetimeStrStyle),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: linePadding),
            child: Column(
              children: <Widget>[
                CustomStepRoadmap(
                  radius: circleRadius,
                  text: '',
                  filledColor: isActivated ? activatedColor : Colors.grey,
                  pixelPadding: 0,
                  padding: EdgeInsets.only(top: max(0, 15 - circleRadius)),
                ),
                if (!circleAtTheEnd)
                  Expanded(
                    child: CustomPaint(
                      painter: StraightConnectedLine(
                        hasArrow: false,
                        horizontalX: 0,
                        horizontalY: max(0, 10 - circleRadius),
                        color: Colors.grey,
                        type: connectedLineType,
                        dashGap: 1,
                        dashLength: 2,
                        limitExpand: 10,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.only(bottom: circleAtTheEnd ? 0 : itemPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item.value,
                    style: textStyle,
                    softWrap: true,
                  ),
                  ...<Widget>[const SizedBox(height: 6), ...children],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
