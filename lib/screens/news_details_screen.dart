import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../model/news_model.dart';
import '../router/app_pages.dart';
import '../utils/app_colors.dart';
import '../widgets/app_widgets.dart';

class NewsDetailsScreen extends StatefulWidget {
  final NewsModel newsItem;
  const NewsDetailsScreen({super.key, required this.newsItem});

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return PopScope(
      canPop: false,
      /*onPopInvoked: (didPop) {
        if(didPop){
          return;
        }
        context.go(AppPages.NEWS_LIST);
      },*/
      onPopInvokedWithResult: (didPop, result) async{
        if (didPop) {
          return;
        }
        //debugPrint("RESULT--->$result");
        if (context.mounted ) {
          context.go(AppPages.NEWS_LIST);
         //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NewsListScreen(),));
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.APP_HOME_BACKGROUND_COLOUR,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * .02,vertical: size.height * .01),
              child: Column(
                children: [
                  Hero(
                    tag: 'news',
                    child: SizedBox(
                      //margin: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                      height: size.height * 0.35,
                      width: size.width,
                      child: CachedNetworkImage(
                          imageUrl: widget.newsItem.image!,
                          fit: BoxFit.fill,
                          progressIndicatorBuilder: (_, url, download) {
                            return Image.asset(
                              "assets/images/loader.gif",
                            );
                          } // Handle errors
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppWidgets.titleText(size, widget.newsItem.source!, 14, FontWeight.w600, AppColors.APP_WHITE_COLOUR),
                      AppWidgets.titleText(size, DateFormat('d MMMM yyyy').format(DateTime.fromMillisecondsSinceEpoch(widget.newsItem.datetime! * 1000)), 14, FontWeight.w600, AppColors.APP_WHITE_COLOUR),
                    ],
                  ),
                  AppWidgets.titleText(size, widget.newsItem.summary!, 16, FontWeight.w600, AppColors.APP_WHITE_COLOUR),
                ],
              ),
        ),),
      ),
    );
  }
}
