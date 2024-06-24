// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
// import 'package:afriprize/core/data/models/order_info.dart' as _i22;
// import 'package:afriprize/core/data/models/order_item.dart' as _i26;
// import 'package:afriprize/core/data/models/product.dart' as _i24;
// import 'package:afriprize/core/data/models/profile.dart' as _i25;
// import 'package:afriprize/ui/components/payment_success_page.dart';
// import 'package:afriprize/ui/views/auth/auth_view.dart' as _i5;
// import 'package:afriprize/ui/views/auth/register.dart';
// import 'package:afriprize/ui/views/cart/add_shipping.dart';
// import 'package:afriprize/ui/views/cart/cart_view.dart' as _i8;
// import 'package:afriprize/ui/views/cart/checkout.dart' as _i11;
// import 'package:afriprize/ui/views/cart/add_shipping.dart' as _i13;
// import 'package:afriprize/ui/views/change_password/change_password_view.dart'
//     as _i17;
// import 'package:afriprize/ui/views/dashboard/dashboard_view.dart' as _i6;
// import 'package:afriprize/ui/views/dashboard/product_detail.dart' as _i12;
// import 'package:afriprize/ui/views/delete_account/delete_account_view.dart'
//     as _i19;
// import 'package:afriprize/ui/views/draws/draws_view.dart' as _i7;
// import 'package:afriprize/ui/views/enter_email/enter_email_view.dart' as _i18;
// import 'package:afriprize/ui/views/home/home_view.dart' as _i2;
// import 'package:afriprize/ui/views/notification/notification_view.dart' as _i9;
// import 'package:afriprize/ui/views/onboarding/onboarding_view.dart' as _i4;
// import 'package:afriprize/ui/views/otp/otp_view.dart' as _i16;
// import 'package:afriprize/ui/views/profile/profile_view.dart' as _i10;
// import 'package:afriprize/ui/views/profile/track.dart' as _i15;
// import 'package:afriprize/ui/views/profile/wallet.dart' as _i14;
// import 'package:afriprize/ui/views/startup/startup_view.dart' as _i3;
// import 'package:afriprize/ui/views/withdraw/withdraw_view.dart' as _i20;
import 'package:flutter/foundation.dart' as _i23;
import 'package:flutter/material.dart' as _i21;
import 'package:flutter/material.dart';
import 'package:nsecure/ui/views/auth/login.dart' as _i5;
import 'package:nsecure/ui/views/startup/startup_view.dart' as i3;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i27;

import '../ui/views/auth/register.dart';
import '../ui/views/change_password/change_password_view.dart'as _i17;
import '../ui/views/dashboard/dashboard_view.dart' as _i7;
import '../ui/views/dashboard/comfirm_id_card.dart' as _i9;
import '../ui/views/home/home_view.dart' as i6;
import '../ui/views/onboarding/onboading_view.dart' as i4;



class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const onboardingView = '/onboarding-view';

  static const loginView = '/login-view';

  static const dashboardView = '/dashboard-view';

  static const confirmIdView = '/confirm-id-view';

  static const profileView = '/profile-view';

  static const otpView = '/otp-view';

  static const changePasswordView = '/change-password-view';

  static const enterEmailView = '/enter-email-view';

  static const deleteAccountView = '/delete-account-view';

  static const registerView = '/register-view';

  static const successView = '/success-view';

  static const all = <String>{
    homeView,
    startupView,
    onboardingView,
    loginView,
    dashboardView,
    profileView,
    otpView,
    changePasswordView,
    enterEmailView,
    deleteAccountView,
    registerView,
    successView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: i6.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.onboardingView,
      page: i4.OnboardingView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i5.Login,
    ),
    _i1.RouteDef(
      Routes.dashboardView,
      page: _i7.DashboardView,
    ),
    _i1.RouteDef(
      Routes.confirmIdView,
      page: _i9.ConfirmIdCard,
    ),
    // _i1.RouteDef(
    //   Routes.profileView,
    //   page: _i10.ProfileView,
    // ),
    // _i1.RouteDef(
    //   Routes.otpView,
    //   page: _i16.OtpView,
    // ),
    _i1.RouteDef(
      Routes.changePasswordView,
      page: _i17.ChangePasswordView,
    ),
    // _i1.RouteDef(
    //   Routes.enterEmailView,
    //   page: _i18.EnterEmailView,
    // ),
    // _i1.RouteDef(
    //   Routes.deleteAccountView,
    //   page: _i19.DeleteAccountView,
    // ),
    _i1.RouteDef(
      Routes.registerView,
      page: Register,
    ),
    // _i1.RouteDef(
    //   Routes.successView,
    //   page: PaymentSuccessPage,
    // ),

  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    i6.HomeView: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const i6.HomeView(),
        settings: data,
      );
    },
    i3.StartupView: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const i3.StartupView(),
        settings: data,
      );
    },
    i4.OnboardingView: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) =>  i4.OnboardingView(),
        settings: data,
      );
     },
    _i5.Login: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.Login(),
        settings: data,
      );
    },
    _i7.DashboardView: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) =>  _i7.DashboardView(),
        settings: data,
      );
    },
    _i9.ConfirmIdCard: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) =>  _i9.ConfirmIdCard(),
        settings: data,
      );
    },
    // _i10.ProfileView: (data) {
    //   return _i21.MaterialPageRoute<dynamic>(
    //     builder: (context) => const _i10.ProfileView(),
    //     settings: data,
    //   );
    // },
    // _i16.OtpView: (data) {
    //   final args = data.getArgs<OtpViewArguments>(nullOk: false);
    //   return _i21.MaterialPageRoute<dynamic>(
    //     builder: (context) => _i16.OtpView(email: args.email, key: args.key),
    //     settings: data,
    //   );
    // },
    _i17.ChangePasswordView: (data) {
      final args = data.getArgs<ChangePasswordViewArguments>(
        orElse: () => const ChangePasswordViewArguments(),
      );
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => _i17.ChangePasswordView(
            isResetPassword: args.isResetPassword, key: args.key),
        settings: data,
      );
    },
    // _i18.EnterEmailView: (data) {
    //   return _i21.MaterialPageRoute<dynamic>(
    //     builder: (context) => const _i18.EnterEmailView(),
    //     settings: data,
    //   );
    // },
    // _i19.DeleteAccountView: (data) {
    //   return _i21.MaterialPageRoute<dynamic>(
    //     builder: (context) => const _i19.DeleteAccountView(),
    //     settings: data,
    //   );
    // },
    Register: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => Register(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}


class OtpViewArguments {
  const OtpViewArguments({
    required this.email,
    this.key,
  });

  final String email;

  final _i23.Key? key;

  @override
  String toString() {
    return '{"email": "$email", "key": "$key"}';
  }

  @override
  bool operator ==(covariant OtpViewArguments other) {
    if (identical(this, other)) return true;
    return other.email == email && other.key == key;
  }

  @override
  int get hashCode {
    return email.hashCode ^ key.hashCode;
  }
}

class ChangePasswordViewArguments {
  const ChangePasswordViewArguments({
    this.isResetPassword = false,
    this.key,
  });

  final bool isResetPassword;

  final _i23.Key? key;

  @override
  String toString() {
    return '{"isResetPassword": "$isResetPassword", "key": "$key"}';
  }

  @override
  bool operator ==(covariant ChangePasswordViewArguments other) {
    if (identical(this, other)) return true;
    return other.isResetPassword == isResetPassword && other.key == key;
  }

  @override
  int get hashCode {
    return isResetPassword.hashCode ^ key.hashCode;
  }
}

extension NavigatorStateExtension on _i27.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChangePasswordView({
    bool isResetPassword = false,
    // _i23.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(Routes.changePasswordView,
        arguments: ChangePasswordViewArguments(
            isResetPassword: isResetPassword,
            // key: key
        ),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }


  Future<dynamic> navigateToRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  ]) async {
    return navigateTo<dynamic>(Routes.registerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToConfirmIdView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  ]) async {
    return navigateTo<dynamic>(Routes.confirmIdView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }


  Future<dynamic> navigateToProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }


  Future<dynamic> navigateToOtpView({
    required String email,
    _i23.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.otpView,
        arguments: OtpViewArguments(email: email, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEnterEmailView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.enterEmailView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDeleteAccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.deleteAccountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }


  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  ]) async {
    return replaceWith<dynamic>(Routes.registerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }



  Future<dynamic> replaceWithProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOtpView({
    required String email,
    _i23.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.otpView,
        arguments: OtpViewArguments(email: email, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChangePasswordView({
    bool isResetPassword = false,
    _i23.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.changePasswordView,
        arguments: ChangePasswordViewArguments(
            isResetPassword: isResetPassword, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEnterEmailView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.enterEmailView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDeleteAccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.deleteAccountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

}
