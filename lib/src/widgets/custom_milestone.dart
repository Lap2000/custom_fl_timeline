import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../custom_fl_timeline.dart';
import 'base_widgets/base_widgets.dart';

class CustomMilestone extends StatelessWidget {
  const CustomMilestone({
    super.key,
    required this.item,
    required this.connectorType,
    required this.isShowDateTime,
    required this.itemPadding,
    required this.linePadding,
    required this.formattedStyle,
    required this.activatedColor,
    required this.deactivatedColor,
    required this.activatedDateTimeColor,
    required this.circleRadius,
    required this.flex,
    required this.textStyle,
    required this.datetimeTextStyle,
    required this.circleBorderWidth,
    required this.circleBorderColor,
    required this.circle3D,
    this.datetimeLocale,
    this.children = const <Widget>[],
    this.circleAtTheEnd = false,
    this.isActivated = false,
    this.milestoneChild,
    this.datetimeChild,
    this.child,
  }) : assert(flex.length == 2, 'List "flex" must contain exactly 2 elements');

  /// Item Model -> Value
  final TimelineMilestone item;

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

  /// Deactivated Color
  final Color deactivatedColor;

  /// Activated DateTime Color
  final Color activatedDateTimeColor;

  /// Activated Color
  final Color activatedColor;

  /// Activted -> circle color and text (default: false)
  final bool isActivated;

  /// Circle radius
  final double circleRadius;

  /// Connected Line Type (solid, dash)
  final PainterType connectorType;

  /// Flex (datetime - value)
  final List<int> flex;

  /// Enable/Disable DateTime
  final bool isShowDateTime;

  /// DateTime Locale (Ex: 'en')
  final String? datetimeLocale;

  /// TextStyle - (without color)
  final TextStyle textStyle;

  /// Datetime TextStyle - (without color)
  final TextStyle datetimeTextStyle;

  /// Widget insides milestone.
  final Widget? milestoneChild;

  /// Widget in the right of milestone.
  final Widget? child;

  /// Widget in the left of milestone.
  final Widget? datetimeChild;

  /// Width of the circle border.
  final double circleBorderWidth;

  /// Color of the circle border.
  final Color circleBorderColor;

  /// circle shader.
  final bool circle3D;

  @override
  Widget build(BuildContext context) {
    final String formatted = item.time != null
        ? DateFormat(formattedStyle, datetimeLocale).format(item.time ?? DateTime(0))
        : '';

    final TextStyle valueStyle =
        textStyle.copyWith(color: isActivated ? activatedColor : deactivatedColor);

    final TextStyle datetimeStrStyle =
        datetimeTextStyle.copyWith(color: isActivated ? Colors.black : deactivatedColor);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (isShowDateTime)
            Expanded(
              flex: flex.first,

              /// DateTime
              child: datetimeChild ??
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      OneLineText(
                        formatted.split(' ').first,
                        style: datetimeStrStyle,
                      ),
                      OneLineText(
                        formatted.split(' ').last,
                        style: datetimeStrStyle,
                      ),
                    ],
                  ),
            ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: linePadding),
            child: Column(
              children: <Widget>[
                /// Circle Timeline
                CustomCircleBox(
                  radius: circleRadius,
                  filledColor: isActivated ? activatedColor : deactivatedColor,
                  painterType: connectorType,
                  borderColor: circleBorderColor,
                  borderWidth: circleBorderWidth,
                  circle3D: circle3D,
                  child: milestoneChild,
                ),

                /// if is the last, not show the line.
                if (!circleAtTheEnd)
                  Expanded(
                    child: CustomPaint(
                      painter: StraightConnector(
                        hasArrow: false,
                        color: deactivatedColor,
                        type: connectorType,
                        dashGap: 1,
                        dashLength: 2,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            flex: flex.last,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: circleAtTheEnd ? 0 : itemPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  /// Main value.

                  child ??
                      Text(
                        item.value,
                        style: valueStyle,
                      ),

                  /// extra widgets here.
                  ...children,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
