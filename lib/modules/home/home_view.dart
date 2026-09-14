import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_access_token_app/constants/constant_language.dart';
import 'package:getx_access_token_app/routes/route_name.dart';
import 'package:getx_access_token_app/data/local/token_storage.dart';
import 'package:getx_access_token_app/modules/home/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(child: Column()),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Get.toNamed(RouteName.adminDashboard);
              },
              leading: Icon(Icons.dashboard, color: Colors.cyan),
              trailing: Icon(Icons.navigate_next, color: Colors.cyan),
              title: Text(
                ConstantLanguage.dashboard.tr,
                style: TextStyle(
                  color: Colors.cyan,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(ConstantLanguage.home.tr),
        backgroundColor: Colors.cyan,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              TokenStorage.removeToken();
              Get.offNamed(RouteName.splash);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(child: Text("Home Page")),
    );
  }
}
