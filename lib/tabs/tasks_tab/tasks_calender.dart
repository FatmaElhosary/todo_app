import 'package:flutter/material.dart';
import 'package:flutter_timeline_calendar/timeline/model/calendar_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/day_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/headers_options.dart';
import 'package:flutter_timeline_calendar/timeline/utils/calendar_types.dart';
import 'package:flutter_timeline_calendar/timeline/widget/timeline_calendar.dart';

class TasksCalender extends StatelessWidget {
  const TasksCalender({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return TimelineCalendar(
      calendarType: CalendarType.GREGORIAN,
      calendarLanguage: "en",
      calendarOptions: CalendarOptions(
        viewType: ViewType.DAILY,
        font: 'Roboto',
        toggleViewType: false,
        headerMonthElevation: 0,
        headerMonthShadowColor: Colors.transparent,
        headerMonthBackColor: Colors.transparent,
      ),
      dayOptions: DayOptions(
        compactMode: true,
        weekDaySelectedColor: theme.colorScheme.primary,
        selectedBackgroundColor: theme.colorScheme.primary,
        // weekDayUnselectedColor: theme.colorScheme.onPrimaryContainer,
        disableDaysBeforeNow: false,
      ),
      headerOptions: HeaderOptions(
          weekDayStringType: WeekDayStringTypes.SHORT,
          monthStringType: MonthStringTypes.FULL,
          backgroundColor: theme.colorScheme.primary,
          headerTextColor: theme.colorScheme.primaryContainer,
          navigationColor: theme.colorScheme.primaryContainer,
          resetDateColor: theme.colorScheme.primaryContainer),
      onChangeDateTime: (datetime) {
        //  print(datetime.getDate());
      },
    );
  }
}
