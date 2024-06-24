
import '../../app/app.locator.dart';
import '../utils/config.dart';
import '../utils/local_store_dir.dart';
import '../utils/local_stotage.dart';
import 'loggingApiClient.dart';

class ApiManager {
  late LoggingApiClient apiClient;

  ApiManager(this.apiClient) {
    _initializeClient();
  }


  void _initializeClient() {
    apiClient = LoggingApiClient(basePath: AppConfig.baseUrl);
    _setAuthorizationHeader();
  }

  Future<void> _setAuthorizationHeader() async {
    String token = await _getToken();
    if (token.isNotEmpty) {
      apiClient.addDefaultHeader('Authorization', 'Bearer $token');
    }
  }

  Future<String> _getToken() async {
    final localStorage = locator<LocalStorage>();
    String? token = await localStorage.fetch(LocalStorageDir.authToken);
    return token ?? "";
  }

  Future<dynamic> performApiCall<T>({
    required Future<T> Function() apiCall,
    String? endpoint
  }) async {
    return await apiCall();
  }


}
