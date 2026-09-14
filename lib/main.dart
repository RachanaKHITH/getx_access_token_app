import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_access_token_app/binding/initial_binding.dart';
import 'package:getx_access_token_app/routes/app_route.dart';
import 'package:getx_access_token_app/translations/messages.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Get Access Token',
      initialBinding: InitialBinding(),
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      initialRoute: "/",
      getPages: AppRoute.getAllRoutes(),
      translations: Messages(), // your translations
      locale: Locale(
        'km',
        'KH',
      ), // translations will be displayed in that locale
      fallbackLocale: Locale(
        'en',
        'UK',
      ), // specify the fallback locale in case an invalid locale is selected.
    );
  }
}
