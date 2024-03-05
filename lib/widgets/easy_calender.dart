import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/settings_provider.dart';
import 'package:todo_app/providers/tasks_provider.dart';
import 'package:todo_app/shared/shared.dart';

class EasyCalender extends StatefulWidget {
  const EasyCalender({super.key});

  @override
  State<EasyCalender> createState() => _EasyCalenderState();
}

class _EasyCalenderState extends State<EasyCalender> {
  final EasyInfiniteDateTimelineController _controller =
      EasyInfiniteDateTimelineController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TasksProvider>(context);
    var theme = Theme.of(context);
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ColoredBox(
          color: Theme.of(context).colorScheme.primary,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .13,
            width: double.infinity,
          ),
        ),
        EasyInfiniteDateTimeLine(
          controller: _controller,
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          focusDate: provider.currentDate,
          lastDate: DateTime.now().add(const Duration(days: 365)),
          headerBuilder: (context, date) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  dateFormat.format(date),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                ),
                IconButton(
                    onPressed: () {
                       provider.changeSelectedDate(DateTime.now());
                      _controller.animateToDate(provider.currentDate);
                    },
                    icon: Icon(
                      Icons.restart_alt_rounded,
                      color: Theme.of(context).colorScheme.primaryContainer,
                      size: 35,
                    )),
              ],
            );
          },
          locale: Provider.of<SettingsProvider>(context).appLanguage,
          dayProps: EasyDayProps(
            todayStyle: DayStyle(
                dayNumStyle: theme.textTheme.headlineSmall,
                dayStrStyle: theme.textTheme.headlineSmall,
                monthStrStyle: theme.textTheme.headlineSmall,
                decoration: BoxDecoration(
                    color: theme.colorScheme.onErrorContainer,
                    borderRadius: BorderRadius.circular(5))),
            width: MediaQuery.of(context).size.width * .2,
            inactiveDayStyle: DayStyle(
                dayNumStyle: theme.textTheme.headlineSmall,
                dayStrStyle: theme.textTheme.headlineSmall,
                monthStrStyle: theme.textTheme.headlineSmall,
                decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(5))),
            activeDayStyle: DayStyle(
                dayNumStyle: theme.textTheme.headlineSmall!
                    .copyWith(color: theme.colorScheme.primary),
                dayStrStyle: theme.textTheme.headlineSmall!
                    .copyWith(color: theme.colorScheme.primary),
                monthStrStyle: theme.textTheme.headlineSmall!
                    .copyWith(color: theme.colorScheme.primary),
                decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(5))),
          ),
          timeLineProps: const EasyTimeLineProps(
            separatorPadding: 20, // padding between days
          ),
          showTimelineHeader: true,
          onDateChange: (selectedDate) {
            provider.changeSelectedDate(selectedDate);
          },
        ),

        /*      EasyDateTimeLine(
          initialDate: provider.currentDate,
          onDateChange: (selectedDate) {
            setState(() {
              provider.changeSelectedDate(selectedDate);
            });
          },
          headerProps: EasyHeaderProps(
            dateFormatter: const DateFormatter.custom('yyyy'),
            monthPickerType: MonthPickerType.switcher,
            monthStyle: TextStyle(
              color: theme.colorScheme.primaryContainer,
            ),
            selectedDateStyle: TextStyle(
              color: theme.colorScheme.primaryContainer,
            ),
          ),
          dayProps: EasyDayProps(
            width: 100,
            inactiveDayStyle: DayStyle(
                decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(5))),
            activeDayStyle: DayStyle(
                decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(5))),
          ),
        )
       */
      ],
    );
  }
}
