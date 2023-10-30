import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_stacked_architecture/gen/assets.gen.dart';
import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    String title = "New Update Available";
    String message =
        "There is a newer version of app available please update it now.";
    String btnLabel = "Update Now";
    String btnLabelCancel = "Later";
    return Scaffold(
      backgroundColor: const Color(0xFF128c7e),
      body: Stack(
        children: [
          Center(
              child: Assets.images.startupImage
                  .image(height: 0.1.sh, width: 0.1.sh)),
          FutureBuilder(
            future: viewModel.isLatestVersion(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == false) {
                  return Platform.isIOS
                      ? CupertinoAlertDialog(
                          title: Text(
                            title,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          content: Text(message),
                          actions: <Widget>[
                            ElevatedButton(
                              child: Text(btnLabel),
                              onPressed: () => viewModel.launchURL(Uri.parse(
                                  "https://apps.apple.com/us/app/pubg-mobile/id1330123889")),
                            ),
                            ElevatedButton(
                              child: Text(btnLabelCancel),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        )
                      : AlertDialog(
                          title: Text(title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: Colors.black, fontSize: 25.sp)),
                          content: Text(message,
                              style: Theme.of(context).textTheme.bodyLarge),
                          actions: <Widget>[
                            ElevatedButton(
                              child: Text(btnLabel),
                              onPressed: () => viewModel.launchURL(Uri.parse(
                                  "https://play.google.com/store/apps/details?id=com.tencent.ig&hl=en&gl=US&pli=1")),
                            ),
                            ElevatedButton(
                              child: Text(btnLabelCancel),
                              onPressed: () => viewModel.navigateToLoginView(),
                            ),
                          ],
                        );
                } else {
                  return const SizedBox();
                }
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
