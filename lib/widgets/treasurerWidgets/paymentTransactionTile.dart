import 'package:flutter/material.dart';

class PaymentTransactionTile extends StatelessWidget {
  final String investmentPlan;
  final String date;
  final String status;
  final String amount;
  final Icon leadingIcon;
  final Color paymentColor;

  const PaymentTransactionTile({
    required this.investmentPlan,
    required this.date,
    required this.status,
    required this.amount,
    required this.leadingIcon,
    required this.paymentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Container(
            child: Column(
              children: [
                leadingIcon,
                SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
        ),
        SizedBox(width: 16),
        Flexible(
          flex: 7,
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$investmentPlan',
                            style: TextStyle(
                              color: Color(0xDE000000),
                              fontSize: 16,
                              letterSpacing: 0.15,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '$date',
                            style: TextStyle(
                              color: Color(0x99000000),
                              fontSize: 14,
                              letterSpacing: 0.25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '$status',
                          style: TextStyle(
                            color: Color(0x99000000),
                            fontSize: 12,
                            letterSpacing: 0.4,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '$amount',
                          style: TextStyle(
                            color: paymentColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Divider(
                  thickness: 1,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
