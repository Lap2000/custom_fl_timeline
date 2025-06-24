import 'package:flutter/widgets.dart';

class OneLineText extends StatelessWidget {
  const OneLineText(
    this.value, {
    super.key,
    this.style,
    this.textAlign,
  });

  final String value;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        value,
        style: style,
        maxLines: 1,
        overflow: TextOverflow.visible,
        textAlign: textAlign,
      ),
    );
  }
}
