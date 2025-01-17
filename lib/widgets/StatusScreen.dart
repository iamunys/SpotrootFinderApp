import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootpartner/constant/constant.dart';
import 'package:spotrootpartner/controllers/FirebaseStore/spotRepository.dart';
import 'package:spotrootpartner/controllers/apiController.dart';
import 'package:spotrootpartner/controllers/userStateController.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () async {
      await Get.find<ApiController>()
          .getSpotMethod(id: Get.find<UserStateController>().currentUser!.uid);
      Get.back();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.bgPrimary,
      body: Container(
        padding: const EdgeInsets.all(15),
        color: Constant.bgPrimary,
        height: 100.h,
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(0),
              height: 30.w,
              width: 30.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Center(
                  child: Image.asset(
                'lib/constant/icons/checked.png',
              )),
            ),
            SizedBox(
              height: 1.h,
            ),
            Constant.textWithStyle(
              text: 'Thank You',
              color: Constant.textPrimary,
              size: 20.sp,
              maxLine: 5,
              fontWeight: FontWeight.bold,
            ),
            Constant.textWithStyle(
              text: 'Successfully Uploaded Spot Details.',
              color: Constant.textSecondary,
              size: 14.sp,
              maxLine: 5,
              fontWeight: FontWeight.normal,
            ),
          ],
        ),
      ),
    );
  }
}
