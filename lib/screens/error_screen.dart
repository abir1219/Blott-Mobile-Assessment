import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../utils/sharedpreference_utils.dart';
import '../widgets/app_widgets.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({super.key});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * .02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppWidgets.titleText(size, "Hey ${SharedPreferencesUtils.getString(AppConstants.FIRST_NAME)}", 24, FontWeight.w600,
                AppColors.APP_WHITE_COLOUR,
                fontFamily: "Raleway"),
            Gap(size.height * .04),
            AppWidgets.titleText(size, "Something went wrong. Please try again later.", 16, FontWeight.w500,
                AppColors.APP_WHITE_COLOUR,
                fontFamily: "Rubik"),
          ],
        ),
      ),),
    );
  }
}
