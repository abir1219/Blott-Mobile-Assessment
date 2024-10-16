
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/app_pages.dart';
import '../utils/app_colors.dart';
import '../widgets/app_widgets.dart';

class NotificationDialog extends StatefulWidget {
  const NotificationDialog({super.key});

  @override
  State<NotificationDialog> createState() => _NotificationDialogState();
}

class _NotificationDialogState extends State<NotificationDialog> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Dialog(
      backgroundColor: AppColors.APP_WHITE_COLOUR,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      insetPadding: EdgeInsets.symmetric(
          vertical: size.height * 0.368, horizontal: size.width * .15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppWidgets.titleText(
              size,
              "“Blott” Would Like to Send You Notifications",
              17,
              FontWeight.w600,
              AppColors.APP_BACKGROUND_COLOUR,
              textAlign: TextAlign.center,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: AppWidgets.titleText(
              size,
              "Notifications may include alerts, sounds, and icon badges. These can be configured in Settings.",
              13,
              FontWeight.w400,
              AppColors.APP_BACKGROUND_COLOUR,
              textAlign: TextAlign.center,),
          ),
          Divider(color: const Color(0xFF3C3C43).withOpacity(0.36),thickness: 0.5,),
           Row(
            children: [
              const Expanded(child: Center(child: Text("Don't Allow",style: TextStyle(color: AppColors.APP_ALERT_BUTTON_TEXT_COLOUR,fontSize: 17,fontWeight: FontWeight.w300),),)),
              const VerticalDivider(color:Colors.red,thickness: 0.5,width: 10,),
              Expanded(child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    context.go(AppPages.NEWS_LIST);
                  },
                  child: const Center(child: Text("Allow",style: TextStyle(color: AppColors.APP_ALERT_BUTTON_TEXT_COLOUR,fontSize: 17,fontWeight: FontWeight.w500),),))),
            ],
          )
        ],
      ),
    );
  }
}
