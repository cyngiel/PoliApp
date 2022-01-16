import 'dart:collection';

import 'package:table_calendar/table_calendar.dart';

/// Example event class.
class Event {
  final String title;
  final String time;
  final String date;
  final String description;
  final String localization;

  Event({required this.title, required this.time, required this.date, required this.localization, required this.description});

  Event.basicEvent(this.title): description = 'brak opisu', time = 'brak czasu', date = 'brak daty', localization = 'brak lokalizacji';

  @override
  String toString() => title + ' | ' + time;
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
    value: (item) => List.generate(
        item % 4 + 1, (index) => Event.basicEvent('Event $item | ${index + 1}')))
  ..addAll({
    kToday: [
      Event.basicEvent('ff\'s Event 1'),
      Event.basicEvent('Today\'s Event 2'),
    ],
    kNextDay: [
      Event(title: 'Ciekawe spotkanie', date: getDateString(kNextDay) , time: '15:15', localization: 'CTI 308', description: 'Niesamowicie ciekawe spotkanie na tematy niesaoowicie ciekawe i  wyczekiwane opis opis opis opis'),
      Event.basicEvent('Rektor oprowadza'),
    ],

  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

String getDateString(DateTime dateTime){
  String date = dateTime.day.toString();

  switch(dateTime.month){
    case 1: date += " sty ";
      break;
    case 2: date += " lut ";
      break;
    case 3: date += " mar ";
      break;
    case 4: date += " kwi ";
      break;
    case 5: date += " maj ";
      break;
    case 6: date += " cze ";
      break;
    case 7: date += " lip ";
    break;
    case 8: date += " sie ";
    break;
    case 9: date += " wrz ";
    break;
    case 10: date += " paź ";
    break;
    case 11: date += " lis ";
    break;
    case 12: date += " gru ";
    break;

  }

  date += dateTime.year.toString();

  return date;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
        (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

final kNextDay = DateTime(kToday.year, kToday.month, kToday.day + 1);