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
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.only(
                    top: EnumPaddings.x3,
                    bottom: EnumPaddings.x5,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: 80,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(
                            EnumPaddings.x1,
                          ),
                        ),
                      ),
                      const SizedBox(height: EnumPaddings.x3),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: EnumPaddings.x4,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Text('Modal BottomSheet'),
                              ],
                            ),
                            ElevatedButton(
                              child: const Text('Close BottomSheet'),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
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
