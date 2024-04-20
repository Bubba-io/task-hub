import 'package:go_router/go_router.dart';
import 'package:task_hub/core/enums/routes.dart';
import 'package:task_hub/modules/calendar/view/calendar.dart';
import 'package:task_hub/modules/home/view/home_page.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: EnumRoutes.home,
  routes: <RouteBase>[
    GoRoute(
      path: EnumRoutes.home,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: HomePage(),
      ),
    ),
    GoRoute(
      path: EnumRoutes.calendar,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: CalendarPage(),
      ),
    ),
  ],
);
