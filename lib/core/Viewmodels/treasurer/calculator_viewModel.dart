import 'package:flutter/material.dart';
import 'package:sj_secretary_app/core/Models/services/service_model.dart';
import 'package:sj_secretary_app/core/Services/calculator_service.dart';
import 'package:sj_secretary_app/core/enums/viewState.dart';
import 'package:sj_secretary_app/utils/utils.dart';

import '../../../locator.dart';

class CalculatorViewModel extends ChangeNotifier {
  ViewState viewState = ViewState.Idle;
  ServiceList? serviceList;
  CalculatorService calculatorService = locator<CalculatorService>();
  ServiceData? selectedService;
  double? generatedROI;

  Future fetchOffferedServices() async {
    viewState = ViewState.Busy;
    notifyListeners();
    serviceList = await calculatorService.getOfferedServices();
    selectedService = serviceList!.data.first;
    viewState = ViewState.Idle;
    notifyListeners();
  }

  void updateSelectedService(ServiceData? serviceData, String amountValue) {
    this.selectedService = serviceData;
    calculateROI(amountValue);
  }

  void calculateROI(String amountValue) {
    double? capitalAmount = double.tryParse(amountValue);
    if (selectedService != null && capitalAmount != null) {
      // if (selectedService!.hasFixedReturn == 1) {
      //   generatedROI = 0;
      // } else {
      //   double tenured = 0;
      //   for (int i = 0; i < selectedService!.tenureLengthMonths; i++) {
      //     tenured = tenured +
      //         ((capitalAmount ?? 0) *
      //             (selectedService!.roiPercentageOnCapitalInvestment / 100));
      //     capitalAmount = capitalAmount! + tenured;
      //   }
      //   generatedROI = tenured;
      // }
      generatedROI =
          calculateEOTB(capitalAmount, selectedService!.tenureLengthMonths);
      notifyListeners();
    } else {
      generatedROI = 0.0;
      notifyListeners();
    }
  }
}
