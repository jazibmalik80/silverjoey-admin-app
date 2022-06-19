import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sj_secretary_app/Pages/secretaryApp/meeting_pages/meeting_create_page.dart';
import 'package:sj_secretary_app/Pages/secretaryApp/meeting_pages/meeting_detail_page.dart';
import 'package:sj_secretary_app/core/Viewmodels/treasurer/authentication_ViewModel.dart';
import 'package:sj_secretary_app/core/Viewmodels/treasurer/meeting_list_Viewmodel.dart';
import 'package:sj_secretary_app/core/enums/viewState.dart';
import 'package:sj_secretary_app/widgets/secretaryWidgets/appBars/mainAppBar.dart';
import 'package:sj_secretary_app/widgets/secretaryWidgets/customMeetingTile.dart';

class MeetingPage extends StatefulWidget {
  const MeetingPage({Key? key}) : super(key: key);

  @override
  _MeetingPageState createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateMeetingPage(),
              ),
            );
          },
          label: Text("New Meeting")),
      appBar: MainAppBar(appBarName: 'Meetings'),
      body: Consumer<MeetingListViewModel>(
        builder: (context, viewmodel, child) {
          if (viewmodel.viewState == ViewState.Busy)
            return Center(child: CircularProgressIndicator());
          else
            return Container(
              padding: EdgeInsets.all(14),
              child: RefreshIndicator(
                onRefresh: () async {
                  await viewmodel.fetchMeetingList();
                },
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangeNotifierProvider(
                              create: (context) => MeetingListViewModel()
                                ..fetchMeetingLog(viewmodel.meetingList!.data
                                    .elementAt(index)
                                    .name),
                              child: MeetingDetailPage(
                                meetingData: viewmodel.meetingList!.data
                                    .elementAt(index),
                              ),
                            ),
                          ),
                        );
                      },
                      child: CustomMeetingTile(
                        meetingData:
                            viewmodel.meetingList!.data.elementAt(index),
                        deleteTaskFunction: viewmodel.deleteMeeting,
                      ),
                    );
                  },
                  itemCount: viewmodel.meetingList!.data.length,
                ),
              ),
            );
        },
      ),
    );
  }
}
