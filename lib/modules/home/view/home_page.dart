import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:task_hub/l10n/l10n.dart';
import 'package:task_hub/modules/task-creation/controller/task_manager_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final controller = Get.find<TaskManagerCubit>();

    return BlocBuilder<TaskManagerCubit, TaskManagerState>(
      bloc: controller,
      builder: (context, state) {
        return Column(
          children: [
            Text(l10n.homeTitle),
            GestureDetector(
              onTap: () async {
                await Get.find<TaskManagerCubit>().loadTasks();
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.pinkAccent,
              ),
            ),
            const SizedBox(height: 100),
            Expanded(
              child: ListView.builder(
                itemCount: state.tasks.length,
                itemBuilder: (context, index) {
                  final task = state.tasks[index];

                  return Row(
                    children: [Text(task.title)],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
