import 'package:blott_mobile_assessment/repository/news_repository.dart';
import 'package:blott_mobile_assessment/router/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/news/news_bloc.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsBloc(NewsRepository()),),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        routerDelegate: AppRouters().routers.routerDelegate,
        routeInformationProvider: AppRouters().routers.routeInformationProvider,
        routeInformationParser: AppRouters().routers.routeInformationParser,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          fontFamily: "Roboto",
          useMaterial3: true,
        ),
      ),
    );
  }
}
