import 'package:flutter/material.dart';
import 'package:sj_secretary_app/Pages/secretaryApp/bottomNavPages/task_Page.dart';
import 'package:sj_secretary_app/Pages/treasurerApp/bottomNavPages/paymentPage.dart';
import 'package:sj_secretary_app/utils/utils.dart';

class TreasurerBottomNavView extends StatefulWidget {
  const TreasurerBottomNavView({Key? key}) : super(key: key);

  @override
  _TreasurerBottomNavViewState createState() => _TreasurerBottomNavViewState();
}

class _TreasurerBottomNavViewState extends State<TreasurerBottomNavView> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          PaymentPage(),
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
            label: 'Transactions',
            icon: Icon(Icons.credit_card_outlined),
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
