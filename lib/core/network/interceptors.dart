
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../utils/local_store_dir.dart';
import '../utils/local_stotage.dart';
import 'api_service.dart';

final nav = locator<NavigationService>();

final logInterceptor = PrettyDioLogger(
  requestHeader: true,
  requestBody: true,
  responseBody: true,
  responseHeader: false,
  error: true,
  compact: true,
  maxWidth: 90,
);

int refreshTokenRetryCount = 0;
final int maxRetryCount = 3;
final apiService = locator<ApiService>();
bool isDialogBeingDisplayed = false;

// final requestInterceptors = InterceptorsWrapper(
//   onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
//     handler.next(options);
//   },
//   onResponse: (Response response, ResponseInterceptorHandler handler) {
//     handler.next(response);
//   },
//   onError: (DioError dioError, ErrorInterceptorHandler handler) async {
//     if (!isDialogBeingDisplayed) {
//       isDialogBeingDisplayed = true;
//       String errorMessage = "An unexpected error occurred";
//
//       // Handle specific error responses
//       if (dioError.type == DioErrorType.connectTimeout) {
//         errorMessage = "Connection Timed Out";
//       } else if (dioError.type == DioErrorType.other) {
//         errorMessage = "Network is unreachable";
//       } else if (dioError.type == DioErrorType.receiveTimeout) {
//         errorMessage = "Receive Timed Out";
//       } else if (dioError.response?.statusCode == 401) {
//         errorMessage = "Unauthorized access";
//         // Handle token refresh logic here
//       } else if (dioError.response?.statusCode == 400 || dioError.response?.statusCode == 500) {
//         // Attempt to parse error message from response body
//         try {
//           var responseJson = json.decode(dioError.response?.data);
//           errorMessage = responseJson['message'] ?? errorMessage;
//         } catch (e) {
//           // Failed to parse error message
//         }
//       }
//
//       // Show dialog with the error message
//       await showDialog(errorMessage, null, isDialogBeingDisplayed);
//     }
//
//     handler.next(dioError);
//   },
// );

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _getToken(); // Retrieve the token using your method
    if (token.isNotEmpty) {
      // Add the authorization header
      options.headers['Authorization'] = 'Bearer $token';
    }
    // Continue with the request
    handler.next(options);
  }

  // Add methods to handle responses and errors if needed

  Future<String> _getToken() async {
    final localStorage = locator<LocalStorage>();
    String? token = await localStorage.fetch(LocalStorageDir.authToken);
    return token ?? "";
  }
}


Future<void> showDialog(String message, dynamic data, bool isBeingDisplayed) async {
  if (!isBeingDisplayed) {
    await locator<DialogService>().showDialog(
      title: "Error",
      description: message,
    );
    isDialogBeingDisplayed = false;
  }
}



