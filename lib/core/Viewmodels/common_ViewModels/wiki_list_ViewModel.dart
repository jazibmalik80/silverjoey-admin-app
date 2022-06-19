import 'package:flutter/material.dart';
import 'package:sj_secretary_app/core/Models/wikis/wiki_list_model.dart';
import 'package:sj_secretary_app/core/Services/wiki_service.dart';
import 'package:sj_secretary_app/core/enums/viewState.dart';
import 'package:sj_secretary_app/locator.dart';

enum WikiChips { All, Service, Membership, Insurance, Discount }

class WikiListViewModel extends ChangeNotifier {
  WikiService wikiService = locator<WikiService>();
  ViewState viewState = ViewState.Idle;
  WikiList? wikiList;
  List<WikiData> filteredWiki = [];
  WikiData? wikiData;
  WikiChips wikiChips = WikiChips.All;

  Future getAllWikiList() async {
    filteredWiki.clear();
    print("List Fetching");
    viewState = ViewState.Busy;
    notifyListeners();

    wikiList = await wikiService.getAllWiki();
    print(wikiList?.data.length ?? 0);

    viewState = ViewState.Idle;
    wikiChips = WikiChips.All;
    notifyListeners();
    print("Wiki List Fetched");
  }

  Future getServiceWikiList() async {
    print("Servicing Fetching");
    viewState = ViewState.Busy;
    notifyListeners();

    wikiList = await wikiService.getServiceWiki();
    print(wikiList?.data.length ?? 0);

    viewState = ViewState.Idle;
    wikiChips = WikiChips.Service;
    notifyListeners();
    print("Wiki Service Fetched");
  }

  Future getmembershipWikiList() async {
    print("Membership Fetching");
    viewState = ViewState.Busy;
    notifyListeners();

    wikiList = await wikiService.getMembershipWiki();
    print(wikiList?.data.length ?? 0);

    viewState = ViewState.Idle;
    wikiChips = WikiChips.Membership;
    notifyListeners();
    print("Membership Fetched");
  }

  Future getInsuranceWikiList() async {
    print("Insurance Fetching");
    viewState = ViewState.Busy;
    notifyListeners();

    wikiList = await wikiService.getInsuranceWiki();
    print(wikiList?.data.length ?? 0);

    viewState = ViewState.Idle;
    wikiChips = WikiChips.Insurance;
    notifyListeners();
    print("Insurance Fetched");
  }

  Future getDiscountWikiList() async {
    print("Discount Fetching");
    viewState = ViewState.Busy;
    notifyListeners();

    wikiList = await wikiService.getDiscountWiki();
    print(wikiList?.data.length ?? 0);

    viewState = ViewState.Idle;
    wikiChips = WikiChips.Discount;
    notifyListeners();
    print("Discount Fetched");
  }

  filteredlist(String controllerValue) {
    // ignore: unnecessary_null_comparison
    if (controllerValue != null) {
      filteredWiki = wikiList!.data.where((element) {
        return element.title
                .toLowerCase()
                .contains(controllerValue.toLowerCase()) ||
            element.title.toLowerCase().contains(controllerValue.toLowerCase());
      }).toList();
    }

    notifyListeners();
  }
}
