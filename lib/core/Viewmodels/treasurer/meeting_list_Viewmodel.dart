import 'package:flutter/material.dart';
import 'package:sj_secretary_app/core/Models/meeting_minutes/meeting_mins_model.dart';
import 'package:sj_secretary_app/core/Models/meetings/meetings_model.dart';
import 'package:sj_secretary_app/core/Services/meeting_service.dart';
import 'package:sj_secretary_app/core/enums/viewState.dart';
import 'package:sj_secretary_app/locator.dart';

class MeetingListViewModel extends ChangeNotifier {
  MeetingService meetingService = locator<MeetingService>();
  MeetingList? meetingList;
  MeetingMinsList? meetingMinsList;
  DateTime newMeetingDateTime = DateTime.now();

  ViewState viewState = ViewState.Idle;

  Future fetchMeetingList() async {
    viewState = ViewState.Busy;
    notifyListeners();
    meetingList = await meetingService.getMeetings();
    viewState = ViewState.Idle;
    notifyListeners();
  }

  Future fetchMeetingLog(String meetingID) async {
    viewState = ViewState.Busy;
    notifyListeners();
    meetingMinsList = await meetingService.getMeetingMinutes(meetingID);
    viewState = ViewState.Idle;
    notifyListeners();
  }

  Future<void> addMeetingMinutes(String meetingEntry, String meetingID) async {
    viewState = ViewState.Busy;
    notifyListeners();
    await meetingService.postMeetingMinute(meetingEntry, meetingID);
    viewState = ViewState.Idle;
    notifyListeners();
  }

  Future<void> createMeeting(MeetingData meetingData) async {
    viewState = ViewState.Busy;
    notifyListeners();
    await meetingService.postNewMeeting(meetingData);
    viewState = ViewState.Idle;
    notifyListeners();
  }

  Future updateMeetingInfo(String meetingID, String meetingTitle,
      String meetingDate, String meetingNote) async {
    print(meetingID);
    print(meetingTitle);
    print(meetingDate);
    print(meetingNote);
    viewState = ViewState.Busy;
    notifyListeners();
    await meetingService.putMeetingInfo(
      meetingID,
      meetingTitle,
      meetingDate,
      meetingNote,
    );
    viewState = ViewState.Idle;
    notifyListeners();
  }

  Future deleteMeeting(String meetingID) async {
    int meetingDeleteStatus = await meetingService.deleteMeeting(meetingID);
    if (meetingDeleteStatus == 202) {
      if (meetingList != null)
        meetingList?.data.removeWhere((element) => element.name == meetingID);
    }
    viewState = ViewState.Idle;
    notifyListeners();
  }

  void updateNewTaskDate(DateTime dateTime) {
    newMeetingDateTime = dateTime;
    notifyListeners();
  }

  void runPreMeetingEditOps(String? meetingDate) {
    newMeetingDateTime =
        DateTime.parse(meetingDate ?? DateTime.now().toString());
    notifyListeners();
  }
}
