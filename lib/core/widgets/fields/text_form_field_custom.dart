import 'package:flutter/material.dart';
import 'package:task_hub/core/enums/enums.dart';

class TextFormFieldCustom extends StatelessWidget {
  const TextFormFieldCustom({
    required this.controller,
    this.label,
    this.validator,
    this.onChanged,
    this.requiredInput = false,
    this.enabled = true,
    super.key,
  });

  final TextEditingController controller;
  final String? label;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
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
          controller: controller,
          onChanged: onChanged,
          validator: validator ??
              (requiredInput
                  ? (value) {
                      if (value == null || value.isEmpty) {
                        return 'error';
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
            errorMaxLines: 1,
            errorStyle: TextStyle(
              color: Colors.transparent,
              fontSize: 0,
            ),
          ),
        ),
      ],
    );
  }
}
