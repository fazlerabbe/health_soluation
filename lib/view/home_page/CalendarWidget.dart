import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
class CalendarWidget extends StatelessWidget {
  const CalendarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 150,
      child: TableCalendar(
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),
          weekendStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),
          // dowTextFormatter:
        ),
        daysOfWeekHeight: 30,
        headerVisible: false,
        daysOfWeekVisible: true,
        // rowHeight: 2,
        calendarStyle: CalendarStyle(
          defaultTextStyle: TextStyle(color: Colors.white,),
          outsideTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),
          holidayTextStyle: TextStyle(color: Colors.white),
          weekendTextStyle: TextStyle(color: Colors.white),
        ),
        focusedDay: DateTime.now(),
        firstDay: DateTime.utc(2010),
        lastDay: DateTime.utc(2030),
        startingDayOfWeek: StartingDayOfWeek.sunday,
        calendarFormat: CalendarFormat.week,

        calendarBuilders: CalendarBuilders(
          dowBuilder: (context, day) {
            // return Container(
            //   // color: Colors.yellow,
            //   child: Text("${_formatDayOfWeek(day.day-5)}",style: TextStyle(color: Colors.white),),
            // );
          },

        ),
      ),
    );
  }
}


//todo------------------------------
// TimelineCalendar(
//
//   calendarType: CalendarType.GREGORIAN,
//   calendarLanguage: "en",
//   calendarOptions: CalendarOptions(
//     viewType: ViewType.DAILY,
//
//     headerMonthShadowColor: Colors.black26,
//     headerMonthBackColor: Colors.transparent,
//   ),
//   dayOptions: DayOptions(compactMode: true,weekDaySelectedColor: const Color(0xff3AC3E2)),
//   headerOptions: HeaderOptions(
//
//       weekDayStringType: WeekDayStringTypes.SHORT,
//       // monthStringType: MonthStringTypes.FULL,
//       // backgroundColor: const Color(0xff3AC3E2),
//       headerTextColor: Colors.black
//
//   ),
//
//   onChangeDateTime: (datetime) {
//     print(datetime.getDate());
//   },
//
// ),