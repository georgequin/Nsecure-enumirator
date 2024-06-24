import 'package:stacked/stacked.dart';

import 'package:nsecure/app/app.locator.dart';

import '../../../core/utils/local_store_dir.dart';
import '../../../core/utils/local_stotage.dart';

class OnboardingViewModel extends BaseViewModel {
  final LocalStorage _localStorage = locator<LocalStorage>();

  Future<void> init() async {
    setBusy(true);
    await _localStorage.save(LocalStorageDir.onboarded, true);
    setBusy(false);
  }
}
