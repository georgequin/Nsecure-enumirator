import 'dart:convert';

import 'package:nsecure/core/network/loggingApiClient.dart';
import 'package:stacked/stacked.dart';
import 'package:openapi/api.dart';

import '../../../app/app.locator.dart';
import '../../../core/network/api_manager.dart';
import '../../../core/utils/local_store_dir.dart';
import '../../../core/utils/local_stotage.dart';

class ServiceViewModel extends BaseViewModel {
  List<ServicesPOJO> services = [];
  List<ServicesPOJO> filteredServices = [];
  String searchQuery = '';
  final ApiManager _apiManager = ApiManager(locator<LoggingApiClient>());

  ServiceViewModel() {
    fetchServices();
  }

  void init() {
    fetchServices();
  }

  Future fetchServices() async {
    setBusy(true);
    await loadServices();
    filteredServices = services;
    setBusy(false);
    notifyListeners();
  }

  Future<void> refreshData() async {
    setBusy(true);
    await fetchServices();
    setBusy(false);
  }

  Future<void> loadServices() async {
    String? storedServicesJson = await locator<LocalStorage>().fetch(LocalStorageDir.service);
    if (storedServicesJson != null) {
      services = decodeServicesList(storedServicesJson);
    } else {
      await getServices();
    }
  }

  List<ServicesPOJO> decodeServicesList(String servicesJson) {
    Iterable l = json.decode(servicesJson);
    List<ServicesPOJO> services = List<ServicesPOJO>.from(l.map((model) => ServicesPOJO.fromJson(model)));
    return services;
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
      print(e);
    }finally {
      setBusy(false);
    }
    setBusyForObject(services, false);
  }

  String encodeServicesList(List<ServicesPOJO> services) {
    return jsonEncode(services.map((service) => service.toJson()).toList());
  }

  void updateSearchQuery(String query) {
    searchQuery = query;
    if (searchQuery.isEmpty) {
      filteredServices = services;
    } else {
      filteredServices = services.where((service) {
        return service.title!.toLowerCase().contains(searchQuery.toLowerCase()) ||
            service.provider!.toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}
