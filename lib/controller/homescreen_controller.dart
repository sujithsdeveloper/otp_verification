import 'package:flutter/material.dart';
import 'package:otp_verification/widgets/snackbar_widget.dart';
import 'package:stacked/stacked.dart';

class HomescreenController extends BaseViewModel {
  bool otpLoading = false;
  bool resendLoading = false;
  bool verifyLoading = false;

  void checkOTP({required int OTP, required BuildContext context}) {
    verifyLoading = true;
    notifyListeners();

    Future.delayed(Duration(seconds: 3), () {
      verifyLoading = false;
      notifyListeners();

      if (OTP == 8806) {
        ScaffoldMessenger.of(context)
            .showSnackBar(customSnackBar(label: 'OTP Verification Success'));
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(customSnackBar(label: 'OTP Verification failed'));
      }
    });
  }

  void onResendClick({required BuildContext context}) {
    resendLoading = true;
    notifyListeners();

    Future.delayed(Duration(seconds: 3), () {
      resendLoading = false;
      notifyListeners();

      ScaffoldMessenger.of(context)
          .showSnackBar(customSnackBar(label: 'OTP Resended'));
    });
  }
}
