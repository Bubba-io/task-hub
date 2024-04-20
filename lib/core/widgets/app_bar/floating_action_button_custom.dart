import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_hub/core/enums/enums.dart';

class FloatingActionButtonCustom extends StatelessWidget {
  const FloatingActionButtonCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: EnumPaddings.x3),
      child: Material(
        shape: const CircleBorder(),
        color: Colors.red,
        child: InkWell(
          onTap: () {},
          splashColor: Colors.amber,
          customBorder: const CircleBorder(),
          child: const SizedBox(
            height: 70,
            width: 70,
            child: Center(
              child: Icon(
                CupertinoIcons.add,
                color: Colors.black,
                size: 42,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
