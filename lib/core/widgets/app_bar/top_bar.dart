import 'package:flutter/material.dart';
import 'package:task_hub/core/enums/enums.dart';
import 'package:task_hub/core/styles/styles.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
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
      ],
    );
  }
}
