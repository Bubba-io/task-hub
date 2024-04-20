import 'package:flutter/material.dart';
import 'package:task_hub/core/enums/enums.dart';
import 'package:task_hub/core/widgets/app_bar/app_bar.dart';

class StandartStructure extends StatelessWidget {
  const StandartStructure({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingActionButtonCustom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomAppBarCustom(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: EnumPaddings.x3),
          child: child,
        ),
      ),
    );
  }
}
