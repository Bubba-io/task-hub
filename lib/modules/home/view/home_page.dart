import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:task_hub/core/enums/paddings.dart';
import 'package:task_hub/core/styles/app_text_styles.dart';
import 'package:task_hub/modules/home/view/widgets/task_tab_viewer.dart';
import 'package:task_hub/modules/task/controller/task_manager_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TaskManagerCubit>();

    return BlocBuilder<TaskManagerCubit, TaskManagerState>(
      bloc: controller,
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: EnumPaddings.x2),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Seja bem vindo!',
                    style: AppTextStyles.h5.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Este é seu espaço de organização de tarefas',
                    style: AppTextStyles.subtitle1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: EnumPaddings.x3),
            const TaskTabViewer(),
          ],
        );
      },
    );
  }
}
