import 'package:nsecure/core/network/loggingApiClient.dart';
import 'package:nsecure/state.dart';
import 'package:openapi/api.dart';
import '../app/app.locator.dart';
import '../core/network/api_manager.dart';

class ProfileUtil {
  final ApiManager _apiManager = ApiManager(locator<LoggingApiClient>());

  Future<void> getProfile() async {
    try {
      UserPOJO userPOJO = await _apiManager.performApiCall(
        apiCall: () => UserControllerApi(_apiManager.apiClient).getUserDetails(profile.value.id!),
        endpoint: 'user details',
      );
      profile.value = userPOJO;
    } catch (e) {
      print("Error fetching user profile: $e");
    }
  }

  
}

