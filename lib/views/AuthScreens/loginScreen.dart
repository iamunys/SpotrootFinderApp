// ignore: file_names

import 'package:spotrootpartner/constant/constant.dart';
import 'package:spotrootpartner/controllers/userStateController.dart';
import 'package:spotrootpartner/widgets/authentication/mobileNumber.dart';
import 'package:spotrootpartner/widgets/authentication/otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  final bool isRegister;
  const LoginScreen({super.key, this.isRegister = false});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneNumberController = TextEditingController();
  final otpController = TextEditingController();
  @override
  void dispose() {
    phoneNumberController.dispose();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
      child: Scaffold(
              backgroundColor: Constant.bgPrimary,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: GetBuilder<UserStateController>(
              init: UserStateController(),
              builder: (userStateController) {
                return Container(
                      height: 100.h,
          width: 100.w,
                  color: Constant.bgPrimary,
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          userStateController.verificationId == null
                              ? Constant.textWithStyle(
                                  text: 'Enter your mobile number',
                                  color: Constant.textPrimary,
                                  size: 20.sp,
                                  maxLine: 5,
                                  fontWeight: FontWeight.bold,
                                )
                              : Constant.textWithStyle(
                                  text: 'Verification code',
                                  color: Constant.textPrimary,
                                  size: 20.sp,
                                  maxLine: 5,
                                  fontWeight: FontWeight.bold,
                                ),
                          SizedBox(
                            height: 1.h,
                          ),
                          userStateController.verificationId == null
                              ? Constant.textWithStyle(
                                  text: 'Please enter your mobile number here!',
                                  color: Constant.textSecondary,
                                  size: 14.sp,
                                  maxLine: 5,
                                  fontWeight: FontWeight.normal,
                                )
                              : Constant.textWithStyle(
                                  text:
                                      'Please enter verification code sent to your number.',
                                  color: Constant.textSecondary,
                                  size: 14.sp,
                                  maxLine: 5,
                                  fontWeight: FontWeight.normal,
                                ),
                          SizedBox(
                            height: 3.h,
                          ),
                          userStateController.verificationId == null
                              ? MobileNumber(
                                  phoneNumberController: phoneNumberController,
                                  userStateController: userStateController,
                                  isRegister: widget.isRegister,
                                )
                              : Otp(
                                  isRegister: widget.isRegister,
                                  userStateController: userStateController,
                                  otpController: otpController,
                                ),
                          SizedBox(
                            height: 1.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
