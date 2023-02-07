import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/core/utilities/layout_utils.dart';

import '../../../core/styles/style.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: context.primary,
            ),
            child: Center(
              child: Text(
                LocaleKeys.appSetting.tr,
                style: context.headline6.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.setting.tr,
                  style: context.caption.copyWith(
                    color: AppTheme.subtitleColor,
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.color_lens_outlined,
                    size: 30,
                  ),
                  title: Text(
                    LocaleKeys.changeTheme.tr,
                    style: context.bodyText1,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                  ),
                  horizontalTitleGap: 0,
                  contentPadding: EdgeInsets.zero,
                  onTap: LayoutUtils.openChangeTheme,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.language,
                    size: 30,
                  ),
                  title: Text(
                    LocaleKeys.changeLanguage.tr,
                    style: context.bodyText1,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                  ),
                  horizontalTitleGap: 0,
                  contentPadding: EdgeInsets.zero,
                  onTap: LayoutUtils.openChangeLanguage,
                ),
                ListTile(
                  leading: const Icon(
                    CupertinoIcons.textbox,
                    size: 30,
                  ),
                  title: Text(
                    LocaleKeys.changeFont.tr,
                    style: context.bodyText1,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                  ),
                  horizontalTitleGap: 0,
                  contentPadding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
