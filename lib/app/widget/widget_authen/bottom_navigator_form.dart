import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

import '../../core/styles/style.dart';

class BottomNavigatorForm extends StatelessWidget {
  const BottomNavigatorForm({
    Key? key,
    required this.content,
    required this.textButton,
    this.onTap,
  }) : super(key: key);
  final String content, textButton;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.mediaQueryViewPadding.bottom),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: content,
          style: context.bodyText1.copyWith(
            color: AppTheme.subtitleColor,
          ),
          children: <TextSpan>[
            TextSpan(
              text: textButton,
              style: context.subtitle1,
              recognizer: TapGestureRecognizer()..onTap = (onTap),
            ),
          ],
        ),
      ),
    );
  }
}
