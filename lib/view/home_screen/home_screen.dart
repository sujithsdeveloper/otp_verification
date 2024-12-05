import 'package:flutter/material.dart';
import 'package:otp_verification/controller/homescreen_controller.dart';
import 'package:otp_verification/widgets/snackbar_widget.dart';
import 'package:stacked/stacked.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final otpController = TextEditingController();

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomescreenController(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(customSnackBar(label: 'OTP Sent Successfully'));

              showDialog(
                context: context,
                builder: (context) => StatefulBuilder(
                    builder: (context, setState) => Dialog(
                          shape: RoundedRectangleBorder(),
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 17),
                            width: double.infinity,
                            height: 266,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.black,
                                      )),
                                ),
                                Text(
                                  'Verify Phone number',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'OTP',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      '*',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        maxLength: 4,
                                        controller: otpController,
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                          counter: SizedBox.shrink(),
                                          hintText: 'Enter OTP',
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: 50,
                                      width: 70,
                                      color: Color(0xffCACED1),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(
                                            () => viewModel.onResendClick(
                                                context: context),
                                          );
                                          otpController.clear();
                                        },
                                        child: Center(
                                            child: viewModel.resendLoading
                                                ? SizedBox(
                                                    height: 20,
                                                    width: 20,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: Colors.black,
                                                    ),
                                                  )
                                                : Text('Resend')),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (otpController.text.isNotEmpty) {
                                      setState(
                                        () => viewModel.checkOTP(
                                          OTP: int.parse(otpController.text),
                                          context: context,
                                        ),
                                      );
                                      otpController.clear();
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(customSnackBar(
                                              label: 'Please enter OTP'));
                                      otpController.clear();
                                    }
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    color: Color(0xffD4DB21),
                                    child: Center(
                                      child: viewModel.verifyLoading
                                          ? SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: CircularProgressIndicator(
                                                color: Colors.black,
                                              ),
                                            )
                                          : Text(
                                              'Verify',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20),
                                            ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
              );
            },
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  'OTP',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
