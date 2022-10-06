import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/app/core/utilities/app_utils.dart';
import 'package:todo_app/app/core/utilities/layout_utils.dart';

import '../../../core/styles/style.dart';
import '../../../core/utilities/image.dart';
import '../../../data/models/tasks/task_model.dart';
import '../../../routes/app_pages.dart';

class BottomNavigator {
  BottomNavigator(this.name, this.icon);
  final String icon;
  final String name;
}

enum DashboardTab { home, calendar, focuse, profile }

const initTab = DashboardTab.home;

class DashboardController extends GetxController {
  final taskTitleCtr = TextEditingController();
  final taskDecriptionCtr = TextEditingController();
  final pageController = PageController(initialPage: initTab.index);
  final bottoms = <BottomNavigator>[];
  final taskList = <TaskModel>[];
  final items = List.generate(10, (i) => i);

  final currentIndex = initTab.index.obs;
  final isChoseTime = false.obs;
  final isLoading = false.obs;

  final _tagSelected = 0.obs;
  int get tagSelected => _tagSelected.value;

  final _categorySelected = 0.obs;
  int get categorySelected => _categorySelected.value;

  final _timeSelected = ''.obs;
  String get timeSelected => _timeSelected.value;

  final _dateSelected = DateTime.now().obs;
  DateTime get dateSelected => _dateSelected.value;

  Rx<List<TaskModel>> listTaskSearch = Rx<List<TaskModel>>([]);

  @override
  void onInit() {
    getData();
    bottoms
      ..add(BottomNavigator('Index', AppImage.home))
      ..add(BottomNavigator('Calendar', AppImage.calendar))
      ..add(BottomNavigator('Focuse', AppImage.clock))
      ..add(BottomNavigator('Profile', AppImage.user));
    super.onInit();
    listTaskSearch.value = taskList;
  }

  void onDaySelected(DateTime time, _) {
    _dateSelected(time);
  }

  void openAddTask() {
    LayoutUtils.openAddTask();
  }

  void openPickTag() {
    LayoutUtils.openPickTag();
  }

  void openPickCategory() {
    LayoutUtils.openPickCategory();
  }

  void openPickTime() {
    LayoutUtils.openTimmer().whenComplete(() => isChoseTime(false));
  }

  void onSelectedTime(String newTime) {
    _timeSelected(newTime);
  }

  void onChoseTime() {
    isChoseTime(true);
  }

  void onPickTag(int index) {
    _tagSelected(index);
  }

  void onPickCategory(int index) {
    _categorySelected(index);
  }

  void filterPlayer(String titleInput) {
    List<TaskModel> results = [];
    if (titleInput.isEmpty) {
      results = taskList;
    } else {
      results = listTaskSearch.value
          .where((element) =>
              element.title.toLowerCase().contains(titleInput.toLowerCase()))
          .toList();
    }
    listTaskSearch.value = results;
  }

  Future<void> gotoDetail(int taskId) async {
    final result = await Get.toNamed(
      Routes.taskDetail,
      arguments: {
        'taskModel': taskList[taskId],
      },
    );

    if (result is bool && result) {
      deleteTask(taskList[taskId].id);
    }
  }

  Future<void> onChangeTab(int index) async {
    pageController.jumpToPage(index);
    currentIndex(index);
  }

  Future<void> onSave() async {
    final id = taskList.length;
    if (taskDecriptionCtr.text.isEmpty || taskTitleCtr.text.isEmptyOrNull) {
      AppUtils.toast('Please input all field to create task');
    } else {
      final dateFormat = dateSelected.day == DateTime.now().day &&
              dateSelected.month == DateTime.now().month &&
              dateSelected.year == DateTime.now().year
          ? 'Today At '
          : '${DateFormat('dd/MM/yyyy').format(dateSelected)}\n At ';
      await FirebaseFirestore.instance
          .collection('task')
          .doc(id.toString())
          .set(
        {
          'id': id,
          'title': taskTitleCtr.text,
          'decription': taskDecriptionCtr.text,
          'date': dateFormat,
          'time': timeSelected,
          'createAt': DateTime.now().toString(),
          'tag': tagSelected,
          'category': categorySelected,
        },
        SetOptions(merge: true),
      ).then(
        (value) {
          getData();
          taskDecriptionCtr.clear();
          taskTitleCtr.clear();
          _tagSelected(0);
          _categorySelected(0);
          Get.back();
        },
      );
    }
  }

  Future<void> deleteTask(String id) async {
    await FirebaseFirestore.instance
        .collection("task")
        .doc(id)
        .delete()
        .then((value) {
      getData();
      Get.back();
    });
  }

  Future<void> getData() async {
    try {
      QuerySnapshot taskItem = await FirebaseFirestore.instance
          .collection('task')
          .orderBy(
            'createAt',
            descending: true,
          )
          .get();
      taskList.clear();
      for (var item in taskItem.docs) {
        taskList.add(
          TaskModel(
            item.id,
            item['title'],
            item['decription'],
            item['date'],
            item['time'],
            item['tag'],
            item['category'],
            item['createAt'],
          ),
        );
      }
      update();
    } catch (e) {
      AppUtils.toast(e.toString());
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    taskDecriptionCtr.dispose();
    taskTitleCtr.dispose();
    super.onClose();
  }
}
