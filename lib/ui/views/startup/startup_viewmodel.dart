import 'dart:convert';

import 'package:nsecure/app/app.router.dart';
import 'package:openapi/api.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../core/utils/local_store_dir.dart';
import '../../../core/utils/local_stotage.dart';
import '../../../state.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));


    String? token = await locator<LocalStorage>().fetch(LocalStorageDir.authToken);
    String? userJson = await locator<LocalStorage>().fetch(LocalStorageDir.authUser);
    bool? onboarded = await locator<LocalStorage>().fetch(LocalStorageDir.onboarded);

    if (onboarded == null || onboarded == false) {
      _navigationService.replaceWithOnboardingView();
    } else {
      if (token != null && userJson != null) {
        print('token is not null, user isnt also');
        userLoggedIn.value = true;
        Map<String, dynamic> userMap = jsonDecode(userJson);
        UserPOJO user = UserPOJO.fromJson(userMap)!;
        profile.value = user;
        _navigationService.replaceWithHomeView();
      }else{
        print('both token and user is null');
        _navigationService.replaceWithLoginView();
      }

    }
  }
}
