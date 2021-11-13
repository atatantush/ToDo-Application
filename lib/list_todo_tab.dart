import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:to_do_application/ToDoWidget.dart';
import 'package:to_do_application/data/FireStoreUtils.dart';
import 'package:to_do_application/data/ToDo.dart';

class ListToDoTab extends StatefulWidget {
  @override
  State<ListToDoTab> createState() => _ListToDoTabState();
}

class _ListToDoTabState extends State<ListToDoTab> {
  DateTime selectedDay = DateTime.now();

  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          TableCalendar(
            selectedDayPredicate: (day) {
              return isSameDay(day, selectedDay);
            },
            onDaySelected: (sDay, fDay) {
              setState(() {
                selectedDay = sDay;
                focusedDay = fDay; // update `_focusedDay` here as well
              });
            },
            calendarFormat: CalendarFormat.week,
            focusedDay: focusedDay,
            firstDay: DateTime.now().subtract(Duration(days: 365)),
            lastDay: DateTime.now().add(Duration(days: 365)),
            calendarStyle: CalendarStyle(
              selectedTextStyle: TextStyle(color: Colors.white),
              selectedDecoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              todayTextStyle: TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(15),
              ),
              defaultDecoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            weekendDays: [],
            daysOfWeekStyle: DaysOfWeekStyle(
              // decoration for days on the top
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              weekdayStyle: TextStyle(color: Colors.black), // days color.
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot<ToDo>>(
                stream: get_ToDo_Collection_With_Converter().snapshots(),
                builder: (BuildContext buildContext,
                    AsyncSnapshot<QuerySnapshot<ToDo>> snapshot) {
                  if (snapshot.hasError) {
                    // has error
                    return Center(child: Text(snapshot.error.toString()));
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    // loading
                    return Center(child: CircularProgressIndicator());
                  }

                  // data is ready
                  List<ToDo> items = snapshot.data!.docs
                      .map((element) => element.data())
                      .toList();
                  return ListView.builder(
                    itemBuilder: (BuildContext, index) {
                      return TodoWidget(items[index]);
                    },
                    itemCount: items.length,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
