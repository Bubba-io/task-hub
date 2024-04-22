import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:task_hub/core/enums/enums.dart';
import 'package:task_hub/core/widgets/animations/empty_animation.dart';
import 'package:task_hub/core/widgets/app_bar/app_bar.dart';
import 'package:task_hub/modules/calendar/utils/date_checker.dart';
import 'package:task_hub/modules/calendar/view/widgets/calendar_widget.dart';
import 'package:task_hub/modules/home/view/widgets/filter_picker.dart';
import 'package:task_hub/modules/task/controller/task_manager_cubit.dart';
import 'package:task_hub/modules/task/models/models.dart';
import 'package:task_hub/modules/task/view/widgets/task_card.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TaskManagerCubit>();

    return BlocBuilder<TaskManagerCubit, TaskManagerState>(
      bloc: controller,
      builder: (context, state) {
        final appointments = _genAppointment(state);
        final taskFiltered = _genFilteredList(state, controller);

        return Column(
          children: [
            const TopBar(),
            const SizedBox(height: EnumPaddings.x4),
            CalendarWidget(
              controller: controller,
              appointments: appointments,
            ),
            if (taskFiltered.isNotEmpty) ...[
              const Padding(
                padding: EdgeInsets.only(
                  top: EnumPaddings.x2,
                  bottom: EnumPaddings.x1,
                ),
                child: FilterPicker(),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: taskFiltered.length,
                  itemBuilder: (context, index) {
                    final task = taskFiltered[index];

                    return TaskCard(
                      task: task,
                    );
                  },
                ),
              ),
            ] else ...[
              const Expanded(
                child: SingleChildScrollView(
                  child: EmptyAnimation(
                    resolved: false,
                    imageHeigth: 200,
                    paddingValue: 180,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }

  List<Appointment> _genAppointment(TaskManagerState state) {
    final res = <Appointment>[];

    for (final task in state.tasks) {
      if (!task.resolved) {
        res.add(
          Appointment(
            startTime: task.date,
            endTime: task.date,
            color: task.priorityColor,
          ),
        );
      }
    }

    return res;
  }

  List<TaskModel> _genFilteredList(
    TaskManagerState state,
    TaskManagerCubit controller,
  ) {
    return state.tasks
        .where(
          (element) =>
              dateChecker(
                state.calendarFilter,
                element.date,
              ) &&
              !element.resolved,
        )
        .toList()
      ..sort((a, b) => controller.filter(a, b));
  }
}
