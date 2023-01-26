import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertask/Widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../Providers/provider.dart';
import '../Components/buildItemComp.dart';
import '../Components/homeMiddleComp.dart';
import '../Components/homeTopComp.dart';
import '../model/tasksModel.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  AllTasksModel? allTasks;

  late AppFlowyBoardScrollController boardController;

  late AppFlowyBoardController controller;

  String? dateTime;
  @override
  void initState() {
    super.initState();
    controller = AppFlowyBoardController(
      onMoveGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {},
      onMoveGroupItem: (groupId, fromIndex, toIndex) {},
      onMoveGroupItemToGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
        debugPrint('Move $fromGroupId:$fromIndex to $toGroupId:$toIndex');
        List<Tasks> task = [];
        if (fromGroupId == "To Do") {
          task = allTasks!.todo;
        }
        if (fromGroupId == "In Progress") {
          task = allTasks!.inProgress;
        }
        if (fromGroupId == "Complete") {
          task = allTasks!.todo;
        }

        ref.read(statusUpdateProvider(
            UpdateStatus(status: toGroupId, id: task[fromIndex].id)));
      },
    );
    getAllTaskList();

    dateTime = DateFormat.yMMMM().format(DateTime.now());
  }

  getAllTaskList() {
    boardController = AppFlowyBoardScrollController();

    ref.read(allTaskListProvider.stream).listen((value) {
      controller.clear();
      controller.addGroups([
        AppFlowyGroupData(
            id: "To Do",
            name: "To Do",
            items: List<AppFlowyGroupItem>.from(value.todo)),
        AppFlowyGroupData(
            id: "In Progress",
            name: "In Progress",
            items: List<AppFlowyGroupItem>.from(value.inProgress)),
        AppFlowyGroupData(
            id: "Complete",
            name: "Complete",
            items: List<AppFlowyGroupItem>.from(value.complete))
      ]);

      setState(() {
        allTasks = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // ignore: prefer_const_constructors
    final config = AppFlowyBoardConfig(
      cornerRadius: 10,
      groupItemPadding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
      groupBackgroundColor: Theme.of(context).backgroundColor,
    );

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 20,
        hoverColor: Theme.of(context).primaryColor,
        hoverElevation: 50,
        shape: const StadiumBorder(),
        child: const Icon(Icons.add),
        onPressed: () {
          context.push("/CREATETASK");
        },
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: ref.watch(allTaskListProvider).when(
          data: (data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                homeTopWidget(context),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    dateTime!,
                    style: GoogleFonts.aBeeZee(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                homeMiddleWidget(
                  data.complete.length,
                  data.complete.length +
                      data.inProgress.length +
                      data.todo.length,
                  context,
                  data,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Expanded(
                  child: AppFlowyBoard(
                      controller: controller,
                      cardBuilder: (context, group, groupItem) {
                        return AppFlowyGroupCard(
                          decoration: BoxDecoration(
                              color: Theme.of(context).backgroundColor),
                          key: ValueKey(groupItem.id),
                          child: buildItem(groupItem, context),
                        );
                      },
                      boardScrollController: boardController,
                      headerBuilder: (context, columnData) {
                        return AppFlowyGroupHeader(
                          title: Container(
                            height: 100,
                            width: 300,
                            color: Theme.of(context).primaryColor,
                            child: Center(
                              child: Text(
                                columnData.id,
                                style: GoogleFonts.aBeeZee(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          // addIcon: const Icon(Icons.add, size: 20),
                          // moreIcon: const Icon(Icons.more_horiz, size: 20),
                          height: 50,

                          margin: config.groupItemPadding,
                        );
                      },
                      groupConstraints: const BoxConstraints.tightFor(
                        width: 350,
                      ),
                      config: config),
                ),
              ],
            );
          },
          error: ((error, stackTrace) => Text(error.toString())),
          loading: (() => progressIndicator(context))),
    );
  }
}
