import 'package:get/get.dart';
import 'package:todo_app/app/modules/calendar/widgets/edit_money.dart';
import 'package:todo_app/app/modules/dashboard/widgets/pick_tag.dart';
import 'package:todo_app/app/modules/profile/widgets/change_language.dart';
import 'package:todo_app/app/modules/profile/widgets/change_theme.dart';

import '../../modules/calendar/widgets/edit_title.dart';
import '../../modules/dashboard/widgets/add_task_sheet.dart';
import '../../modules/dashboard/widgets/delete_task.dart';
import '../../modules/dashboard/widgets/pick_category.dart';
import '../../modules/dashboard/widgets/pick_date_time.dart';
import '../styles/style.dart';

class LayoutUtils {
  static void openAddTask() {
    Get.bottomSheet(
      const AddTaskSheet(),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      backgroundColor: Get.context!.background,
    );
  }

  static Future<void> openChangeLanguage() async {
    return Get.dialog(
      DialogForm(
        content: SizedBox(
          width: Get.context!.widthScale,
          child: const ChangeLanguage(),
        ),
      ),
    );
  }

  static Future<void> openChangeTheme() async {
    return Get.dialog(
      DialogForm(
        content: SizedBox(
          width: Get.context!.widthScale,
          child: const ChangeTheme(),
        ),
      ),
    );
  }

  static Future<dynamic> openDeleteTask() {
    return Get.dialog(
      const DialogForm(
        content: DeleteTask(),
      ),
    );
  }

  static Future<dynamic> editTitleSpend() {
    return Get.dialog(
      const DialogForm(
        content: EditTitle(),
      ),
    );
  }

  static Future<dynamic> editMoneySpend() {
    return Get.dialog(
      const DialogForm(
        content: EditMoney(),
      ),
    );
  }

  static Future<dynamic> openTimmer() {
    return Get.dialog(
      const DialogForm(
        content: PickDateTime(),
      ),
    );
  }

  static Future<dynamic> openPickTag() {
    return Get.dialog(
      const DialogForm(
        content: PickTagDialog(),
      ),
    );
  }

  static Future<dynamic> openPickCategory() {
    return Get.dialog(
      const DialogForm(
        content: PickCaregoryDialog(),
      ),
    );
  }
}

class DialogForm extends StatelessWidget {
  const DialogForm({
    Key? key,
    required this.content,
  }) : super(key: key);
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
      titlePadding: const EdgeInsets.only(
        top: 8,
        right: 8,
      ),
      insetPadding: const EdgeInsets.all(24),
      contentPadding: const EdgeInsets.only(bottom: 10),
      backgroundColor: Get.context!.background,
      content: content,
    );
  }
}
