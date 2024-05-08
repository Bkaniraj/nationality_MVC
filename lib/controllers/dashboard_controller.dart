import 'package:flutter/material.dart';

import '../models/national_model.dart';
import '../service/api/api_services.dart';
import '../service/locator.dart';

class DashboardController extends ChangeNotifier {
  NationalResponse? _nationalResponse;

  NationalResponse? get getNationalList => _nationalResponse;

  bool isBusy = false;

  List<Country>? get getCountryList {
    if (getNationalList == null) {
      return [];
    } else {
      return getNationalList!.country;
    }
  }

  final _apiService = locator<ApiService>();

  TextEditingController controller = TextEditingController();

  fetchData() async {
    setBusy(true);
    String nameFromEdit = controller.text.trim();
    _nationalResponse = await _apiService.getNationDetails(nameFromEdit);
    notifyListeners();
    setBusy(false);
  }

  void setBusy(bool val) {
    isBusy = val;
    notifyListeners();
  }
}
