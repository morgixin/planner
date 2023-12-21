import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:planner/pages/widgets/NewEvent.dart';
import 'package:planner/pages/widgets/Profile.dart';
import 'package:planner/pages/widgets/Next.dart';
import 'package:planner/pages/widgets/Dashboard.dart';
import 'package:planner/pages/widgets/Concluded.dart';

import '../model/User.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key, this.user}) : super(key: key);
  final User? user;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = 0;
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          // toolbarHeight: 140,
          foregroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
          ),
        ),
        body: Container(
            padding: const EdgeInsets.only(top: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
            ),
            child: TableCalendar(
              rowHeight: 40,
              headerStyle:
                  HeaderStyle(formatButtonVisible: false, titleCentered: true),
              focusedDay: today,
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              onDaySelected: _onDaySelected,
              firstDay: DateTime.utc(2010, 12, 01),
              lastDay: DateTime.utc(2050, 10, 12),
              calendarStyle: CalendarStyle(outsideDaysVisible: false),
            )));
  }
}
