
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:openapi/api.dart';


import '../../app/app.locator.dart';
import '../../app/app.logger.dart';
import '../utils/config.dart';
import '../utils/local_store_dir.dart';
import '../utils/local_stotage.dart';
import 'api_response.dart';
import 'interceptors.dart';

enum HttpMethod { get, post, postRefresh, patch, put, delete }

class ApiService {
  final log = getLogger('ApiService');


  late ApiClient _apiClient;

  ApiService() {
    _initializeClient();
  }

  void _initializeClient() {
    _apiClient = ApiClient(basePath: AppConfig.baseUrl);
    _setAuthorizationHeader();
  }

  ApiClient get apiClient => _apiClient;


  Future<GlobalResponseDtoUserDataPojo> loginUser(LoginRequestDTO loginRequest) async {
    var userApi = UserControllerApi(_apiClient);
    try {
      var response = await userApi.login(loginRequest);
      if (response != null) {
        log.i('Login Request: ${loginRequest.toJson()}');
        log.i('Login Response: ${response.toJson()}');
        return response;
      } else {
        log.i('Error during Login: response is null');
        throw Exception('Login failed, response was null');
      }
    } catch (e) {
      log.e('Error during Login: $e');
      rethrow;
    }
  }


  Future<GlobalResponseDtoUserDataPojo> registerUser(UserRegistrationDTO registrationRequest) async {
    try {
      var userApi = UserControllerApi(_apiClient);
      var response = await userApi.registerUser(registrationRequest);
      if (response != null) {
        log.i('Register Request: ${registrationRequest.toJson()}');
        log.i('Register Response: ${response.toString()}');
        return response as GlobalResponseDtoUserDataPojo;
      } else {
        throw Exception('Registration failed, response was null');
      }
    } catch (e) {
      log.e('Error during Registration: $e');
      rethrow;
    }
  }

  Future<List<ServicesPOJO>> fetchRecommendedServices(int professionId) async {
    final servicesApi = ServiceControllerApi(apiClient);
    try {
      final recommendedServices = await servicesApi.getRecommendedServices(professionId);
      return recommendedServices ?? [];
    } catch (e) {
      log.e('Error getting recommended services: $e');
      return [];
    }
  }

  Future<List<ServicesPOJO>> fetchServices() async {
    final servicesApi = ServiceControllerApi(apiClient);
    try {
      final services = await servicesApi.getAllServices();
      return services ?? [];
    } catch (e) {
      log.e('Error get services: $e');
      return [];
    }
  }




  Future<String> _getToken() async {
    final localStorage = locator<LocalStorage>();
    String? token = await localStorage.fetch(LocalStorageDir.authToken);
    return token ?? "";
  }

  Future<String> _getRefreshToken() async {
    final localStorage = locator<LocalStorage>();
    String? token = await localStorage.fetch(LocalStorageDir.authRefreshToken);
    return token ?? "";
  }

  Future<void> _setAuthorizationHeader() async {
    String token = await _getToken();
    if (token.isNotEmpty) {
      _apiClient.addDefaultHeader('Authorization', 'Bearer $token');
    }
  }


}
