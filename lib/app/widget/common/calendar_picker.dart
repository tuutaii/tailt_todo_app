import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../core/styles/style.dart';

class CalenderPicker extends StatefulWidget {
  const CalenderPicker({
    Key? key,
    required this.firstDay,
    required this.lastDay,
    this.focusedDay,
    this.rangeStartDay,
    this.rangeEndDay,
    this.onDaySelected,
    this.isActiveSelected = false,
    this.titleCentered = true,
    this.leftChevronVisible = true,
    this.rightChevronVisible = true,
    this.daysOfWeekVisible = true,
    this.scrollDistanceOneMonth,
    this.title = '',
    this.titleTextFormatter = 'MMMM\nyyyy',
    this.padding = const EdgeInsets.all(8),
    this.calendarFormat = CalendarFormat.month,
    this.availableGestures = AvailableGestures.horizontalSwipe,
    this.isWeekFormat = false,
    this.titleTextStyle,
    this.leftChevronPadding,
    this.rightChevronPadding,
    this.cellMargin,
    this.selectedBuilder,
    this.toDateBuilder,
    this.onPageChanged,
  }) : super(key: key);
  final DateTime firstDay;
  final DateTime lastDay;
  final DateTime? focusedDay, rangeStartDay, rangeEndDay;
  final Function(DateTime, DateTime)? onDaySelected;
  final bool isActiveSelected, isWeekFormat, titleCentered;
  final bool daysOfWeekVisible, leftChevronVisible, rightChevronVisible;
  final bool? scrollDistanceOneMonth;
  final String title;
  final String titleTextFormatter;
  final EdgeInsetsGeometry padding;
  final CalendarFormat calendarFormat;
  final AvailableGestures availableGestures;
  final EdgeInsets? leftChevronPadding, rightChevronPadding, cellMargin;
  final TextStyle? titleTextStyle;
  final Widget? Function(BuildContext, DateTime, DateTime)? selectedBuilder;
  final Widget? Function(BuildContext, DateTime, DateTime)? toDateBuilder;
  final Function(DateTime)? onPageChanged;

  @override
  State<CalenderPicker> createState() => _CalenderState();
}

class _CalenderState extends State<CalenderPicker>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final BoxDecoration boxRectangle = BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(4),
    );
    return ColoredBox(
      color: context.background,
      child: Padding(
        padding: widget.padding,
        child: TableCalendar(
          calendarFormat: widget.calendarFormat,
          startingDayOfWeek: StartingDayOfWeek.sunday,
          selectedDayPredicate: (day) {
            if (widget.isActiveSelected) {
              return isSameDay(widget.focusedDay, day);
            }
            return widget.isActiveSelected;
          },
          onRangeSelected: (start, end, focusedDay) {},
          onDaySelected: widget.onDaySelected,
          daysOfWeekVisible: widget.daysOfWeekVisible,
          daysOfWeekHeight: 20,
          rowHeight: 20,
          shouldFillViewport: true,
          headerVisible: true,
          headerStyle: HeaderStyle(
            formatButtonShowsNext: true,
            formatButtonVisible: false,
            leftChevronVisible: widget.leftChevronVisible,
            rightChevronVisible: widget.rightChevronVisible,
            leftChevronPadding: widget.leftChevronPadding ?? EdgeInsets.zero,
            rightChevronPadding: widget.rightChevronPadding ?? EdgeInsets.zero,
            titleCentered: widget.titleCentered,
            headerMargin: const EdgeInsets.only(bottom: 10),
            titleTextFormatter: (date, locale) =>
                DateFormat(widget.titleTextFormatter).format(date),
            titleTextStyle: widget.titleTextStyle ??
                context.subtitle1.copyWith(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w900,
                ),
            leftChevronIcon: const Icon(
              Icons.chevron_left,
            ),
            rightChevronIcon: const Icon(
              Icons.chevron_right,
            ),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1.0,
                  color: Color(0xff979797),
                ),
              ),
            ),
          ),
          daysOfWeekStyle: DaysOfWeekStyle(
            dowTextFormatter: (date, locale) {
              return DateFormat('E').format(date);
            },
            weekendStyle: context.bodyText2.copyWith(
              fontSize: 10.sp,
              color: AppTheme.redText,
              fontWeight: FontWeight.w800,
            ),
            weekdayStyle: context.bodyText2.copyWith(
              fontSize: 10.sp,
              color: AppTheme.subtitleColor,
              fontWeight: FontWeight.w800,
            ),
          ),
          onPageChanged: widget.onPageChanged,
          calendarBuilders: CalendarBuilders(
            selectedBuilder: widget.selectedBuilder,
            todayBuilder: widget.toDateBuilder,
          ),
          calendarStyle: CalendarStyle(
            rangeHighlightColor: context.primary,
            cellMargin: widget.cellMargin ?? const EdgeInsets.all(10),
            rangeEndDecoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(4),
            ),
            holidayDecoration: widget.isWeekFormat
                ? BoxDecoration(
                    color: context.background,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: context.onBackground,
                    ),
                  )
                : boxRectangle,
            outsideDecoration: widget.isWeekFormat
                ? BoxDecoration(
                    color: context.background,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: context.onBackground,
                    ),
                  )
                : boxRectangle,
            weekendDecoration: widget.isWeekFormat
                ? BoxDecoration(
                    color: context.background,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: context.onBackground,
                    ),
                  )
                : boxRectangle,
            selectedDecoration: widget.isWeekFormat
                ? BoxDecoration(
                    color: context.background,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: context.primary,
                    ),
                  )
                : BoxDecoration(
                    color: context.primary,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(4),
                  ),
            defaultDecoration: widget.isWeekFormat
                ? BoxDecoration(
                    color: context.background,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: context.onBackground,
                    ),
                  )
                : boxRectangle,
            disabledDecoration: widget.isWeekFormat
                ? BoxDecoration(
                    color: context.background,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: context.dividerColor,
                    ),
                  )
                : boxRectangle,
            markerDecoration: widget.isWeekFormat
                ? BoxDecoration(
                    color: context.background,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: context.onBackground,
                    ),
                  )
                : boxRectangle,
            todayDecoration: widget.isWeekFormat
                ? BoxDecoration(
                    color: context.background,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: context.onBackground,
                    ),
                  )
                : BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: context.primary),
                  ),
            selectedTextStyle: context.bodyText1.copyWith(
              fontSize: 10.sp,
              fontWeight: FontWeight.w800,
              color: widget.isWeekFormat ? context.primary : null,
            ),
            todayTextStyle: context.caption.copyWith(
              fontSize: 10.sp,
              fontWeight: FontWeight.w800,
            ),
            outsideTextStyle: context.caption.copyWith(
              fontSize: 10.sp,
              color: widget.isWeekFormat
                  ? context.onBackground
                  : const Color(0xff979797),
              fontWeight: FontWeight.w800,
            ),
            weekendTextStyle: context.bodyText2.copyWith(
              fontSize: 10.sp,
              fontWeight: FontWeight.w800,
            ),
            defaultTextStyle: context.bodyText2.copyWith(
              fontSize: 10.sp,
              fontWeight: FontWeight.w800,
            ),
            disabledTextStyle: context.caption.copyWith(
              fontSize: 10.sp,
              color: context.dividerColor,
              fontWeight: FontWeight.w800,
            ),
            holidayTextStyle: context.bodyText2.copyWith(
              fontSize: 10.sp,
              color: context.dividerColor,
              fontWeight: FontWeight.w800,
            ),
          ),
          rangeStartDay: widget.rangeStartDay,
          rangeEndDay: widget.rangeEndDay,
          firstDay: widget.firstDay,
          lastDay: widget.lastDay,
          focusedDay: widget.isActiveSelected
              ? widget.focusedDay ?? DateTime.now()
              : widget.firstDay,
        ),
      ),
    );
  }
}
