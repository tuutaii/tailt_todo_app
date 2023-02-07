import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:todo_app/app/widget/common/app_button.dart';

import '../../../core/styles/style.dart';
import '../../../widget/common/calendar_picker.dart';
import '../../dashboard/widgets/day_builder.dart';
import '../controllers/calendar_controller.dart';

class CalendarView extends GetView<CalendarController> {
  const CalendarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.calendar.tr),
        centerTitle: true,
      ),
      floatingActionButton: Obx(() =>
          controller.dateSelected.day == DateTime.now().day &&
                  controller.dateSelected.month == DateTime.now().month &&
                  controller.dateSelected.year == DateTime.now().year
              ? Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: AppButton(
                    'Add new',
                    height: 40,
                    onPressed: controller.onAdd,
                  ),
                )
              : const SizedBox()),
      body: Obx(
        () => Stack(
          children: [
            Column(
              children: [
                _calendarWidget(),
                _financeWidget(context),
                ColoredBox(
                  color: context.background,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Transactions',
                          style: context.subtitle1,
                        ),
                        Text(
                          'Spending',
                          style: context.subtitle1,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: controller.getData,
                    child: Obx(
                      () => controller.spendList.isEmpty
                          ? Center(
                              child: Text(
                                'There are currently no transactions.',
                                style: context.bodyText1,
                              ),
                            )
                          : ListView.builder(
                              padding: const EdgeInsets.only(bottom: 60),
                              itemCount: controller.spendList.length,
                              itemBuilder: (context, index) {
                                return Slidable(
                                  key: ValueKey(index),
                                  endActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        flex: 1,
                                        onPressed: (context) {
                                          controller.deleteItem(
                                              controller.spendList[index].id);
                                        },
                                        backgroundColor: Colors.red,
                                        foregroundColor: Colors.white,
                                        icon: Icons.delete,
                                        label: 'Remove',
                                      ),
                                    ],
                                  ),
                                  child: ListTile(
                                    shape: Border(
                                      bottom: BorderSide(
                                          color: context.dividerColor),
                                    ),
                                    title: InkWell(
                                      onTap: () => controller.editTitleSpend(
                                        int.parse(
                                            controller.spendList[index].id),
                                      ),
                                      child: Text(
                                        controller.spendList[index].title,
                                        style: context.subtitle1
                                            .copyWith(fontSize: 14),
                                      ),
                                    ),
                                    subtitle: Text(
                                      controller.spendList[index].date,
                                      style: context.caption
                                          .copyWith(color: Colors.grey),
                                    ),
                                    trailing: InkWell(
                                      onTap: () => controller.editMoneySpend(
                                        int.parse(
                                            controller.spendList[index].id),
                                      ),
                                      child: Text(
                                        '${int.parse(controller.spendList[index].money).priceString} VND',
                                        style: context.subtitle1.copyWith(
                                          color: context.onBackground,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ),
                ),
              ],
            ),
            if (controller.isLoading.value)
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _financeWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Container(
                height: 70,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 247, 157, 2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Finance',
                      style: context.subtitle1.copyWith(
                        color: context.onBackground,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          int.parse(10000000.toString()).priceString,
                          style: context.subtitle1.copyWith(
                            fontSize: 20,
                            color: context.onBackground,
                          ),
                        ),
                        Text(
                          'VND',
                          style: context.subtitle1.copyWith(
                            color: context.onBackground,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 70,
                decoration: BoxDecoration(
                  color: context.primary,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Spending',
                          style: context.subtitle1.copyWith(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Remaining',
                          style: context.subtitle1.copyWith(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Obx(
                          () => Text(
                            '- ${controller.totalMoneyString} VND',
                            style: context.subtitle1.copyWith(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Text(
                          '${controller.remianString} VND',
                          style: context.subtitle1.copyWith(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: context.onBackground,
                  border: Border.all(color: context.background, width: 5)),
              child: Icon(
                Icons.arrow_downward_outlined,
                color: context.background,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _calendarWidget() {
    return SizedBox(
      height: 150.h,
      child: Obx(
        () => CalenderPicker(
          padding: EdgeInsets.zero,
          calendarFormat: CalendarFormat.week,
          firstDay: DateTime(2000, 1, 1),
          lastDay: DateTime(2030, 1, 1),
          focusedDay: controller.dateSelected,
          isActiveSelected: true,
          onDaySelected: controller.onSelectedDate,
          toDateBuilder: (context, date, _) {
            return DateBuilder(date: date.day.toString());
          },
          selectedBuilder: (context, date, _) {
            return DateBuilder(
              date: date.day.toString(),
              selected: true,
            );
          },
        ),
      ),
    );
  }
}
