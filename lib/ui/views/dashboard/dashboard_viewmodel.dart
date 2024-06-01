import 'dart:convert';


import 'package:kenmack/core/network/loggingApiClient.dart';
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


class DashboardViewModel extends BaseViewModel {

  final ApiManager _apiManager = ApiManager(locator<LoggingApiClient>());

  int selectedIndex = 0;
  final log = getLogger("DashboardViewModel");
  List<ServicesPOJO> recommendedService = [];
  List<ServicesPOJO> services = [];

  bool _isCardVisible = true;

  bool get isCardVisible => _isCardVisible;

  bool get isBusy => busy(this);


  void hideCard() {
    _isCardVisible = false;
    notifyListeners(); // This will trigger the UI to rebuild
  }

  void changeSelected(int i) {
    selectedIndex = i;
    rebuildUi();
  }

  Future<void> init() async {
    await loadServices();
    await loadRecommended();
    notifyListeners();
  }

  Future<void> loadServices() async {
    String? storedServicesJson = await locator<LocalStorage>().fetch(LocalStorageDir.service);
    if (storedServicesJson != null) {
      services = decodeServicesList(storedServicesJson);
    } else {
      await getServices();
    }
  }

  Future<void> loadRecommended() async {
    String? storedRecommendedServicesJson = await locator<LocalStorage>().fetch(LocalStorageDir.recommendedService);
    if (storedRecommendedServicesJson != null) {
      recommendedService = decodeServicesList(storedRecommendedServicesJson);
    } else {
      await getRecommended();
    }
    notifyListeners();
  }


  Future<void> refreshData() async {
    setBusy(true); // Use this to show loading indicator
    getResourceList();
    setBusy(false); // Reset loading indicator after data is refreshed
  }

  void getResourceList(){
    getServices();
    getRecommended();
    // if (userLoggedIn.value == true) {
    //   initCart();
    //   getNotifications();
    // }
  }

  Future<void> getServices() async {
    setBusyForObject(services, true);
    try {
      services = await _apiManager.performApiCall(
          apiCall: () => ServiceControllerApi(_apiManager.apiClient).getAllServices(),
          endpoint: 'services'
      );
      await locator<LocalStorage>().save(LocalStorageDir.service, encodeServicesList(services));
      notifyListeners();
    } catch (e) {
      log.e(e);
    }finally {
      setBusy(false);
    }
    setBusyForObject(services, false);
  }


  Future<void> getRecommended() async {
    setBusyForObject(recommendedService, true);
    try {
      recommendedService = await _apiManager.performApiCall(
        apiCall: () => ServiceControllerApi(_apiManager.apiClient).getRecommendedServices(profile.value.profession!.id!),
        endpoint: 'recommended'
      );
        await locator<LocalStorage>().save(LocalStorageDir.recommendedService, encodeServicesList(recommendedService));
        notifyListeners();

    } catch (e) {
      log.e(e);
    }finally {
      setBusy(false);
    }
    setBusyForObject(recommendedService, false);
  }

  String encodeServicesList(List<ServicesPOJO> services) {
    return jsonEncode(services.map((service) => service.toJson()).toList());
  }

  // Use this to decode a JSON string into a list of services
  List<ServicesPOJO> decodeServicesList(String servicesJson) {
    Iterable l = json.decode(servicesJson);
    List<ServicesPOJO> services = List<ServicesPOJO>.from(l.map((model) => ServicesPOJO.fromJson(model)));
    return services;
  }


}
