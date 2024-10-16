import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:permission_handler/permission_handler.dart';

import '../utils/app_colors.dart';
import '../widgets/app_widgets.dart';
import 'notification_dialog.dart';

class NotificationPermissionScreen extends StatefulWidget {
  const NotificationPermissionScreen({super.key});

  @override
  State<NotificationPermissionScreen> createState() =>
      _NotificationPermissionScreenState();
}

class _NotificationPermissionScreenState
    extends State<NotificationPermissionScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.APP_WHITE_COLOUR, // Set status bar color
      statusBarIconBrightness: Brightness.dark, // Set text/icon color to light
    ));
  }

  Future<void> _requestNotificationPermission() async {

    if (await Permission.notification.isDenied ||
        await Permission.notification.isPermanentlyDenied) {
      PermissionStatus status = await Permission.notification.request();

      if (status.isGranted) {
        if (kDebugMode) {
          print("Notification permission granted");
        }
      } else {
        if (kDebugMode) {
          print("Notification permission denied");
        }
      }
    } else {
      if (kDebugMode) {
        print("Notification permission already granted");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColors.APP_WHITE_COLOUR,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        child: Column(
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/message_notif.svg"),
                Gap(size.height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppWidgets.titleText(size, "Get the most out of Blott", 24,
                        FontWeight.bold, const Color(0xFF1E1F20)),
                    const Icon(
                      Icons.check_box,
                      color: Colors.green,
                      size: 20,
                    ),
                  ],
                ),
                AppWidgets.titleText(
                    size,
                    "Allow notifications to stay in the loop with your payments, requests and groups.",
                    16,
                    textAlign: TextAlign.center,
                    FontWeight.w400,
                    AppColors.APP_SUBTITLE_TEXT_COLOUR)
              ],
            )),
            AppWidgets.customButton(
              size,
              "Continue",
              () => showDialog(context: context, builder: (BuildContext context) {
                return const NotificationDialog();
              })//_requestNotificationPermission(),
            ),
            Gap(size.height * 0.01)
          ],
        ),
      )),
    );
  }
}
