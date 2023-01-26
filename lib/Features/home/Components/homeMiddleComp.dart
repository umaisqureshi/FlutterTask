import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:fluttertask/Features/home/Components/taskAndCountComp.dart';
import 'package:fluttertask/Widgets/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../model/tasksModel.dart';

homeMiddleWidget(
    int complete, int all, BuildContext context, AllTasksModel tasks) {
  List<Tasks> allList = [];
  allList.addAll([...tasks.todo, ...tasks.complete, ...tasks.inProgress]);

  Future<bool> generateCsv(context) async {
    List<List<String>> csvData = [
      <String>[
        "Task Name",
        "Project Name",
        "Status",
        "Assignee",
        "Description",
        "Created At",
        "Hours",
        "Minutes",
        "Second"
      ],
      ...allList.map((e) => [
            e.name,
            e.project,
            e.status,
            e.assignee,
            e.description,
            e.createdAt.toString(),
            e.timeInHour.toString(),
            e.timeInMin.toString(),
            e.timeInSec.toString()
          ]),
    ];
    if (await Permission.storage.request().isGranted) {
      final String dir = (await getExternalStorageDirectory())!.path;
      final String path = "$dir/tasks.csv";
      final File file = File(path);
      String csv = const ListToCsvConverter().convert(csvData);
      await file.writeAsString(csv);
    }
    return true;
  }

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            taskAndCountWidget(all, complete,
                (complete / all * 100).isNaN ? 0.0 : complete / all * 100,
                (() async {
              bool csvCreated = await generateCsv(context);
              if (csvCreated) {
                // ignore: use_build_context_synchronously
                showSnackBar(context, "Csv created Successfully");
              }
            }), context),
          ],
        ),
      ),
    ),
  );
}
