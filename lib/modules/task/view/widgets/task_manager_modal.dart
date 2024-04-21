import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/instance_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:task_hub/core/enums/enums.dart';
import 'package:task_hub/core/styles/styles.dart';
import 'package:task_hub/core/widgets/buttons/app_primary_button.dart';
import 'package:task_hub/core/widgets/dialogs/dialogs.dart';
import 'package:task_hub/core/widgets/fields/text_form_field_custom.dart';
import 'package:task_hub/modules/task/controller/task_manager_cubit.dart';
import 'package:task_hub/modules/task/view/widgets/data_picker.dart';
import 'package:task_hub/modules/task/view/widgets/priority_picker.dart';

enum ManagerModal { creation, edition }

Future<void> showTaskManagerModal(
  BuildContext context,
  ManagerModal type,
) async {
  final controller = Get.find<TaskManagerCubit>();
  final formKey = GlobalKey<FormState>();
  final isCreation = type == ManagerModal.creation;

  await showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return BlocBuilder<TaskManagerCubit, TaskManagerState>(
        bloc: controller,
        builder: (context, state) {
          return Column(
            children: <Widget>[
              const SizedBox(height: EnumPaddings.x2Half),
              Container(
                width: 80,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(
                    EnumPaddings.x1,
                  ),
                ),
              ),
              const SizedBox(height: EnumPaddings.x3Half),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: EnumPaddings.x4,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: EnumPaddings.x1Half),
                        Text(
                          isCreation ? 'Nova tarefa' : 'Editar tarefa',
                          style: AppTextStyles.h6.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (!isCreation) ...[
                          const Spacer(),
                          IconButton(
                            onPressed: () async {
                              showAlertDialog(
                                context: context,
                                onAccept: () async {
                                  await controller.deleteTask();

                                  if (context.mounted) {
                                    context.pop();
                                  }
                                },
                                title: 'Alerta',
                                content:
                                    'Tem certeza que deseja excluir a tarefa?',
                              );
                            },
                            iconSize: 26,
                            icon: const Icon(
                              CupertinoIcons.trash_fill,
                              color: AppColors.error,
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: EnumPaddings.x1),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormFieldCustom(
                            label: 'Título',
                            controller: controller.title,
                            onChanged: (value) => controller.checkButtonState(),
                            requiredInput: true,
                          ),
                          const SizedBox(height: EnumPaddings.x1),
                          DataPicker(type: type),
                          const SizedBox(height: EnumPaddings.x1),
                          TextFormFieldCustom(
                            label: 'Descrição',
                            controller: controller.description,
                            onChanged: (value) => controller.checkButtonState(),
                            requiredInput: true,
                          ),
                          const SizedBox(height: EnumPaddings.x1),
                          PriorityPicker(type: type),
                        ],
                      ),
                    ),
                    const SizedBox(height: EnumPaddings.x3),
                    AppPrimaryButton(
                      label: isCreation ? 'Criar nova tarefa' : 'Salvar',
                      onTap: () async {
                        if (isCreation) {
                          await controller.createTask();
                        } else {
                          await controller.editTask();
                        }
                        if (context.mounted) {
                          context.pop();
                        }
                      },
                      disabled: state.buttonDisabled,
                      disableFunction: () {
                        formKey.currentState?.validate();
                      },
                    ),
                    const SizedBox(height: EnumPaddings.x3),
                  ],
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
