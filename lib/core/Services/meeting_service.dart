import 'package:dio/dio.dart';
import 'package:sj_secretary_app/core/Models/meeting_minutes/meeting_mins_model.dart';
import 'package:sj_secretary_app/core/Models/meetings/meetings_model.dart';
import 'package:sj_secretary_app/core/Services/dio_service.dart';
import 'package:sj_secretary_app/locator.dart';

import 'endpoints.dart';

class MeetingService {
  DioService dioService = locator<DioService>();

  Future<MeetingList> getMeetings() async {
    Response meetingsResponse =
        await dioService.get().get("$baseUrl/$GET_meetings");
    return MeetingList.fromJson(meetingsResponse.data);
  }

  Future<MeetingMinsList> getMeetingMinutes(String meetingID) async {
    Response meetingMinutesResponse = await dioService.get().get(
        '''http://beta.afms.com.ph/api/resource/Meeting Log?fields=["name","meeting","log_entry","creation"]&filters=[["meeting","=","$meetingID"]]''');
    return MeetingMinsList.fromJson(meetingMinutesResponse.data);
  }

  Future<void> postMeetingMinute(String meetingEntry, String meetingID) async {
    Response meetingEntryResponse =
        await dioService.get().post('''$baseUrl/resource/Meeting Log''', data: {
      "log_entry": "$meetingEntry",
      "meeting": "$meetingID",
    });
    print(meetingEntryResponse.statusCode);
  }

  Future<void> postNewMeeting(MeetingData meetingData) async {
    Response meetingEntryResponse =
        await dioService.get().post('''$baseUrl/resource/Meeting''', data: {
      "title": meetingData.title,
      "agenda": meetingData.agenda,
      "meeting_date": meetingData.meetingDate,
      "notify_all_employees": meetingData.notifyAllEmployees
    });
    print(meetingEntryResponse.statusCode);
  }

  Future putMeetingInfo(String meetingID, String meetingTitle,
      String meetingDate, String meetingNote) async {
    Response meetingResponse = await dioService
        .get()
        .put("$baseUrl/resource/Meeting/$meetingID", data: {
      "title": "$meetingTitle",
      "meeting_date": "$meetingDate",
      "agenda": "$meetingNote",
    });
    print(meetingResponse.statusCode);
  }

  Future deleteMeeting(String meetingID) async {
    Response meetingResponse =
        await dioService.get().delete("$baseUrl/resource/Meeting/$meetingID");
    return meetingResponse.statusCode ?? 404;
  }
}
