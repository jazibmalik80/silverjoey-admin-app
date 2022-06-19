import 'package:flutter/material.dart';
import 'package:sj_secretary_app/utils/utils.dart';
import 'package:sj_secretary_app/widgets/secretaryWidgets/appBars/customAppBar.dart';

class ManualPaymentPage extends StatefulWidget {
  const ManualPaymentPage({Key? key}) : super(key: key);

  @override
  _ManualPaymentPageState createState() => _ManualPaymentPageState();
}

class _ManualPaymentPageState extends State<ManualPaymentPage> {
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
      appBar: CustomAppBar(appBarName: 'Manual Payment'),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add manual transaction',
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: 24),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Member Name',
                  labelStyle: TextStyle(
                    color: Colors.grey[600],
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black87,
                    ),
                    onPressed: () {},
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(10, 15, 15, 15),
                ),
              ),
              SizedBox(height: 18),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Plan Name',
                  labelStyle: TextStyle(
                    color: Colors.grey[600],
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black87,
                    ),
                    onPressed: () {},
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(10, 15, 15, 15),
                ),
              ),
              SizedBox(height: 18),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Amount',
                  labelStyle: TextStyle(
                    color: Colors.grey[600],
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
              SizedBox(height: 18),
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: selectedRadio,
                    activeColor: primaryColor,
                    onChanged: (val) {
                      setSelectedRadio(val);
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  SizedBox(width: 2),
                  Text(
                    'Debit',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                      letterSpacing: 0.15,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 2,
                    groupValue: selectedRadio,
                    activeColor: primaryColor,
                    onChanged: (val) {
                      setSelectedRadio(val);
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  SizedBox(width: 2),
                  Text(
                    'Credit',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                      letterSpacing: 0.15,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFF029247)),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.fromLTRB(15, 12, 15, 12)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23.0),
                        ),
                      ),
                    ),
                    child: Text(
                      'SAVE PAYMENT',
                      style: overlayStyle,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
