// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:todo_list/ui/widgets/task_form/task_form_widget.dart';

import '../widgets/group_form/group_form_widget.dart';
import '../widgets/groups/groups_widget.dart';
import '../widgets/tasks/tasks_widget.dart';

abstract class MainNavigationRoutesNames {
  static const groups = 'groups';
  static const groupsForm = 'groups/form';
  static const tasks = 'groups/tasks';
  static const tasksForm = 'groups/tasks/form';
}

class MainNavigation {
  final initialRoute = MainNavigationRoutesNames.groups;
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRoutesNames.groups: (context) => const GroupsWidget(),
    MainNavigationRoutesNames.groupsForm: (context) => const GroupFormWidget(),
  };

  Route<Object> onGererateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRoutesNames.tasks:
        final groupKey = settings.arguments as int;
        return MaterialPageRoute(
            builder: (context) => TasksWidget(groupKey: groupKey));
      case MainNavigationRoutesNames.tasksForm:
        final groupKey = settings.arguments as int;
        return MaterialPageRoute(
            builder: (context) => TaskFormWidget(groupKey: groupKey));
      default:
        const widget = Text('Navigation Error!!!');
        final groupKey = settings.arguments as int;
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}
