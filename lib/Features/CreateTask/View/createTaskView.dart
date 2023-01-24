import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Widgets/widgets.dart';
import '../Controller/CreateTaskControllerImp.dart';

class CreateTaskView extends ConsumerStatefulWidget {
  const CreateTaskView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreateTaskViewState createState() => _CreateTaskViewState();
}

class _CreateTaskViewState extends ConsumerState<CreateTaskView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController projectController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    descriptionController.dispose();
    projectController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
          child: Card(
        elevation: 10,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Container(
          width: size.width * 0.85,
          height: size.height * 0.8,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor.withOpacity(0.9),
                borderRadius: const BorderRadius.all(
                  Radius.circular(30.0),
                )),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        "CreateTask",
                        style: GoogleFonts.aBeeZee(
                            color: Colors.teal,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Task",
                      style: GoogleFonts.aBeeZee(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    textFieldWidget(nameController, "Task Title", 1, (value) {
                      nameController.text = value;
                      setState(() {});
                    }, context, 20),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Project",
                      style: GoogleFonts.aBeeZee(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    textFieldWidget(nameController, "Project name", 1, (value) {
                      projectController.text = value;
                      setState(() {});
                    }, context, 20),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Description",
                      style: GoogleFonts.aBeeZee(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    textFieldWidget(
                        descriptionController, "Task Description", 8, (value) {
                      descriptionController.text = value;
                      setState(() {});
                    }, context, 200),
                    SizedBox(
                      height: size.height * 0.07,
                    ),
                    Center(
                        child: raisedTextButton(() async {
                      if (descriptionController.text.isNotEmpty &&
                          nameController.text.isNotEmpty &&
                          projectController.text.isNotEmpty) {
                        bool added = await ref
                            .read(createTaskControllerProvider)
                            .createTask(
                                nameController.text,
                                descriptionController.text,
                                projectController.text,
                                "Umais Qureshi");
                        if (added) {
                          // ignore: use_build_context_synchronously
                          showSnackBar(context, "Task Added Successfully");
                          context.pop();
                        }
                      }
                    }, "Create", Theme.of(context).primaryColor)),
                  ],
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
