import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';

void handleApiError(DioError dioError) {
  String errorMessage = "An unexpected error occurred";

  // Determine the error message
  switch (dioError.type) {
    case DioErrorType.connectTimeout:
      errorMessage = "Connection Timed Out";
      break;
    case DioErrorType.other:
      errorMessage = "Network is unreachable";
      break;
    case DioErrorType.receiveTimeout:
      errorMessage = "Receive Timed Out";
      break;
    case DioErrorType.response:
      if (dioError.response?.statusCode == 401) {
        errorMessage = "Unauthorized access";
      } else if (dioError.response?.statusCode == 400 || dioError.response?.statusCode == 500) {
        try {
          var responseJson = json.decode(dioError.response?.data);
          errorMessage = responseJson['message'] ?? errorMessage;
        } catch (e) {
          // Failed to parse error message
        }
      }
      break;
    default:
      break;
  }

  // Show modal dialog with the error message
  showDialogWithMessage(errorMessage);
}

void showDialogWithMessage(String message) {
  DialogService dialogService = locator<DialogService>();
  dialogService.showDialog(
    title: "Error",
    description: message,
    buttonTitle: "Close",
    dialogPlatform: DialogPlatform.Material,
  );
}
