import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'calendar_data.dart';
import 'tabs.dart';

void main() => runApp(AgendaViewCustomization());

class AgendaViewCustomization extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomAgenda(),
    );
  }
}

class CustomAgenda extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScheduleExample();
}

class ScheduleExample extends State<CustomAgenda> {
  List<Appointment> appointmentDetails = <Appointment>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SfCalendar(
                initialDisplayDate: DateTime.now(),
                view: CalendarView.month,
                dataSource: getCalendarDataSource(),
                onTap: (v) {
                  calendarTapped(v);

                  setState(() {});
                },
                initialSelectedDate: DateTime.now(),
              ),
            ),
            Expanded(
              child: Tabs(appointmentDetails: appointmentDetails),
            ),
          ],
        ),
      ),
    );
  }

//todo:  missing initial event showUp.
  void calendarTapped(CalendarTapDetails calendarTapDetails) {
    if (calendarTapDetails.targetElement == CalendarElement.calendarCell) {
      final result = calendarTapDetails.appointments!.cast<Appointment>();

      setState(() {
        appointmentDetails = result;
      });
    }
  }
}
