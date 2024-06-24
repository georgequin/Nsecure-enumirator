
import 'package:flutter/material.dart';
import 'package:nsecure/app/app.router.dart';
import 'package:nsecure/ui/views/account/account_view.dart';
import 'package:nsecure/ui/views/notification/notification_view.dart';
import 'package:nsecure/ui/views/services/service_view.dart';
import 'package:openapi/api.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.bottomsheets.dart';
import '../../../app/app.dialogs.dart';
import '../../../app/app.locator.dart';
import '../../../state.dart';
import '../../common/app_colors.dart';
import '../../common/app_strings.dart';
import '../../common/ui_helpers.dart';
import '../../components/submit_button.dart';
import '../dashboard/dashboard_view.dart';


class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  List<ServicesPOJO> services = [];
  List<Widget> pages = [
     DashboardView(),
     ServiceView(),
     NotificationView(),
     AccountView(),
    // const CartView(),
    // const NotificationView(),
    // const ProfileView()
  ];

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;
  int selectedTab = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }


  void init() async {

  }

  void changeSelected(int i) {
    if (i != 0 && !userLoggedIn.value) {
      showModalBottomSheet(
          context: StackedService.navigatorKey!.currentState!.context,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20))),
          builder: (ctx) {
            return Container(
              padding: const EdgeInsets.all(30),
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("You need to login to continue"),
                  verticalSpaceMedium,
                  SubmitButton(
                    isLoading: false,
                    label: "Login",
                    submit: () {
                      locator<NavigationService>().replaceWithLoginView();
                    },
                    color: kcPrimaryColor,
                  )
                ],
              ),
            );
          });
      return;
    }
    selectedTab = i;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
