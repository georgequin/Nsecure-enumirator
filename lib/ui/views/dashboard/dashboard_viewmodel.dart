import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:nsecure/app/app.router.dart';
import 'package:nsecure/core/network/loggingApiClient.dart';
import 'package:openapi/api.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../core/network/api_manager.dart';
import '../../../core/network/interceptors.dart';
import '../../../core/utils/local_store_dir.dart';
import '../../../core/utils/local_stotage.dart';
import '../../../state.dart';
import '../../../utils/face_detection_utils.dart';
import '../../../utils/location_utils.dart';

class DashboardViewModel extends BaseViewModel {
  final ApiManager _apiManager = ApiManager(locator<LoggingApiClient>());
  int selectedIndex = 0;
  final log = getLogger("DashboardViewModel");
  List<ServicesPOJO> recommendedService = [];
  List<ServicesPOJO> services = [];
  final TextEditingController serialNumberController = TextEditingController();
  final NavigationService _navigationService = locator<NavigationService>();
  bool _isCardVisible = true;
  bool get isCardVisible => _isCardVisible;
  bool get isBusy => busy(this);

  final LocationService _locationService = LocationService();

  final dateController = TextEditingController();
  List<String> states = [];
  List<String> lgas = [];
  String? selectedState;
  String? selectedGender;
  DateTime? selectedDate;

  void setSelectedDate(DateTime date) {
    selectedDate = date;
    notifyListeners();  // Notify the UI to update the TextField
  }

  void hideCard() {
    _isCardVisible = false;
    notifyListeners(); // This will trigger the UI to rebuild
  }

  void changeSelected(int i) {
    selectedIndex = i;
    rebuildUi();
  }

  Future<void> init() async {
    states = await _locationService.fetchStates();
    print('value of states: ${states.first}');
    notifyListeners();
    // await loadServices();
    // await loadRecommended();
  }

  Future<void> onStateSelected(String state) async {
    setBusy(true);
    selectedState = state;
    lgas = await _locationService.fetchLGAs(state);
    notifyListeners();
    setBusy(false);
  }

  Future<void> refreshData() async {
    setBusy(true); // Use this to show loading indicator

    setBusy(false); // Reset loading indicator after data is refreshed
  }
}

