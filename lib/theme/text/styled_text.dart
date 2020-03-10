import 'package:flutter/material.dart';
import 'package:tennis_club/theme/text/styles.dart';
export 'styles.dart';

enum DisplayOn {
  normal,
  primary,
  primaryDark,
  primaryDark2,
}

class StyledText extends StatelessWidget {
  StyledText({
    Key key,
    @required this.text,
    @required this.style,
    this.displayOn = DisplayOn.normal,
    this.textAlign,
  })  : assert(text != null),
        assert(style != null),
        assert(displayOn != null),
        super(key: key);

  final String text;
  final TextStyle style;
  final DisplayOn displayOn;

  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _copyWithColor(style, displayOn),
      textAlign: textAlign,
    );
  }
}

TextStyle _copyWithColor(TextStyle base, DisplayOn displayOn) {
  Color color = Colors.black;
  switch (displayOn) {
    case DisplayOn.normal:
      color = TextColors.normal;
      break;
    case DisplayOn.primary:
      color = TextColors.onPrimary;
      break;
    case DisplayOn.primaryDark:
      color = TextColors.onPrimaryDark;
      break;
    case DisplayOn.primaryDark2:
      color = TextColors.onPrimaryDark2;
      break;
  }
  return base.copyWith(color: color);
}
