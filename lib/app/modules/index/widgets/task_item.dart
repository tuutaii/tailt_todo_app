import '../../../core/styles/style.dart';
import '../../../data/models/tasks/task_model.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    Key? key,
    required this.taskItem,
    this.onTap,
  }) : super(key: key);
  final TaskModel taskItem;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppTheme.taskCardColor,
      margin: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 8.h,
      ),
      child: ListTile(
        onTap: onTap,
        minLeadingWidth: 20.w,
        minVerticalPadding: 10.h,
        dense: true,
        leading: const SizedBox(
          height: double.infinity,
          child: Icon(
            Icons.circle_outlined,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(bottom: 5.h),
          child: Text(
            taskItem.title,
            style: context.subtitle1,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${taskItem.date}${taskItem.time} ',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Container(
              height: 29.h,
              decoration: BoxDecoration(
                color: listCategory[taskItem.category].color,
                borderRadius: BorderRadius.circular(4),
              ),
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                children: [
                  Icon(
                    listCategory[taskItem.category].icon,
                    size: 14,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    listCategory[taskItem.category].name,
                    style: context.overline.copyWith(
                      color: context.onBackground,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 5.w),
            Container(
              height: 29.h,
              decoration: BoxDecoration(
                border: Border.all(color: context.primary, width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                children: [
                  const Icon(
                    Icons.flag,
                    size: 14,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    taskItem.tagNumber.toString(),
                    style: context.caption.copyWith(
                      color: context.onBackground,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
