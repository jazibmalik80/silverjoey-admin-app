import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sj_secretary_app/core/Models/meetings/meetings_model.dart';
import 'package:sj_secretary_app/widgets/secretaryWidgets/meetingNotes/editMeetingNote.dart';

class CustomMeetingTile extends StatelessWidget {
  final MeetingData meetingData;
  final Function deleteTaskFunction;

  const CustomMeetingTile({
    required this.meetingData,
    required this.deleteTaskFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(12, 4, 4, 4),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meetingData.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.15,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      DateFormat("dd MMM yy, HH:mm aa")
                          .format(DateTime.parse(meetingData.meetingDate)),
                      style: TextStyle(
                        color: Color(0x99000000),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.25,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    PopupMenuButton<MenuItem>(
                      itemBuilder: (context) => [
                        ...MenuItems.items.map(buildItem).toList(),
                      ],
                      onSelected: (item) => onSelected(
                        context,
                        item,
                        meetingData.name,
                        meetingData.title,
                        meetingData.meetingDate,
                        meetingData.agenda,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }

  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem<MenuItem>(
        value: item,
        height: 28,
        child: Text(
          item.text,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          ),
        ),
      );

  void onSelected(
    BuildContext context,
    MenuItem item,
    String meetingID,
    String meetingTitle,
    String meetingDate,
    String meetingNote,
  ) {
    switch (item) {
      case MenuItems.itemdedit:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EditMeetingNote(
              meetingID: meetingID,
              meetingTitle: meetingTitle,
              meetingDate: meetingDate,
              meetingNote: meetingNote,
            ),
          ),
        );
        break;

      // case MenuItems.itemdelete:
      //   showDialog(
      //     context: context,
      //     builder: (context) => AlertDialog(
      //       title: Text("Delete this meeting?"),
      //       actions: [
      //         TextButton(
      //           onPressed: () {
      //             Navigator.pop(context);
      //           },
      //           child: Text("Cancel"),
      //         ),
      //         TextButton(
      //           onPressed: () async {
      //             await deleteTaskFunction(meetingData.name);
      //             final snackBar = SnackBar(
      //                 action: SnackBarAction(
      //                   label: "OK",
      //                   onPressed: () {},
      //                 ),
      //                 content: Text("Meeting Deleted"));
      //             ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //             Navigator.pop(context);
      //           },
      //           child: Text("Delete"),
      //         )
      //       ],
      //     ),
      //   );
      //   break;
    }
  }
}

class MenuItem {
  final String text;

  const MenuItem({
    required this.text,
  });
}

class MenuItems {
  static const List<MenuItem> items = [
    itemdedit,
    // itemdelete,
  ];

  static const itemdedit = MenuItem(
    text: 'Edit',
  );

  // static const itemdelete = MenuItem(
  //   text: 'Delete',
  // );
}
