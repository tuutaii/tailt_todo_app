import '../../core/styles/style.dart';

class AppTitleCustom extends StatelessWidget with PreferredSizeWidget {
  const AppTitleCustom({
    Key? key,
    required this.title,
    this.leading,
    this.action,
  }) : super(key: key);
  final String title;
  final Widget? leading;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: context.headline6,
      ),
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.only(
          left: 24.w,
        ),
        child: leading ??
            BackButton(
              onPressed: () {},
            ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 24.w),
          child: action!,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
