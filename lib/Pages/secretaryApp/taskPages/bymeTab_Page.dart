import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sj_secretary_app/core/Viewmodels/treasurer/authentication_ViewModel.dart';
import 'package:sj_secretary_app/core/Viewmodels/treasurer/tasks_ViewModel.dart';
import 'package:sj_secretary_app/core/enums/viewState.dart';
import 'package:sj_secretary_app/widgets/secretaryWidgets/customTaskTiles/customByMeTaskTile.dart';

class ByMeTabPage extends StatelessWidget {
  const ByMeTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: ChangeNotifierProvider<TasksInfoViewModel>(
        create: (context) => TasksInfoViewModel()
          ..getByMeTaskList(
              Provider.of<AuthenticationViewmodel>(context, listen: false)
                      .employeeList
                      ?.data
                      .first
                      .frappeUser ??
                  ""),
        child: Consumer<TasksInfoViewModel>(
          builder: (context, viewmodel, child) => viewmodel.viewState ==
                  ViewState.Busy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () async {
                    String assignedByEmail =
                        Provider.of<AuthenticationViewmodel>(context,
                                    listen: false)
                                .employeeList
                                ?.data
                                .first
                                .frappeUser ??
                            "";
                    if (assignedByEmail.isNotEmpty) {
                      viewmodel.getByMeTaskList(assignedByEmail);
                    } else {
                      final snackBar = SnackBar(
                          content: Text(
                              'Something went wrong! Try after a few minutes'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: ListView.builder(
                    itemCount: viewmodel.tasksList!.data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: CustomByMeTaskTile(
                          tasksData: viewmodel.tasksList!.data.elementAt(index),
                          deleteTaskFunction: viewmodel.deleteTask,
                        ),
                      );
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
