import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

void showAlertDialog({
  required BuildContext context,
  required Future<void> Function() onAccept,
  required String title,
  required String content,
}) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      insetAnimationCurve: Curves.linear,
      insetAnimationDuration: const Duration(seconds: 1),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            context.pop(context);
          },
          child: const Text('Não'),
        ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: () async {
            await onAccept.call();

            if (context.mounted) {
              context.pop(context);
            }
          },
          child: const Text('Sim'),
        ),
      ],
    ),
  );
}
