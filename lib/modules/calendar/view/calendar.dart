import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/instance_manager.dart';
import 'package:task_hub/modules/calendar/controller/calendar_cubit.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CalendarCubit>();

    return Column(
      children: [
        const Text('Calendar'),
        BlocBuilder<CalendarCubit, CalendarState>(
          bloc: controller,
          builder: (context, state) {
            return RichText(
              text: TextSpan(
                text: 'Texto controler: ',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                ),
                children: [
                  TextSpan(
                    text: state.testText,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        TextButton(
          onPressed: controller.setNewValue,
          child: const Text('change'),
        ),
      ],
    );
  }
}
