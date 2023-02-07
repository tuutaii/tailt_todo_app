import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:todo_app/app/core/styles/style.dart';
import 'package:todo_app/app/data/models/spendding/spend_model.dart';
import '../../../core/utilities/app_utils.dart';
import '../../../core/utilities/layout_utils.dart';

class CalendarController extends GetxController {
  final _dateSelected = DateTime.now().obs;
  DateTime get dateSelected => _dateSelected.value;

  final spendList = <SpendModel>[].obs;
  final isLoading = false.obs;
  final _totalMoney = 0.obs;
  String get totalMoneyString => int.parse(_totalMoney.toString()).priceString;
  int get totalMoney => _totalMoney.value;

  final remain = 10000000.obs;
  String get remianString => int.parse(remain.toString()).priceString;

  Future<void> onAdd() async {
    isLoading(true);
    final id = DateTime.now().millisecondsSinceEpoch;
    final dateFormat = DateFormat('dd/MM/yyyy').format(dateSelected);
    await FirebaseFirestore.instance
        .collection('spends')
        .doc(id.toString())
        .set(
      {
        'id': id.toString(),
        'title': 'Empty',
        'decription': 'Empty',
        'money': '0',
        'date': dateFormat,
        'createAt': DateTime.now().toString(),
      },
      SetOptions(merge: true),
    ).then(
      (value) {
        getData();
        isLoading(false);
        Get.back();
      },
    );
    isLoading(false);
  }

  Future<void> getData() async {
    isLoading(true);
    try {
      QuerySnapshot spendItem = await FirebaseFirestore.instance
          .collection('spends')
          .orderBy(
            'createAt',
            descending: true,
          )
          .where(
            'date',
            isEqualTo: DateFormat('dd/MM/yyyy').format(dateSelected),
          )
          .get();
      spendList.clear();
      for (var item in spendItem.docs) {
        spendList.add(
          SpendModel(
            item.id,
            item['title'],
            item['decription'],
            item['money'],
            item['date'],
            item['createAt'],
          ),
        );
      }
      _totalMoney.value = spendList.sum((p0) => int.parse(p0.money)).toInt();
      update();
    } catch (e) {
      AppUtils.toast(e.toString());
    }
    isLoading(false);
  }

  void deleteItem(String id) async {
    isLoading(true);
    await FirebaseFirestore.instance.collection('spends').doc(id).delete().then(
      (value) {
        getData();
        isLoading(false);
      },
    );
  }

  void onSelectedDate(DateTime date, _) {
    _dateSelected(date);
    getData();
  }

  Future<void> editTitleSpend(int id) async {
    final res = await LayoutUtils.editTitleSpend();
    if (res != null) {
      isLoading(true);
      await FirebaseFirestore.instance
          .collection('spends')
          .doc(id.toString())
          .update({
        'title': res,
      }).then((value) => getData());
    }
    isLoading(false);
  }

  Future<void> editMoneySpend(int id) async {
    final res = await LayoutUtils.editMoneySpend();
    if (res != null) {
      isLoading(true);
      await FirebaseFirestore.instance
          .collection('spends')
          .doc(id.toString())
          .update({
        'money': res,
      }).then((value) => getData());
    }
    isLoading(false);
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
