import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:task_hub/core/styles/styles.dart';
import 'package:task_hub/modules/calendar/model/appointment_data_source.dart';
import 'package:task_hub/modules/task/controller/task_manager_cubit.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({
    required this.controller,
    required this.appointments,
    super.key,
  });

  final TaskManagerCubit controller;
  final List<Appointment> appointments;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12), // Raio de borda para o ClipRRect
      child: SfCalendar(
        todayHighlightColor: Colors.grey.shade200,
        todayTextStyle: const TextStyle(color: AppColors.black),
        view: CalendarView.month,
        cellBorderColor: Colors.transparent,
        showNavigationArrow: true,
        showTodayButton: true,
        backgroundColor: Colors.grey.shade200,
        viewHeaderStyle: ViewHeaderStyle(
          backgroundColor: AppColors.black.withOpacity(0.4),
        ),
        headerStyle: CalendarHeaderStyle(
          textAlign: TextAlign.center,
          backgroundColor: AppColors.black,
          textStyle: AppTextStyles.h6.copyWith(
            color: AppColors.white,
          ),
        ),
        onTap: (CalendarTapDetails details) {
          controller.setCalendarFilter(details.date!);
        },
        dataSource: AppointmentDataSource(appointments),
      ),
    );
  }
}
