import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertask/Features/home/model/tasksModel.dart';
import 'package:fluttertask/Widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskDetailedView extends ConsumerStatefulWidget {
  final Tasks task;
  const TaskDetailedView({super.key, required this.task});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TaskDetailedViewState();
}

class _TaskDetailedViewState extends ConsumerState<TaskDetailedView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: size.width * 0.6,
                    child: Text(
                      widget.task.name,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.aBeeZee(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onBackground,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Center(
                          child: iconButton(
                              Icon(
                                Icons.edit,
                                color: Theme.of(context).primaryColor,
                              ),
                              () {},
                              Theme.of(context).colorScheme.onBackground),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onBackground,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Center(
                          child: iconButton(
                              const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              () {},
                              Theme.of(context).colorScheme.onBackground),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
