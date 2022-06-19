import 'package:flutter/material.dart';

class WikiPlanDetails extends StatefulWidget {
  final String? planName;
  final String? planDetails;
  final String? termsandConditions;

  const WikiPlanDetails({
    required this.planName,
    required this.planDetails,
    required this.termsandConditions,
  });

  @override
  _WikiPlanDetailsState createState() => _WikiPlanDetailsState();
}

class _WikiPlanDetailsState extends State<WikiPlanDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.planName.toString(),
          style: TextStyle(
            fontSize: 16,
            letterSpacing: 0.15,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.planName.toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 8),
              Container(
                child: Text(
                  widget.planDetails.toString(),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Terms and Conditions',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 8),
              Container(
                child: Text(
                  widget.termsandConditions.toString(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
