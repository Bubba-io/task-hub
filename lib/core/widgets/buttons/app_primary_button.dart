import 'package:flutter/material.dart';
import 'package:task_hub/core/styles/styles.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    required this.label,
    this.onTap,
    this.disableFunction,
    this.disabled = false,
    super.key,
  });

  final String label;
  final void Function()? onTap;
  final void Function()? disableFunction;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    final primaryColor = disabled
        ? AppColors.black.withOpacity(0.2)
        : AppColors.black.withOpacity(0.9);
    final splashColor =
        disabled ? Colors.transparent : AppColors.black.withOpacity(0.9);
    final textColor =
        disabled ? AppColors.black.withOpacity(0.4) : AppColors.white;

    return Material(
      color: primaryColor,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        height: 48,
        child: InkWell(
          highlightColor: splashColor,
          splashColor: splashColor,
          onTap: disabled ? disableFunction : onTap,
          child: Center(
            child: Text(
              label,
              style: AppTextStyles.button.copyWith(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
