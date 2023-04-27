import 'package:flutter/material.dart';

class PlainButton extends StatelessWidget {
  const PlainButton({
    super.key,
    this.onPressed,
    this.leading,
    this.trailing,
    this.title = const Text(
      'Button',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.start,
    ),
    this.subtitle,
    this.elevation = 0.0,
    this.backgroundColor = Colors.transparent,
    this.padding = const EdgeInsets.all(20.0),
    this.radius = 10.0,
    this.border,
  });

  final VoidCallback? onPressed;
  final Widget? leading;
  final Widget? trailing;
  final Widget title;
  final Widget? subtitle;
  final double elevation;
  final Color backgroundColor;
  final EdgeInsets padding;
  final double radius;
  final BorderSide? border;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(elevation),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        padding: MaterialStateProperty.all(
          padding,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: border ??
                const BorderSide(
                  width: 1.0,
                  color: Colors.black38,
                ),
          ),
        ),
        overlayColor: MaterialStateProperty.resolveWith(
          (states) {
            return states.contains(MaterialState.pressed)
                ? Colors.amber.shade50
                : null;
          },
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            leading ?? const Text(''),
            const SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                title,
                subtitle ?? const Text(''),
              ],
            ),
            const SizedBox(
              width: 20.0,
            ),
            trailing ?? const Text(''),
          ],
        ),
      ),
    );
  }
}
