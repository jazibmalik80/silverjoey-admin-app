import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sj_secretary_app/Pages/secretaryApp/bottomNavPages/calculator_Page.dart';
import 'package:sj_secretary_app/Pages/secretaryApp/bottomNavPages/meeting_Page.dart';
import 'package:sj_secretary_app/Pages/secretaryApp/bottomNavPages/task_Page.dart';
import 'package:sj_secretary_app/core/Viewmodels/treasurer/calculator_viewModel.dart';
import 'package:sj_secretary_app/core/Viewmodels/treasurer/meeting_list_Viewmodel.dart';
import 'package:sj_secretary_app/utils/utils.dart';

class HomeBottomNavView extends StatefulWidget {
  const HomeBottomNavView({Key? key}) : super(key: key);

  @override
  _HomeBottomNavViewState createState() => _HomeBottomNavViewState();
}

class _HomeBottomNavViewState extends State<HomeBottomNavView> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          ChangeNotifierProvider(
              create: (context) => MeetingListViewModel()..fetchMeetingList(),
              child: MeetingPage()),
          ChangeNotifierProvider(
            create: (context) => CalculatorViewModel(),
            child: CalculatorPage(),
          ),
          TaskPage(),
        ],
        onPageChanged: onPageChange,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primaryColor,
        type: BottomNavigationBarType.fixed,
        onTap: itemTapped,
        currentIndex: selectedindex,
        items: [
          BottomNavigationBarItem(
            label: 'Meetings',
            icon: Icon(Icons.speaker_notes_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Calculator',
            icon: Icon(Icons.calculate_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Tasks',
            icon: Icon(Icons.track_changes),
          ),
        ],
        selectedLabelStyle: TextStyle(color: primaryColor),
        unselectedLabelStyle: TextStyle(color: Color(0x99000000)),
        showSelectedLabels: true,
        unselectedItemColor: Color(0x99000000),
      ),
    );
  }

  PageController pageController = PageController();

  void onPageChange(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  void itemTapped(int selectedIndex) {
    pageController.jumpToPage(selectedIndex);
  }
}
