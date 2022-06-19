import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sj_secretary_app/core/Models/services/service_model.dart';
import 'package:sj_secretary_app/core/Viewmodels/treasurer/calculator_viewModel.dart';
import 'package:sj_secretary_app/core/enums/viewState.dart';
import 'package:sj_secretary_app/widgets/secretaryWidgets/appBars/mainAppBar.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController amountController = TextEditingController();

  final oCcy = new NumberFormat("#,##0.00", "en_US");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarName: "Calculate"),
      body: ChangeNotifierProvider<CalculatorViewModel>(
        create: (context) => CalculatorViewModel()..fetchOffferedServices(),
        child: Consumer<CalculatorViewModel>(
          builder: (context, viewmodel, child) {
            if (viewmodel.viewState == ViewState.Busy)
              return Center(
                child: CircularProgressIndicator(),
              );
            else
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("1. Pick Service"),
                      DropdownButton<ServiceData>(
                        isExpanded: true,
                        hint: Text('Tap here to see services'),
                        items: viewmodel.serviceList!.data.map((element) {
                          return DropdownMenuItem<ServiceData>(
                            child: Text(element.title),
                            value: element,
                          );
                        }).toList(),
                        value: viewmodel.selectedService,
                        onChanged: (newValue) {
                          viewmodel.updateSelectedService(
                              newValue, amountController.text);
                        },
                      ),
                      Text(
                        viewmodel.selectedService?.hasFixedReturn == 0
                            ? "Return on Investment (%) = ${viewmodel.selectedService?.roiPercentageOnCapitalInvestment.toString() ?? "No service selected"}"
                            : "This service has a fixed return amount and does not depend on your capital.",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      Divider(),
                      SizedBox(height: 32),
                      Visibility(
                        visible: viewmodel.selectedService?.hasFixedReturn == 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("2. Enter Capital Amount"),
                            SizedBox(height: 8),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: amountController,
                              onChanged: (String value) {
                                viewmodel.calculateROI(value);
                              },
                              decoration: InputDecoration(
                                prefixText: "₱ ",
                                hintText: 'Type amount here',
                                labelStyle: TextStyle(
                                  color: Colors.grey[600],
                                ),
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                isDense: true,
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 15, 15, 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 32),
                      Container(
                        padding: EdgeInsets.all(12),
                        width: 328,
                        height: 128,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  viewmodel.selectedService?.hasFixedReturn == 0
                                      ? 'END OF TERM BALANCE'
                                      : "FIXED RETURN AMOUNT",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Duration ${viewmodel.selectedService?.tenureLengthMonths} months",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 8),
                            roiTile(viewmodel.generatedROI,
                                viewmodel.selectedService),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
          },
        ),
      ),
    );
  }

  Widget roiTile(double? generatedROI, ServiceData? selectedServiceInfo) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: selectedServiceInfo?.hasFixedReturn == 0
          ? ListTile(
              title: Text("₱ ${oCcy.format(generatedROI ?? 0.0)}"),
              subtitle: Text(
                  '${selectedServiceInfo?.title ?? "No service selected"}'),
            )
          : ListTile(
              title: Text(
                  "₱ ${oCcy.format(selectedServiceInfo?.fixedReturnAmount ?? 0.0)}"),
              subtitle: Text(
                  '${selectedServiceInfo?.title ?? "No service selected"}'),
            ),
    );
  }
}
