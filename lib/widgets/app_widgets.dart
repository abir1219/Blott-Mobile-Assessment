import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AppWidgets {
  static Widget titleText(Size size, String title, double fontSize,
      FontWeight fontWeight, Color color,
      {TextAlign textAlign = TextAlign.start,
      String fontFamily = "Roboto",
      int maxLines = 3,
      TextOverflow overflow = TextOverflow.ellipsis}) {
    return Container(
      //width: size.width,
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
      child: Text(
        title,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        style: TextStyle(
          color: color,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
      ),
    );
  }

  static Widget textFormField(Size size, String hintText,
      TextEditingController? controller, void Function(String value) func) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
      child: TextFormField(
        cursorColor: AppColors.APP_SUBTITLE_TEXT_COLOUR,
        onChanged: (value) => func(value),
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
              color: AppColors.APP_SUBTITLE_TEXT_COLOUR,
              fontSize: 14,
              fontWeight: FontWeight.w400),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.APP_SUBTITLE_TEXT_COLOUR,
            ),
          ),
        ),
      ),
    );
  }

  static Widget customButton(Size size, String btnName, void Function() func) {
    return GestureDetector(
      onTap: () => func(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        height: size.height * 0.05,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColors.APP_BUTTON_COLOUR,
        ),
        child: Center(
          child: Text(
            btnName,
            style: const TextStyle(
              color: AppColors.APP_BUTTON_TEXT_COLOUR,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
