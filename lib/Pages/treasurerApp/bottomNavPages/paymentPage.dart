import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:sj_secretary_app/Pages/treasurerApp/manualPayment_Page.dart';
import 'package:sj_secretary_app/utils/utils.dart';
import 'package:sj_secretary_app/widgets/secretaryWidgets/appBars/mainAppBar.dart';
import 'package:sj_secretary_app/widgets/treasurerWidgets/paymentTransactionTile.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarName: 'Payments'),
      body: Center(
        child: Text(
          "Payments Coming Soon!",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.w600),
        ),
      ),
      // body: SingleChildScrollView(
      //   child: Container(
      //     padding: EdgeInsets.all(14),
      //     child: Column(
      //       children: [
      //         Row(
      //           children: [
      //             Expanded(
      //               child: GestureDetector(
      //                 onTap: () {
      //                   DatePicker.showDatePicker(context,
      //                       showTitleActions: true,
      //                       minTime: DateTime(2018, 3, 5),
      //                       maxTime: DateTime.now(), onChanged: (date) {
      //                     print('change $date in time zone ' +
      //                         date.timeZoneOffset.inHours.toString());
      //                   }, onConfirm: (date) {
      //                     print('confirm $date');
      //                   }, currentTime: DateTime.now(), locale: LocaleType.en);
      //                 },
      //                 child: Container(
      //                   padding: EdgeInsets.all(16),
      //                   decoration: BoxDecoration(
      //                       border: Border.all(color: Colors.grey),
      //                       borderRadius: BorderRadius.circular(8)),
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                     children: [
      //                       Icon(Icons.calendar_today, color: Colors.grey),
      //                       Text("Start Date"),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             SizedBox(width: 12),
      //             Expanded(
      //               child: GestureDetector(
      //                 onTap: () {
      //                   DatePicker.showDatePicker(context,
      //                       showTitleActions: true,
      //                       minTime: DateTime(2018, 3, 5),
      //                       maxTime: DateTime.now(), onChanged: (date) {
      //                     print('change $date in time zone ' +
      //                         date.timeZoneOffset.inHours.toString());
      //                   }, onConfirm: (date) {
      //                     print('confirm $date');
      //                   }, currentTime: DateTime.now(), locale: LocaleType.en);
      //                 },
      //                 child: Container(
      //                   padding: EdgeInsets.all(16),
      //                   decoration: BoxDecoration(
      //                       border: Border.all(color: Colors.grey),
      //                       borderRadius: BorderRadius.circular(8)),
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                     children: [
      //                       Icon(Icons.calendar_today, color: Colors.grey),
      //                       Text("End Date"),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //         SizedBox(height: 28),
      //         Card(
      //           child: Container(
      //             padding: EdgeInsets.only(top: 8, bottom: 8, left: 8),
      //             child: Column(
      //               children: [
      //                 Row(
      //                   children: [
      //                     Text(
      //                       'TRANSACTION HISTORY',
      //                       style: TextStyle(
      //                         color: Color(0x99000000),
      //                         fontSize: 10,
      //                         letterSpacing: 1.5,
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //                 SizedBox(height: 16),
      //                 PaymentTransactionTile(
      //                   investmentPlan: 'Investment Plan A',
      //                   date: '01 July 2021',
      //                   status: 'Verified',
      //                   amount: '\$123.00',
      //                   paymentColor: incommingAmount,
      //                   leadingIcon: Icon(
      //                     Icons.arrow_upward,
      //                     color: Colors.green,
      //                   ),
      //                 ),
      //                 PaymentTransactionTile(
      //                   investmentPlan: 'Investment Plan B',
      //                   date: '01 July 2021',
      //                   status: 'Verified',
      //                   amount: '\$123.00',
      //                   paymentColor: incommingAmount,
      //                   leadingIcon: Icon(
      //                     Icons.arrow_upward,
      //                     color: Colors.green,
      //                   ),
      //                 ),
      //                 PaymentTransactionTile(
      //                   investmentPlan: 'Insurance Plan C',
      //                   date: '02 July 2021',
      //                   status: 'Pending',
      //                   amount: '\$423.00',
      //                   paymentColor: outgoingAmount,
      //                   leadingIcon: Icon(
      //                     Icons.arrow_downward,
      //                     color: Colors.red,
      //                   ),
      //                 ),
      //                 PaymentTransactionTile(
      //                   investmentPlan: 'Insurance Plan D',
      //                   date: '02 July 2021',
      //                   status: 'Pending',
      //                   amount: '\$423.00',
      //                   paymentColor: outgoingAmount,
      //                   leadingIcon: Icon(
      //                     Icons.arrow_downward,
      //                     color: Colors.red,
      //                   ),
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.all(6.0),
      //                   child: GestureDetector(
      //                     onTap: () {},
      //                     child: Text(
      //                       'SEE MORE',
      //                       style: overlayStyle.copyWith(
      //                         fontWeight: FontWeight.w600,
      //                         color: Color(0xFF029247),
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      //   backgroundColor: primaryColor,
      //   onPressed: () => {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => ManualPaymentPage(),
      //       ),
      //     ),
      //   },
      // ),
    );
  }
}
