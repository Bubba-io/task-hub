import 'package:flutter/material.dart';
import 'package:task_hub/l10n/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      children: [
        Text(l10n.homeTitle),
        GestureDetector(
          onTap: () async {},
          child: Container(
            height: 100,
            width: 100,
            color: Colors.purple,
          ),
        ),
      ],
    );
  }
}
