
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../core/network/api_service.dart';
import '../core/utils/local_stotage.dart';
import '../ui/bottom_sheets/notice/notice_sheet.dart';
import '../ui/dialogs/info_alert/info_alert_dialog.dart';
import 'model/repositories/repository.dart';

// @stacked-import

@StackedApp(
  logger: StackedLogger(),
  routes: [
    // MaterialRoute(page: HomeView),
    // MaterialRoute(page: StartupView),
    // MaterialRoute(page: OnboardingView),
    // MaterialRoute(page: AuthView),
    // MaterialRoute(page: DashboardView),
    // MaterialRoute(page: DrawsView),
    // MaterialRoute(page: CartView),
    // MaterialRoute(page: NotificationView),
    // MaterialRoute(page: ProfileView),
    // MaterialRoute(page: Checkout),
    // MaterialRoute(page: ProductDetail),
    // MaterialRoute(page: Wallet),
    // MaterialRoute(page: Track),
    //
    // MaterialRoute(page: OtpView),
    // MaterialRoute(page: ChangePasswordView),
    // MaterialRoute(page: EnterEmailView),
    // MaterialRoute(page: DeleteAccountView),
    // MaterialRoute(page: WithdrawView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: LocalStorage),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
