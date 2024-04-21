import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:task_hub/l10n/l10n.dart';
import 'package:task_hub/modules/task/controller/task_manager_cubit.dart';
import 'package:task_hub/modules/task/view/widgets/task_card.dart';

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
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: state.tasks.length,
                itemBuilder: (context, index) {
                  final task = state.tasks[index];

                  return TaskCard(
                    task: task,
                    index: index,
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
