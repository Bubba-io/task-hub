import 'package:go_router/go_router.dart';
import 'package:task_hub/core/enums/routes.dart';
import 'package:task_hub/modules/home/view/home_page.dart';
import 'package:task_hub/modules/task_creation/view/task_creation.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: EnumRoutes.home,
  routes: <RouteBase>[
    GoRoute(
      path: EnumRoutes.home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: EnumRoutes.taskCreation,
      builder: (context, state) => const TaskCreationPage(),
    ),
  ],
);
