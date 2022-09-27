import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/core/utilities/layout_utils.dart';

import '../../../core/styles/style.dart';
import '../../../core/utilities/image.dart';
import '../../../data/models/tasks/task_model.dart';

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

  final currentIndex = initTab.index.obs;
  final isChoseTime = false.obs;
  final isLoading = false.obs;

  final _timeSelected = ''.obs;
  String get timeSelected => _timeSelected.value;

  final _dateSelected = DateTime.now().obs;
  DateTime get dateSelected => _dateSelected.value;

  @override
  void onInit() {
    getData();
    bottoms
      ..add(BottomNavigator('Index', AppImage.home))
      ..add(BottomNavigator('Calendar', AppImage.calendar))
      ..add(BottomNavigator('Focuse', AppImage.clock))
      ..add(BottomNavigator('Profile', AppImage.user));
    super.onInit();
  }

  void onDaySelected(DateTime time, _) => _dateSelected(time);

  Future<void> onChangeTab(int index) async {
    pageController.jumpToPage(index);
    currentIndex(index);
  }

  void openAddTask() {
    LayoutUtils.openAddTask();
  }

  Future<void> onSave(
    String id,
    String title,
    String decription,
    String date,
    String time,
    // String category,
    // int priority,
  ) async {
    await FirebaseFirestore.instance.collection('task').doc(id).set(
      {
        'title': title,
        'decription': decription,
        'date': date,
        'time': time,
        // 'task': task,
        // 'isDone': done,
      },
      SetOptions(merge: true),
    ).then(
      (value) {
        getData();
        Get.back();
      },
    );
  }

  Future<void> getData() async {
    try {
      QuerySnapshot taskSnap = await FirebaseFirestore.instance
          .collection('task')
          .orderBy('title')
          .get();
      taskList.clear();

      for (var item in taskSnap.docs) {
        taskList.add(
          TaskModel(
            item.id,
            item['title'],
            item['decription'],
            item['date'],
            item['time'],
          ),
        );
      }
      update();
    } catch (e) {
      print(e.toString());
    }
  }

  void onSelectedTime(String newTime) {
    _timeSelected(newTime);
  }

  void openPickTime() {
    LayoutUtils.openTimmer().whenComplete(
      () {
        isChoseTime(false);
        print(taskList.length);
      },
    );
  }

  Future<void> onChoseTime() async {
    isChoseTime(true);
  }

  void onCancel() {
    Get.back();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
