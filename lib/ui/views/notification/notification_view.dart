
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../components/empty_state.dart';
import 'notification_viewmodel.dart';

class NotificationView extends StackedView<NotificationViewModel> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context,
      NotificationViewModel viewModel,
      Widget? child,
      ) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Notification",
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: const EmptyState(
          animation: "empty_notifications.json",
          label: "No Notifications Yet",
        ),
      ),
    );
  }

  @override
  NotificationViewModel viewModelBuilder(
      BuildContext context,
      ) =>
      NotificationViewModel();
}
