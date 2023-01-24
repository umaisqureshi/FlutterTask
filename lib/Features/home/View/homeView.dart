import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertask/Constants/constants.dart';
import 'package:fluttertask/Features/home/Controller/homeControllerImp.dart';
import 'package:fluttertask/Widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../Components/buildListComp.dart';
import '../Components/homeMiddleComp.dart';
import '../Components/homeTopComp.dart';
import '../model/tasksModel.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  List<AllTasksModel> _lists = [];
  String? dateTime;

  @override
  void initState() {
    super.initState();
    getAllTaskList();
    _lists = List.generate(3, (outerIndex) {
      return AllTasksModel(children: allTaskList);
    });

    dateTime = DateFormat.yMMMM().format(DateTime.now());
  }

  getAllTaskList() {
    final allTasks = ref.read(allTaskListProvider.stream);
    allTasks.forEach((element) {
      for (var allTaskData in element) {
        allTaskList.add(allTaskData);
        setState(() {});
      }
    });
  }

  List<Tasks> allTaskList = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SafeArea(
        child: Scaffold(
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
          body: _lists.isEmpty
              ? progressIndicator(context)
              : Column(
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
                    ref.watch(allTaskListProvider).when(
                          data: (data) => homeMiddleWidget(data, context),
                          error: (error, stackTrace) => Text(error.toString()),
                          loading: () => progressIndicator(context),
                        ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              "TASKS",
                              style: GoogleFonts.aBeeZee(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          Expanded(
                              child: ref.watch(allTaskListProvider).when(
                                  data: (data) {
                                    return DragAndDropLists(
                                      children: List.generate(
                                          _lists.length,
                                          (index) =>
                                              buildList(index, data, context)),
                                      onItemReorder: _onItemReorder,
                                      onListReorder: (int a, int b) {},
                                      axis: Axis.horizontal,
                                      listWidth: 330,
                                      listDraggingWidth: 300,
                                      listPadding: const EdgeInsets.all(12.0),
                                    );
                                  },
                                  error: ((error, stackTrace) {
                                    return Text(error.toString());
                                  }),
                                  loading: () => progressIndicator(context))),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  _onItemReorder(
      int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    Tasks? getId;
    setState(() {
      var movedItem = _lists[oldListIndex].children.removeAt(oldItemIndex);
      _lists[newListIndex].children.insert(newItemIndex, movedItem);
      getId = movedItem;
    });
    ref.read(statusUpdateProvider(UpdateStatus(
        status: newListIndex == 0
            ? "Todo"
            : newListIndex == 1
                ? "In Progress"
                : "Complete",
        id: getId!.id)));
  }

  // _onListReorder(int oldListIndex, int newListIndex) {
  //   setState(() {
  //     var movedList = _lists.removeAt(oldListIndex);
  //     _lists.insert(newListIndex, movedList);
  //   });
  // }

}
