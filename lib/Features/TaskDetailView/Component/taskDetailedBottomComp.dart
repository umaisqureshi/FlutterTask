import 'package:flutter/material.dart';

import '../../../Widgets/widgets.dart';
import '../View/taskDetailView.dart';

class TaskDetailedTopComp extends StatelessWidget {
  const TaskDetailedTopComp(
      {Key? key,
      required this.size,
      required this.widget,
      required this.onDelete,
      required this.onEdit})
      : super(key: key);

  final Size size;
  final TaskDetailedView widget;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        raisedTextButton(onEdit, " Edit ", Theme.of(context).primaryColor),
        const SizedBox(
          width: 5,
        ),
        raisedTextButton(onDelete, "Delete", Colors.red)
      ],
    );
  }
}
