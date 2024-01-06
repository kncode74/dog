import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/tabbar.view.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/tabbar.vm.dart';
import 'package:getx_mvvm_boilerplate/ui/navigator_screen/navigator_screen.view.dart';
import 'package:getx_mvvm_boilerplate/ui/navigator_screen/navigator_screen.vm.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splashScreen;

  static final routes = [
    GetPage(
        name: _Paths.splashScreen,
        page: () => NavigatorView(),
        binding: NavigatorBinding()),
    GetPage(
        name: '/tabBar',
        page: () => TabBarDogView(),
        binding: TabBarDogBinding()),
  ];
}
