import 'package:flutter/material.dart';
import 'package:sj_secretary_app/utils/utils.dart';
import 'package:sj_secretary_app/widgets/secretaryWidgets/appBars/simpleAppBar.dart';

class EstimatePage extends StatefulWidget {
  const EstimatePage({Key? key}) : super(key: key);

  @override
  _EstimatePageState createState() => _EstimatePageState();
}

class _EstimatePageState extends State<EstimatePage> {
  late int selectedRadio;

  @override
  void initState() {
    selectedRadio = 0;
    super.initState();
  }

  setSelectedRadio(val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(appBarName: 'Estimate'),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: selectedRadio,
                    activeColor: primaryColor,
                    onChanged: (val) {
                      setSelectedRadio(val);
                    },
                  ),
                  Text('Investment'),
                  SizedBox(width: 20),
                  Radio(
                    value: 2,
                    groupValue: selectedRadio,
                    activeColor: primaryColor,
                    onChanged: (value) {
                      setSelectedRadio(value);
                    },
                  ),
                  Text('Compounding'),
                ],
              ),
              SizedBox(height: 4),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter your Amount',
                  labelStyle: TextStyle(
                    color: Colors.grey[600],
                  ),
                  suffixIcon: Icon(
                    Icons.credit_card_outlined,
                    color: Colors.grey,
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
                'Tenure',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Chip(
                    label: Text('Six Months'),
                  ),
                  SizedBox(width: 6),
                  Chip(
                    label: Text('Nine Months'),
                  ),
                ],
              ),
              Row(
                children: [
                  Chip(
                    label: Text('Twelve Months'),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(12),
                width: 328,
                height: 128,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'RETURN ON INVESTMENT',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 64,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: ListTile(
                        title: Text('\$197.38'),
                        subtitle: Text('Monthly'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
