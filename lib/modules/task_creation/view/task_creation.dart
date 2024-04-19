import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/instance_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:task_hub/modules/task_creation/controller/task_creation_cubit.dart';

class TaskCreationPage extends StatelessWidget {
  const TaskCreationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TaskCreationCubit>();

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Text('TaskCreation'),
            BlocBuilder<TaskCreationCubit, TaskCreationState>(
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
              onPressed: () {
                context.pop();
              },
              child: const Text('Back'),
            ),
            TextButton(
              onPressed: controller.setNewValue,
              child: const Text('change'),
            ),
          ],
        ),
      ),
    );
  }
}
