import 'package:flutter/material.dart';
import 'package:task_hub/core/enums/enums.dart';
import 'package:task_hub/core/styles/styles.dart';
import 'package:task_hub/core/widgets/buttons/app_primary_button.dart';
import 'package:task_hub/core/widgets/fields/text_form_field_custom.dart';
import 'package:task_hub/modules/task-creation/view/widgets/data_picker.dart';
import 'package:task_hub/modules/task-creation/view/widgets/priority_picker.dart';

Future<void> showTaskCreationModal(BuildContext context) async {
  await showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
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
                      'Criar nova tarefa',
                      style: AppTextStyles.h6.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: EnumPaddings.x1),
                const Form(
                  child: Column(
                    children: [
                      TextFormFieldCustom(
                        label: 'Título',
                        requiredInput: true,
                      ),
                      SizedBox(height: EnumPaddings.x1),
                      DataPicker(),
                      SizedBox(height: EnumPaddings.x1),
                      TextFormFieldCustom(
                        label: 'Descrição',
                        requiredInput: true,
                      ),
                      SizedBox(height: EnumPaddings.x1),
                      PriorityPicker(),
                    ],
                  ),
                ),
                const SizedBox(height: EnumPaddings.x3),
                const AppPrimaryButton(label: 'Criar nova tarefa'),
                const SizedBox(height: EnumPaddings.x3),
              ],
            ),
          ),
        ],
      );
    },
  );
}
