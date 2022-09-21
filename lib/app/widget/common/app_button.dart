import 'package:flutter/material.dart';

import '../../core/styles/style.dart';

enum ButtonType { normal, outline, round, roundOutline, text }

class AppButton extends StatelessWidget {
  const AppButton(
    this.text, {
    Key? key,
    this.onPressed,
    this.icon,
    this.loading = false,
    this.disabled = false,
    this.type = ButtonType.normal,
    this.borderRadius = 4.0,
    this.borderWidth = 1,
    this.borderColor,
    this.textColor,
    this.color,
    this.disabledColor,
    this.elevation = 1,
    this.fontSize = 14,
    this.height = 48,
    this.textHeight = 1.2,
    this.width,
    this.axisSize = MainAxisSize.min,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.fontWeight = FontWeight.w500,
    this.maxLines,
    this.padding,
  }) : super(key: key);
  final VoidCallback? onPressed;
  final String text;
  final bool loading;
  final int? maxLines;
  final bool disabled;
  final ButtonType type;
  final Widget? icon;
  final Color? borderColor, textColor, color, disabledColor;
  final double? borderRadius,
      borderWidth,
      elevation,
      fontSize,
      height,
      width,
      textHeight;
  final MainAxisSize axisSize;
  final FontWeight fontWeight;
  final EdgeInsets? padding;
  final MainAxisAlignment mainAxisAlignment;
  Widget _buildLoading() {
    return SizedBox(
      width: (height ?? 30) - 10,
      height: (height ?? 30) - 10,
      child: const Padding(
        padding: EdgeInsets.all(5.0),
        child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation(Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final label = FittedBox(
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: (textColor ?? Colors.white).withOpacity(
            onPressed == null ? 0.5 : 1,
          ),
          fontWeight: fontWeight,
          height: textHeight,
        ),
        maxLines: maxLines,
      ),
    );
    final child = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: axisSize,
      children: loading
          ? [_buildLoading()]
          : [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: icon!,
                ),
              Flexible(child: label),
            ],
    );
    switch (type) {
      case ButtonType.outline:
        Widget button = MaterialButton(
          height: height,
          color: color,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 30),
            side: BorderSide(
              width: borderWidth ?? 1,
              color: borderColor ?? Theme.of(context).primaryColor,
            ),
          ),
          onPressed: onPressed,
          padding: padding,
          child: child,
        );

        return button;

      case ButtonType.round:
        Widget button = ElevatedButton(
          onPressed: disabled ? null : onPressed,
          child: child,
        );

        return button;

      case ButtonType.roundOutline:
        Widget button = OutlinedButton(
          onPressed: disabled ? null : onPressed,
          style: OutlinedButton.styleFrom(
            padding: padding,
          ),
          child: child,
        );
        return button;

      case ButtonType.text:
        Widget button = TextButton(
          onPressed: disabled ? null : onPressed,
          child: child,
        );

        return button;
      default:
        Widget button = MaterialButton(
          elevation: elevation,
          height: height,
          minWidth: width,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
          ),
          disabledColor: disabledColor ?? Theme.of(context).primaryColor,
          color: color ?? Theme.of(context).primaryColor,
          onPressed: disabled || loading ? null : onPressed,
          child: child,
        );

        return button;
    }
  }
}
