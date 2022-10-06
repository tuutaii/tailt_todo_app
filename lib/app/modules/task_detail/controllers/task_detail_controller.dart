import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/core/utilities/layout_utils.dart';
import 'package:todo_app/app/data/models/tasks/task_model.dart';

class TaskDetailController extends GetxController {
  late TaskModel taskModel;
  @override
  void onInit() {
    super.onInit();
    taskModel = Get.arguments['taskModel'];
  }

  Future<void> openDeleteTask() async {
    final result = await LayoutUtils.openDeleteTask();
    if (result is bool && result) {
      Get.back(result: true);
    }
  }
}
