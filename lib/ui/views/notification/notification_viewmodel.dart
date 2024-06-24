import 'dart:convert';

import 'package:nsecure/core/network/interceptors.dart';
import 'package:openapi/api.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../core/utils/local_store_dir.dart';
import '../../../core/utils/local_stotage.dart';
import '../../../state.dart';


class NotificationViewModel extends BaseViewModel {

  int selectedIndex = 0;
  final log = getLogger("DashboardViewModel");
  List<ServicesPOJO> recommendedService = [];
  List<ServicesPOJO> services = [];

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
      services = await apiService.fetchServices();
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
      recommendedService = await apiService.fetchRecommendedServices(profile.value.profession!.id!);
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
    return jsonEncode(services.map((ServicesPOJO) => ServicesPOJO.toJson()).toList());
  }

  // Use this to decode a JSON string into a list of services
  List<ServicesPOJO> decodeServicesList(String servicesJson) {
    Iterable l = json.decode(servicesJson);
    List<ServicesPOJO> services = List<ServicesPOJO>.from(l.map((model) => ServicesPOJO.fromJson(model)));
    return services;
  }


}
