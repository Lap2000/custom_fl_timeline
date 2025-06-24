import 'package:flutter/widgets.dart';

class OneLineText extends StatelessWidget {
  const OneLineText(
    this.value, {
    super.key,
    required this.style,
  });

  final String value;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        value,
        style: style,
        maxLines: 1,
        overflow: TextOverflow.visible,
        textAlign: TextAlign.end,
      ),
    );
  }
}
