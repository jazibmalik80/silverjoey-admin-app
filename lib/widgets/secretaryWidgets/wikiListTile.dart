import 'package:flutter/material.dart';
import 'package:sj_secretary_app/Pages/secretaryApp/planDetailPages/wikiPlanDetails.dart';

class WikiListTile extends StatelessWidget {
  final String? planName;
  final String? planDetails;
  final String? termsAndConditions;

  const WikiListTile({
    required this.planName,
    required this.planDetails,
    required this.termsAndConditions,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('$planName'),
      subtitle: Text(
        '$planDetails',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WikiPlanDetails(
              planName: '$planName',
              planDetails: '$planDetails',
              termsandConditions: '$termsAndConditions',
            ),
          ),
        );
      },
    );
  }
}
