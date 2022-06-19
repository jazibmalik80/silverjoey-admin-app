import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sj_secretary_app/core/Viewmodels/treasurer/tasks_ViewModel.dart';
import 'package:sj_secretary_app/core/enums/viewState.dart';

import 'package:sj_secretary_app/widgets/secretaryWidgets/customTaskTiles/customTaskTodoTile.dart';

class AllTaskPage extends StatefulWidget {
  const AllTaskPage({Key? key}) : super(key: key);

  @override
  _AllTaskPageState createState() => _AllTaskPageState();
}

class _AllTaskPageState extends State<AllTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: ChangeNotifierProvider<TasksInfoViewModel>(
        create: (context) => TasksInfoViewModel()..getAllTaskList(),
        child: Consumer<TasksInfoViewModel>(
          builder: (context, viewmodel, child) =>
              viewmodel.viewState == ViewState.Busy
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : RefreshIndicator(
                      onRefresh: () async {
                        await viewmodel.getAllTaskList();
                      },
                      child: ListView.builder(
                        itemCount: viewmodel.tasksList!.data.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              CustomTaskTodoTile(
                                tasksData:
                                    viewmodel.tasksList!.data.elementAt(index),
                              ),
                              SizedBox(height: 8),
                            ],
                          );
                        },
                      ),
                    ),
        ),
      ),
    );
  }
}
