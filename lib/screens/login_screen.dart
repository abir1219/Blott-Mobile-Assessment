
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../router/app_pages.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../utils/sharedpreference_utils.dart';
import '../widgets/app_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  bool isButtonActive = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.APP_WHITE_COLOUR, // Set status bar color
      statusBarIconBrightness: Brightness.dark, // Set text/icon color to light
    ));
  }

  void _validateForm() {
    setState(() {
      isButtonActive = _firstNameController.text.isNotEmpty &&
          _lastNameController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(size.height * 0.02),
              AppWidgets.titleText(size, "Your legal name", 30, FontWeight.bold,
                  AppColors.APP_TITLE_TEXT_COLOUR),
              AppWidgets.titleText(
                  size,
                  "We need to know a bit about you so that we can create your account.",
                  16,
                  FontWeight.w400,
                  AppColors.APP_SUBTITLE_TEXT_COLOUR),
              Gap(size.height * 0.01),
              SingleChildScrollView(
                child: Column(
                  children: [
                    AppWidgets.textFormField(
                      size,
                      "First name",
                      _firstNameController,
                          (value) {
                        debugPrint("First name-->$value");
                        _validateForm();
                      },
                    ),
                    AppWidgets.textFormField(
                      size,
                      "Last name",
                      _lastNameController,
                          (value) {
                        debugPrint("Last name-->$value");
                        _validateForm();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: isButtonActive == false
            ? AppColors.APP_BUTTON_COLOUR.withOpacity(0.3)
            : AppColors.APP_BUTTON_COLOUR,
        elevation: 0,
        onPressed: () async {
          if (isButtonActive) {
            await SharedPreferencesUtils.init();
            await SharedPreferencesUtils.saveString(
                AppConstants.FIRST_NAME, _firstNameController.text.trim());
            await SharedPreferencesUtils.saveString(
                AppConstants.LAST_NAME, _lastNameController.text.trim());
            if(mounted){
              context.go(AppPages.NOTIFICATION_PERMISSION);
            }
          } else {}
        },
        shape: const CircleBorder(),
        child: const Icon(
          Icons.arrow_forward_ios_sharp,
          color: AppColors.APP_WHITE_COLOUR,
          size: 20,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }
}
