import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sj_secretary_app/core/Viewmodels/treasurer/meeting_list_Viewmodel.dart';
import 'package:sj_secretary_app/utils/utils.dart';
import 'package:sj_secretary_app/widgets/secretaryWidgets/appBars/customAppBar.dart';

class EditMeetingNote extends StatefulWidget {
  final String meetingID;
  final String meetingTitle;
  final String meetingDate;
  final String meetingNote;

  const EditMeetingNote({
    required this.meetingID,
    required this.meetingTitle,
    required this.meetingDate,
    required this.meetingNote,
  });

  @override
  _EditMeetingNoteState createState() => _EditMeetingNoteState();
}

class _EditMeetingNoteState extends State<EditMeetingNote> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController meetingDateController = TextEditingController();
  final TextEditingController meetingNotesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarName: 'Edit Meeting'),
      body: SingleChildScrollView(
        child: ChangeNotifierProvider<MeetingListViewModel>(
          create: (context) =>
              MeetingListViewModel()..runPreMeetingEditOps(widget.meetingDate),
          child: Consumer<MeetingListViewModel>(
            builder: (context, viewmodel, child) {
              return Container(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "MEETING TITLE",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          letterSpacing: 1.35),
                    ),
                    TextFormField(
                      controller: titleController..text = widget.meetingTitle,
                      decoration: InputDecoration(
                        hintText: 'Title',
                        labelStyle: TextStyle(
                          color: Colors.grey[600],
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.fromLTRB(10, 15, 15, 15),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "MEETING DATE",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          letterSpacing: 1.35),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          child: Text(DateFormat("dd MMM yy, HH:mm aa")
                              .format(viewmodel.newMeetingDateTime)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey)),
                        ),
                        SizedBox(width: 24),
                        GestureDetector(
                          child: Container(
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_today,
                                      color: Colors.black87,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      'Choose Date',
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            DatePicker.showDateTimePicker(context,
                                showTitleActions: true,
                                minTime: DateTime.now(),
                                onChanged: (date) {}, onConfirm: (date) {
                              print('confirm $date');
                              viewmodel.updateNewTaskDate(date);
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.en);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      "MEETING AGENDA",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          letterSpacing: 1.35),
                    ),
                    TextFormField(
                      controller: meetingNotesController
                        ..text = widget.meetingNote,
                      decoration: InputDecoration(
                        hintText: 'Agenda',
                        labelStyle: TextStyle(
                          color: Colors.grey[600],
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                      ),
                      maxLines: 8,
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFF029247)),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.fromLTRB(20, 15, 20, 15)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(23.0),
                              ),
                            ),
                          ),
                          child: Text(
                            'SAVE',
                            style: overlayStyle,
                          ),
                          onPressed: () {
                            viewmodel.updateMeetingInfo(
                              widget.meetingID,
                              titleController.text,
                              formattedDateTimeForTaskUpload(
                                  viewmodel.newMeetingDateTime),
                              meetingNotesController.text,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
