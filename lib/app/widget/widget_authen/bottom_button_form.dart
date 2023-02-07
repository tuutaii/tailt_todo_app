import '../../core/styles/style.dart';
import '../../core/utilities/image.dart';
import '../../core/utilities/string.dart';
import '../common/app_button.dart';

class BottomButtonAuthen extends StatelessWidget {
  const BottomButtonAuthen({
    Key? key,
    this.onPressed,
    this.onPressedWithGoogle,
    this.onPressedWithApple,
    required this.titleForm,
    this.isLoading = false,
  }) : super(key: key);

  final VoidCallback? onPressed, onPressedWithGoogle, onPressedWithApple;
  final String titleForm;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(
          titleForm,
          axisSize: MainAxisSize.max,
          onPressed: onPressed,
          loading: isLoading,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 31.h),
          child: Row(
            children: [
              const Expanded(
                child: Divider(),
              ),
              Text(
                StringUtils.or,
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
          '$titleForm Google',
          textColor: context.surface,
          onPressed: onPressedWithGoogle,
          icon: Image.asset(AppImage.google),
          axisSize: MainAxisSize.max,
          type: ButtonType.outline,
        ),
        SizedBox(height: 20.h),
        AppButton(
          '$titleForm Apple',
          textColor: context.surface,
          onPressed: onPressedWithApple,
          icon: Image.asset(AppImage.apple),
          axisSize: MainAxisSize.max,
          type: ButtonType.outline,
        ),
      ],
    );
  }
}
