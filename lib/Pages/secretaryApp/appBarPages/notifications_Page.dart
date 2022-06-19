import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sj_secretary_app/core/Viewmodels/treasurer/authentication_ViewModel.dart';
import 'package:sj_secretary_app/core/Viewmodels/treasurer/notifications_ViewModel.dart';
import 'package:sj_secretary_app/core/enums/viewState.dart';

class AllTabPage extends StatelessWidget {
  const AllTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String dateTimeFormat = DateFormat.yMMMMd('en_US')
    //     .format(DateTime.parse(meetingData.meetingDate));
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: ChangeNotifierProvider<NotificationViewModel>(
        create: (context) => NotificationViewModel()
          ..fetchNotificationsforAdmin(
              Provider.of<AuthenticationViewmodel>(context, listen: false)
                  .employeeList!
                  .data
                  .elementAt(0)
                  .frappeUser),
        child: Consumer<NotificationViewModel>(
            builder: (context, viewmodel, child) {
          if (viewmodel.viewState == ViewState.Busy)
            return Center(
              child: CircularProgressIndicator(),
            );
          else
            return Container(
              padding: EdgeInsets.fromLTRB(14, 8, 0, 16),
              child: ListView.separated(
                itemCount: viewmodel.notificationList!.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      viewmodel.notificationList!.data.elementAt(index).subject,
                    ),
                    subtitle: Html(
                      data: viewmodel.notificationList!.data
                              .elementAt(index)
                              .emailContent +
                          '\n' +
                          DateFormat.yMMMd('en_US').format(
                            DateTime.parse(viewmodel.notificationList!.data
                                .elementAt(index)
                                .creation),
                          ) +
                          '   ' +
                          DateFormat.jm().format(
                            DateTime.parse(viewmodel.notificationList!.data
                                .elementAt(index)
                                .creation),
                          ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(thickness: 1),
              ),
            );
        }),
      ),
    );
  }
}
