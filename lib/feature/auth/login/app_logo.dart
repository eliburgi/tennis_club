import 'package:flutter/material.dart';

class AppLogo extends StatefulWidget {
  @override
  _AppLogoState createState() => _AppLogoState();
}

class _AppLogoState extends State<AppLogo> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox.fromSize(
      size: const Size.square(100.0),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            decoration: BoxDecoration(
              color: theme.primaryColor,
              shape: BoxShape.circle,
            ),
          ),
          Positioned(
            top: 10,
            left: 30,
            child: Text(
              'Tennis',
              style: theme.textTheme.headline3,
              softWrap: false,
              maxLines: 1,
              overflow: TextOverflow.visible,
            ),
          ),
          Positioned(
            bottom: 10,
            right: 50,
            child: Text(
              'Roßbach',
              style: theme.textTheme.headline6,
              softWrap: false,
              maxLines: 1,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}
