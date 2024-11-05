import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/apps/routes/app_pages.dart';
import 'package:weather_app/apps/routes/app_routes.dart';
import 'package:weather_app/apps/themes/theme_custom.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initRouuter : man hinh dau tien vao app
      initialRoute: AppRoutes.root,
      getPages: AppPages.pages,
      theme: ThemeCustom.themeLight,
      debugShowCheckedModeBanner: false,
      // home: const Login(),
      // vi du dung home : Login()
      // khi ung dung co dang nhap -> home
      // token còn thì đáng ra là vào Home(), nhưng home: Login() nên dùng token còn hay là hết thì vẫn vào Login()
    );
  }
}
