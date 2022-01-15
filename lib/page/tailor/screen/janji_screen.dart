import 'package:flutter/material.dart';
import 'package:jait_jait/components/const/color.dart';
import 'package:table_calendar/table_calendar.dart';

class JanjiTemuScreen extends StatefulWidget {
  JanjiTemuScreen({Key? key}) : super(key: key);

  @override
  State<JanjiTemuScreen> createState() => _JanjiTemuScreenState();
}

class _JanjiTemuScreenState extends State<JanjiTemuScreen> {
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOn;
  DateTime _focusedDay = DateTime.now();

  DateTime? _selectedDay;

  DateTime? _rangeStart;

  DateTime? _rangeEnd;

  final kToday = DateTime.now();
  DateTime? kFirstDay;
  DateTime? kLastDay;

  @override
  void initState() {
    kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
    kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: TableCalendar(
        firstDay: kFirstDay!,
        lastDay: kLastDay!,
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        rangeStartDay: _rangeStart,
        rangeEndDay: _rangeEnd,
        calendarStyle: const CalendarStyle(
            selectedDecoration: BoxDecoration(
          color: primaryColor,
        )),
        calendarFormat: CalendarFormat.week,
        rangeSelectionMode: _rangeSelectionMode,
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
              _rangeStart = null; // Important to clean those
              _rangeEnd = null;
              _rangeSelectionMode = RangeSelectionMode.toggledOff;
            });
          }
        },
        onRangeSelected: (start, end, focusedDay) {
          setState(() {
            _selectedDay = null;
            _focusedDay = focusedDay;
            _rangeStart = start;
            _rangeEnd = end;
            _rangeSelectionMode = RangeSelectionMode.toggledOn;
          });
        },
        headerStyle: const HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
        ),
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}
