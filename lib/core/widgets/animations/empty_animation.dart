import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task_hub/core/styles/styles.dart';

class EmptyAnimation extends StatelessWidget {
  const EmptyAnimation({
    required this.resolved,
    this.alignment,
    this.imageHeigth,
    this.paddingValue,
    super.key,
  });

  final bool resolved;
  final AlignmentGeometry? alignment;
  final double? imageHeigth;
  final double? paddingValue;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: alignment ?? Alignment.center,
      children: [
        Lottie.asset(
          'assets/animations/ghost.json',
          height: imageHeigth ?? 300,
        ),
        Padding(
          padding: EdgeInsets.only(top: paddingValue ?? 300),
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
