import 'package:get/get.dart';

import '../../modules/dashboard/widgets/add_task_sheet.dart';
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

  static Future<dynamic> openTimmer() {
    return Get.dialog(
      AlertDialog(
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
        content: const PickDateTime(),
      ),
    );
  }
}
