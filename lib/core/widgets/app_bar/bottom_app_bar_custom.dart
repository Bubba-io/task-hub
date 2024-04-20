import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_hub/core/enums/enums.dart';
import 'package:task_hub/core/styles/styles.dart';

class BottomAppBarCustom extends StatefulWidget {
  const BottomAppBarCustom({super.key});

  @override
  State<BottomAppBarCustom> createState() => _BottomAppBarCustomState();
}

class _BottomAppBarCustomState extends State<BottomAppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 25,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: BottomAppBar(
        color: AppColors.white,
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
              color: _defineIconColor(EnumRoutes.home),
              icon: const Icon(CupertinoIcons.home),
              onPressed: () {
                _redirect(EnumRoutes.home);
              },
            ),
            const Spacer(flex: 6),
            IconButton(
              iconSize: 42,
              color: _defineIconColor(EnumRoutes.calendar),
              icon: const Icon(CupertinoIcons.calendar),
              onPressed: () {
                _redirect(EnumRoutes.calendar);
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Color _defineIconColor(String widgetName) {
    final route =
        GoRouter.of(context).routerDelegate.currentConfiguration.fullPath;

    if (route == widgetName) {
      return AppColors.black;
    } else {
      return AppColors.black.withOpacity(0.4);
    }
  }

  void _redirect(String route) {
    /// used for update selected item color
    setState(() {});

    context.go(route);
  }
}
