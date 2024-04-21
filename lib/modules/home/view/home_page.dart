import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:task_hub/core/enums/paddings.dart';
import 'package:task_hub/core/styles/app_colors.dart';
import 'package:task_hub/core/styles/app_text_styles.dart';
import 'package:task_hub/modules/task/controller/task_manager_cubit.dart';
import 'package:task_hub/modules/task/view/widgets/task_card.dart';

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
            const SizedBox(height: EnumPaddings.x2),
            const TaskTabViewer(),
          ],
        );
      },
    );
  }
}

class TaskTabViewer extends StatelessWidget {
  const TaskTabViewer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TaskManagerCubit>();

    return BlocBuilder<TaskManagerCubit, TaskManagerState>(
      bloc: controller,
      builder: (context, state) {
        return Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  _createButton(state: state, label: 'TO DO', index: 0),
                  _createButton(
                    state: state,
                    label: 'CONCLUÍDAS',
                    index: 1,
                    right: true,
                  ),
                ],
              ),
              const SizedBox(height: EnumPaddings.x2),
              if (state.tabSelected == 0) ...[
                _buildList(state: state, resolved: false),
              ] else ...[
                _buildList(state: state, resolved: true),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildList({required TaskManagerState state, required bool resolved}) {
    final list = state.tasks
        .where((element) => resolved ? element.resolved : !element.resolved)
        .toList();

    return Expanded(
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          final task = list[index];

          return TaskCard(
            task: task,
            index: index,
            resolved: resolved,
          );
        },
      ),
    );
  }

  Widget _createButton({
    required TaskManagerState state,
    required String label,
    required int index,
    bool right = false,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: state.tabSelected == index
            ? null
            : () => Get.find<TaskManagerCubit>().changeTab(),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: EnumPaddings.x2Half),
          decoration: BoxDecoration(
            color: state.tabSelected == index
                ? AppColors.black
                : AppColors.black.withOpacity(0.1),
            borderRadius: right
                ? const BorderRadiusDirectional.only(
                    topEnd: Radius.circular(8),
                    bottomEnd: Radius.circular(8),
                  )
                : const BorderRadiusDirectional.only(
                    topStart: Radius.circular(8),
                    bottomStart: Radius.circular(8),
                  ),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: AppTextStyles.button.copyWith(
              color: state.tabSelected == index
                  ? AppColors.white
                  : AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
