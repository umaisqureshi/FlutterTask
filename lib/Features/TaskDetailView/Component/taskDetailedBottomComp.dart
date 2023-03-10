import 'package:flutter/material.dart';

import '../../../Widgets/raisedButtonWidget.dart';
import '../../../Widgets/showSnackbarWidget.dart';
import '../View/taskDetailView.dart';

class TaskDetailedBottomComp extends StatelessWidget {
  const TaskDetailedBottomComp(
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
        raisedTextButton(
            onEdit, "  Edit  ", Theme.of(context).primaryColor, context),
        raisedTextButton(onDelete, "Delete", Colors.teal, context)
      ],
    );
  }
}
