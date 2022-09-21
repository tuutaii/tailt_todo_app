import '../../core/styles/style.dart';
import '../../core/utilities/image.dart';
import '../common/app_button.dart';

class BottomButtonAuthen extends StatelessWidget {
  const BottomButtonAuthen({
    Key? key,
    this.onPressed,
    this.onPressedWithGoogle,
    this.onPressedWithApple,
    required this.titleForm,
  }) : super(key: key);

  final VoidCallback? onPressed, onPressedWithGoogle, onPressedWithApple;
  final String titleForm;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(
          titleForm,
          axisSize: MainAxisSize.max,
          onPressed: onPressed,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 31.h),
          child: Row(
            children: [
              const Expanded(
                child: Divider(),
              ),
              Text(
                'or',
                style:
                    context.subtitle1.copyWith(color: AppTheme.subtitleColor),
              ),
              const Expanded(
                child: Divider(),
              ),
            ],
          ),
        ),
        AppButton(
          '$titleForm with Google',
          onPressed: onPressedWithGoogle,
          icon: Image.asset(AppImage.google),
          axisSize: MainAxisSize.max,
          type: ButtonType.outline,
        ),
        SizedBox(height: 20.h),
        AppButton(
          '$titleForm with Apple',
          onPressed: onPressedWithApple,
          icon: Image.asset(AppImage.apple),
          axisSize: MainAxisSize.max,
          type: ButtonType.outline,
        ),
      ],
    );
  }
}
