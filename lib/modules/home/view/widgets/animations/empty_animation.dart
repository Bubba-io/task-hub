import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task_hub/core/styles/styles.dart';

class EmptyAnimation extends StatelessWidget {
  const EmptyAnimation({
    required this.resolved,
    super.key,
  });

  final bool resolved;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Lottie.asset('assets/animations/ghost.json', height: 300),
        Padding(
          padding: const EdgeInsets.only(top: 300),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  textAlign: TextAlign.center,
                  resolved
                      ? 'Você ainda não completou nenhuma tarefa'
                      : '''Tudo limpo por aqui, que tal adicionar uma tarefa?''',
                  style: AppTextStyles.h5.copyWith(
                    color: AppColors.black.withOpacity(
                      0.7,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
