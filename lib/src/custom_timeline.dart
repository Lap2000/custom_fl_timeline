import 'package:flutter/material.dart';
import 'helper/helper.dart';
import 'model/model.dart';

import 'widgets/widgets.dart';

/// Widget inside milestone.
/// Ex: Done icon
typedef ChildMilestoneBuilder = Widget? Function(BuildContext context, int index);

/// Widget below main value.
/// Ex: TextButton -> View Image
typedef ExtraWidgetBuilder = List<Widget> Function(BuildContext context, int index);

/// Widget main value.
/// Ex: Text
typedef ChildBuilder = Widget Function(BuildContext context, int index);

/// DateTime Widget.
/// Ex: Text
typedef DateTimeChildBuilder = Widget Function(BuildContext context, int index);

/// Border circle.
typedef BorderCircleBuilder = Color? Function(BuildContext context, int index);

class CustomTimeline extends StatelessWidget {
  const CustomTimeline({
    super.key,
    this.circleRadius = 10,
    required this.values,
    this.padding = const EdgeInsets.all(8.0),
    this.connectorType = PainterType.solid,
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
    this.childMilestoneBuilder,
    this.extraWidgetBuilder,
    this.childBuilder,
    this.dateTimeChildBuilder,
    this.circleBorderWidth = 0,
    this.circleBorderColor,
    this.circle3D = false,
  });

  /// circle radius
  final double circleRadius;

  /// values
  final List<TimelineMilestone> values;

  /// padding timeline
  final EdgeInsets padding;

  /// Connector Type (solid, dash)
  final PainterType connectorType;

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

  /// Widget inside milestone.
  /// Ex: Done icon
  final ChildMilestoneBuilder? childMilestoneBuilder;

  /// Widget below main value.
  /// Ex: TextButton -> View Image
  final ExtraWidgetBuilder? extraWidgetBuilder;

  /// Widget below main value.
  /// Manually custom
  final ChildBuilder? childBuilder;

  /// DateTime.
  /// Manually custom
  final DateTimeChildBuilder? dateTimeChildBuilder;

  /// Width of the circle border.
  final double circleBorderWidth;

  /// Color of the circle border.
  final BorderCircleBuilder? circleBorderColor;

  /// circle shader.
  final bool circle3D;

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
                  connectorType: connectorType,
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
                  circleBorderWidth: circleBorderWidth,
                  circle3D: circle3D,
                  circleBorderColor: circleBorderColor?.call(context, index) ?? Colors.black,
                  milestoneChild: childMilestoneBuilder?.call(context, index),
                  children: extraWidgetBuilder?.call(context, index) ?? const <Widget>[],
                  child: childBuilder?.call(context, index),
                  datetimeChild: dateTimeChildBuilder?.call(context, index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
