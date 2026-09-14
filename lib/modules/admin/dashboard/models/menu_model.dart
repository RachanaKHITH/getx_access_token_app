import 'package:getx_access_token_app/routes/route_name.dart';

class MenuModel {
  int? id;
  String? name;
  String? nameKm;
  String? routeName;

  MenuModel({this.id, this.name, this.nameKm, this.routeName});

  static List<MenuModel> getAllMenus() {
    return [
      MenuModel(
        id: 1,
        name: "Home",
        nameKm: "Categories",
        routeName: RouteName.home,
      ),
      MenuModel(
        id: 2,
        name: "Posts",
        nameKm: "Posts",
        routeName: RouteName.adminPosts,
      ),
      MenuModel(
        id: 3,
        name: "Articles",
        nameKm: "Articles",
        routeName: RouteName.home,
      ),
      MenuModel(
        id: 4,
        name: "Category",
        nameKm: "Category",
        routeName: RouteName.home,
      ),
    ];
  }
}
