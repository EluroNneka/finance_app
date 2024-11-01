import 'package:finance_app/core/utils/overlay_util.dart';
import 'package:finance_app/nav/routes.dart';
import 'package:finance_app/style/theme.dart';
import 'package:finance_app/ui/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(OverlayUtil.lightStat);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 812),
      builder: (c, _) => GetMaterialApp(
        home: const SplashView(),
        theme: appTheme,
        getPages: Routers().views,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
