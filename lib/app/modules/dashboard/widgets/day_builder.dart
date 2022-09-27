import '../../../core/styles/style.dart';

class DayBuilder extends StatelessWidget {
  const DayBuilder({
    Key? key,
    required this.date,
    this.selected = false,
  }) : super(key: key);
  final String date;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 24.h,
        width: 24.w,
        decoration: BoxDecoration(
          color: selected ? context.primary : Colors.transparent,
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
          border: Border.all(
            color: context.primary,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          date,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
