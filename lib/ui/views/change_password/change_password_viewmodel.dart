
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../core/network/api_manager.dart';
import '../../../core/network/loggingApiClient.dart';

class ChangePasswordViewModel extends BaseViewModel {

  final log = getLogger("EnterEmailViewModel");
  final ApiManager _apiManager = ApiManager(locator<LoggingApiClient>());
  final email = TextEditingController();
  final code = TextEditingController();
  final newPassword = TextEditingController();
  final oldPassword = TextEditingController();
  final snackBar = locator<SnackbarService>();
  bool emailVerified = false;
  bool obscure = true;

  void toggleObscure() {
    obscure = !obscure;
    rebuildUi();
  }

  void sendCode() async {
    setBusy(true);

    try {
      var dto = EmailVerificationDTO(email: email.text);
      var response = await _apiManager.performApiCall(
          apiCall: () => UserControllerApi(_apiManager.apiClient).passwordReset(dto),
          endpoint: 'reset password '
      );
      print('response is : $response');
      if (response != null && response.success) {
        snackBar.showSnackbar(message: "Verification code sent", duration: const Duration(seconds: 4));
        emailVerified = true;
        rebuildUi();
      } else {
        snackBar.showSnackbar(message: "User not found", duration: const Duration(seconds: 4));
      }
    } catch (e) {
        snackBar.showSnackbar(message: "Verification code sent", duration: const Duration(seconds: 4));
        emailVerified = true;
        rebuildUi();

      // log.e(e);
    }

    setBusy(false);
  }

  void changePassword(context, bool isResetPassword) async {
    setBusy(true);

    try {
      var dto = VerifyPasswordCodeDTO(email: email.text, code: code.text, newPassword: newPassword.text);
      var response = await _apiManager.performApiCall(
          apiCall: () => UserControllerApi(_apiManager.apiClient).verifyCode(dto),
          endpoint: 'reset password '
      );
      print('response is : $response');
      if (response != null && response.success) {
        snackBar.showSnackbar(message: "Password Updated", duration: const Duration(seconds: 4));
        Navigator.pop(context);
      } else {
        snackBar.showSnackbar(message: "Unable to reset password", duration: const Duration(seconds: 4));
      }
    } catch (e) {
      snackBar.showSnackbar(message: "Password Updated", duration: const Duration(seconds: 4));
      Navigator.pop(context);

      // log.e(e);
    }

    // try {
    //   ApiResponse res = isResetPassword
    //       ? await repo.resetPassword(
    //           {
    //             "code": int.parse(code.text.toString()),
    //             "password": newPassword.text,
    //           },
    //           email.text,
    //         )
    //       : await repo.updatePassword(
    //           {
    //             // "code": int.parse(code.text.toString()),
    //             "oldpassword": oldPassword.text,
    //             "newpassword": newPassword.text,
    //           },
    //           email.text,
    //         );
    //   if (res.statusCode == 200) {
    //     snackBar.showSnackbar(message: "Updated");
    //     Navigator.pop(context);
    //   }
    // } catch (e) {
    //   log.e(e);
    // }

    setBusy(false);
  }
}
