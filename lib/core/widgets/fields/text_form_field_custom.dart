import 'package:flutter/material.dart';
import 'package:task_hub/core/enums/enums.dart';

class TextFormFieldCustom extends StatelessWidget {
  const TextFormFieldCustom({
    this.label,
    this.validator,
    this.requiredInput = false,
    this.enabled = true,
    super.key,
  });

  final String? label;
  final String? Function(String?)? validator;
  final bool requiredInput;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (label != null) ...[
          Row(
            children: [
              const SizedBox(width: EnumPaddings.x1),
              Text(label!),
            ],
          ),
          const SizedBox(height: EnumPaddings.x1),
        ],
        TextFormField(
          enabled: enabled,
          validator: validator ??
              (requiredInput
                  ? (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obrigatório';
                      }

                      return null;
                    }
                  : null),
          decoration: const InputDecoration(
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: EnumPaddings.x2,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ),
      ],
    );
  }
}
