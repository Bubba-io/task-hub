import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_hub/core/enums/enums.dart';

class BottomAppBarCustom extends StatelessWidget {
  const BottomAppBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const AutomaticNotchedShape(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          IconButton(
            iconSize: 40,
            icon: const Icon(
              CupertinoIcons.home,
            ),
            onPressed: () {
              context.go(EnumRoutes.home);
            },
          ),
          const Spacer(flex: 6),
          IconButton(
            iconSize: 42,
            icon: const Icon(
              CupertinoIcons.calendar,
            ),
            onPressed: () {
              context.go(EnumRoutes.calendar);
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
