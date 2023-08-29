// ignore_for_file: prefer_final_fields, unused_local_variable, unnecessary_overrides, unused_element, unused_import, unnecessary_const

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_cli/app/modules/home/views/home_view.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class FingerandfaceauthController extends GetxController {
  //TODO: Implement FingerandfaceauthController
  var _localAuth = LocalAuthentication();
  var hasFingerPrintLock = false.obs;
  var hasFaceLock = false.obs;
  var isUserAuthenticated = false.obs;

  void _getAllBiometrics() async {
    // Check whether there is local authentication available on this device or not
    bool hasLocalAuthentication = await _localAuth.canCheckBiometrics;
    if (hasLocalAuthentication) {
      List<BiometricType> availableBiometrics =
          await _localAuth.getAvailableBiometrics();
      print('Available biometrics: $availableBiometrics');
      hasFaceLock.value = availableBiometrics.contains(BiometricType.face);
      hasFingerPrintLock.value =
          availableBiometrics.contains(BiometricType.fingerprint);
    } else {
      showSnackBar(
          title: "Error",
          message: 'Local Authentication not available',
          backgroundColor: Colors.red);
    }
  }

  void showSnackBar(
      {required String title,
      required String message,
      required Color backgroundColor}) {
    Get.snackbar(title, message,
        colorText: Colors.white,
        backgroundColor: backgroundColor,
        snackPosition: SnackPosition.BOTTOM);
  }

  @override
  void onInit() {
    super.onInit();
    _getAllBiometrics();
  }

  @override
  void onClose() {}

  void authenticateUser() async {
    try {
      const androidMessage = const AndroidAuthMessages(
        cancelButton: 'Cancel',
        goToSettingsButton: 'settings',
        goToSettingsDescription: 'Please set up your Fingerprint/Face.',
        biometricHint: 'Verify your identity',
      );
      isUserAuthenticated.value = await _localAuth.authenticate(
        localizedReason: 'Authenticate Yourself',
        biometricOnly: true,
        useErrorDialogs: true,
        stickyAuth: true,
        androidAuthStrings: androidMessage,
      );
      if (isUserAuthenticated.value) {
        Get.snackbar("Success","You are authenticated");
        // showSnackBar(
        //     title: "Success",
        //     message: "You are authenticated",
        //     backgroundColor: Colors.green);
        Get.to(HomeView());
      } else {
        showSnackBar(
            title: "Error",
            message: "Authentication Cancelled",
            backgroundColor: Colors.red);
      }
    } catch (e) {
      showSnackBar(
          title: "Error", message: e.toString(), backgroundColor: Colors.red);
    }
  }
}
