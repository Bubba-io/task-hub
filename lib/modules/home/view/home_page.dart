import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:task_hub/core/enums/paddings.dart';
import 'package:task_hub/core/widgets/app_bar/app_bar.dart';
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
        return const Column(
          children: [
            TopBar(),
            SizedBox(height: EnumPaddings.x3),
            TaskTabViewer(),
          ],
        );
      },
    );
  }
}
