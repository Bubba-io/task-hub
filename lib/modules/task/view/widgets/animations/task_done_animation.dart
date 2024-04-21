import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:task_hub/core/enums/paddings.dart';
import 'package:task_hub/core/styles/styles.dart';

class TaskDoneAnimation extends StatefulWidget {
  const TaskDoneAnimation({super.key});

  @override
  State<TaskDoneAnimation> createState() => _TaskDoneAnimationState();
}

class _TaskDoneAnimationState extends State<TaskDoneAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _opacity = 1;
  final _duration = const Duration(milliseconds: 1650);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        context.pop();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Lottie.asset(
            'assets/animations/rocket_launch.json',
            fit: BoxFit.fill,
            controller: _controller,
            onLoaded: (composition) {
              _controller
                ..duration = _duration
                ..forward();

              setState(() {
                _opacity = 0;
              });
            },
          ),
        ),
        const SizedBox(height: EnumPaddings.x4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: AnimatedOpacity(
                opacity: _opacity,
                duration: _duration,
                child: Text(
                  'TAREFA CONCLUÍDA',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.h4.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
