import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sj_secretary_app/core/Models/meetings/meetings_model.dart';
import 'package:sj_secretary_app/core/Viewmodels/treasurer/meeting_list_Viewmodel.dart';

class NewMeetingNote extends StatefulWidget {
  final MeetingData meetingData;
  const NewMeetingNote({Key? key, required this.meetingData}) : super(key: key);

  @override
  _NewMeetingNoteState createState() => _NewMeetingNoteState();
}

class _NewMeetingNoteState extends State<NewMeetingNote> {
  final TextEditingController meetingEntryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Meeting Note'),
        actions: [
          TextButton.icon(
              onPressed: () async {
                await Provider.of<MeetingListViewModel>(context, listen: false)
                    .addMeetingMinutes(
                        meetingEntryController.text, widget.meetingData.name);
                final snackBar = SnackBar(
                    action: SnackBarAction(
                      label: "OK",
                      onPressed: () {},
                    ),
                    content: Text("Note Added"));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.pop(context, true);
              },
              icon: Icon(
                Icons.check,
                color: Colors.white,
              ),
              label: Text(
                "Save",
                style: TextStyle(
                  color: Colors.white,
                ),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Column(
            children: [
              TextFormField(
                controller: meetingEntryController,
                maxLines: null,
                decoration: InputDecoration(
                  labelText: 'Tap here to start typing',
                  labelStyle: TextStyle(color: Colors.grey[600], fontSize: 18),
                  border: InputBorder.none,
                  isDense: true,
                ),
              ),
              Divider(),
              ListTile(
                leading:
                    Icon(Icons.info, color: Theme.of(context).primaryColor),
                title: Text(
                  "Write what this meeting was about. When you're done writing hit the save button to save the note to the relevant meeting entry.",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(height: 200),
            ],
          ),
        ),
      ),
    );
  }
}
