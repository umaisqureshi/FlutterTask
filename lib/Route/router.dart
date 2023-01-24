import 'package:flutter/material.dart';
import 'package:fluttertask/Features/TaskDetailView/View/taskDetailView.dart';
import 'package:fluttertask/Features/home/model/tasksModel.dart';
import 'package:go_router/go_router.dart';

import '../Features/CreateTask/View/createTaskView.dart';
import '../Features/Splash/splashView.dart';
import '../Features/home/View/homeView.dart';

class Routes {
  Routes({required BuildContext context});
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreenView();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'HOME',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return const MaterialPage(child: HomeView());
            },
          ),
          GoRoute(
            path: 'CREATETASK',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return const MaterialPage(child: CreateTaskView());
            },
          ),
          GoRoute(
            path: 'TASKVIEW',
            pageBuilder: (BuildContext context, GoRouterState state) {
              Tasks task = state.extra as Tasks;
              return MaterialPage(
                  child: TaskDetailedView(
                task: task,
              ));
            },
          ),
        ],
      ),
    ],
  );
}
