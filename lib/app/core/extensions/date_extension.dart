import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String get displayDate => DateFormat('dd/MM/yyyy').format(this);
  String get displayDateTime => DateFormat.yMMMMd().add_Hms().format(this);
  String get displayYearFirst => DateFormat('yyyy / MM / dd').format(this);
  String get displayTime => DateFormat('HH:mm').format(this);

  static bool isSameDay(DateTime dateFirst, {DateTime? dateSecond}) {
    dateSecond = dateSecond ?? DateTime.now();
    return dateFirst.day == dateSecond.day &&
        dateFirst.month == dateSecond.month &&
        dateFirst.year == dateSecond.year;
  }

  static int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }
}

extension GetMoney on int {
  String get priceString {
    final numberString = toString();
    final numberDigits = List.from(numberString.split(''));
    int index = numberDigits.length - 3;
    while (index > 0) {
      numberDigits.insert(index, ',');
      index -= 3;
    }
    return numberDigits.join();
  }
}
