import 'package:flutter/material.dart';
import 'package:task_hub/core/widgets/page/page.dart';
import 'package:task_hub/l10n/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return StandartStructure(
      child: Column(
        children: [
          Text(l10n.homeTitle),
        ],
      ),
    );
  }
}
