import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_stacked_architecture/app/app.locator.dart';
import 'package:whatsapp_stacked_architecture/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic
  }

  Future<bool> isLatestVersion() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    debugPrint("infoVersion --------> ${info.version}");
    double currentVersion =
        double.parse(info.version.trim().replaceAll(".", ""));
    final remoteConfig = FirebaseRemoteConfig.instance;
    try {
      // Using default duration to force fetching from remote server.
      await remoteConfig.fetchAndActivate();

      double newVersion = double.parse(remoteConfig
          .getString('force_update_current_version')
          .trim()
          .replaceAll(".", ""));

      if (newVersion > currentVersion) {
        return false;
      } else {
        await Future.delayed(const Duration(seconds: 3));
        _navigationService.navigateToLoginView();
        return true;
      }
    } on FirebaseException {
      _navigationService.replaceWithLoginView();
      // Fetch throttled.
    } catch (exception) {
      _navigationService.replaceWithLoginView();
    }
    return true;
  }

  launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void navigateToLoginView() {
    _navigationService.replaceWith(Routes.loginView);
  }
}
