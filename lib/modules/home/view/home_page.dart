import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_hub/core/enums/routes.dart';
import 'package:task_hub/l10n/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(l10n.homeTitle),
            TextButton(
              onPressed: () {
                context.push(EnumRoutes.taskCreation);
              },
              child: const Text('GO'),
            ),
          ],
        ),
      ),
    );
  }
}
