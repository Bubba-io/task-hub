import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:get/instance_manager.dart';
import 'package:task_hub/modules/calendar/controller/calendar_cubit.dart';
import 'package:task_hub/modules/task/controller/task_manager_cubit.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  Get
    ..put(TaskManagerCubit())
    ..put(CalendarCubit());

  Future.delayed(Duration.zero, () async {
    await Get.find<TaskManagerCubit>().loadTasks();
  });

  runApp(await builder());
}
