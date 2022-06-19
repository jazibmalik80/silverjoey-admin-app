import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sj_secretary_app/core/Models/meetings/meetings_model.dart';
import 'package:sj_secretary_app/core/Viewmodels/treasurer/meeting_list_Viewmodel.dart';
import 'package:sj_secretary_app/core/enums/viewState.dart';
import 'package:sj_secretary_app/utils/utils.dart';
import 'package:sj_secretary_app/widgets/secretaryWidgets/meetingNotes/newMeetingNote_Page.dart';

class MeetingDetailPage extends StatelessWidget {
  final MeetingData meetingData;

  const MeetingDetailPage({Key? key, required this.meetingData})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: primaryColor,
        onPressed: () {
          Navigator.push<bool>(
            context,
            MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                create: (context) => MeetingListViewModel(),
                child: NewMeetingNote(
                  meetingData: meetingData,
                ),
              ),
            ),
          ).then((value) async {
            Provider.of<MeetingListViewModel>(context, listen: false)
                .fetchMeetingLog(meetingData.name);
          });
        },
      ),
      appBar: AppBar(
        title: Text("Meeting Detail"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("TITLE",
                style: TextStyle(
                    fontSize: 12.5, letterSpacing: 1.25, color: Colors.grey)),
            Text(meetingData.title, style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            Text("DATE",
                style: TextStyle(
                    fontSize: 12.5, letterSpacing: 1.25, color: Colors.grey)),
            Text(
                DateFormat("dd MMM yy, HH:mm aa")
                    .format(DateTime.parse(meetingData.meetingDate)),
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text("AGENDA",
                style: TextStyle(
                    fontSize: 12.5, letterSpacing: 1.25, color: Colors.grey)),
            Text(meetingData.agenda),
            SizedBox(height: 32),
            Text("MINUTES",
                style: TextStyle(
                    fontSize: 12.5, letterSpacing: 1.25, color: Colors.grey)),
            SizedBox(height: 16),
            Consumer<MeetingListViewModel>(
              builder: (context, viewmodel, child) {
                if (viewmodel.viewState == ViewState.Busy)
                  return Center(child: CircularProgressIndicator());
                else
                  return Container(
                    child: Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          Provider.of<MeetingListViewModel>(context,
                                  listen: false)
                              .fetchMeetingLog(meetingData.name);
                        },
                        child: ListView.separated(
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: viewmodel.meetingMinsList!.data.length,
                          itemBuilder: (context, index) => ListTile(
                            leading: Icon(Icons.note),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(formattedDateTime(viewmodel
                                  .meetingMinsList!.data
                                  .elementAt(index)
                                  .creation)),
                            ),
                            title: Text(
                              viewmodel.meetingMinsList?.data
                                      .elementAt(index)
                                      .logEntry ??
                                  'Meeting Log',
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
              },
            ),
          ],
        ),
      ),
    );
  }
}
