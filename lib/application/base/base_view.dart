import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_controller.dart';
import 'package:getx_mvvm_boilerplate/application/life_circle.dart';

abstract class BaseView<Controller extends BaseController>
    extends GetView<Controller> implements LifeCycleListener {
  Widget render(BuildContext context);

  final _ContextHolder _contextHolder = _ContextHolder();

  bool isInitial = false;

  BaseView({super.key});

  BuildContext? get context => _contextHolder.context;

  @override
  Widget build(BuildContext context) {
    _contextHolder.context = context;
    Future.delayed(const Duration(seconds: 0), () {
      if (!isInitial) {
        onInit();
        isInitial = true;
      }
    });
    return render(context);
  }

  Widget showMessageDialog(String message) {
    return Container();
  }

  void onInit() {}

  @override
  void onBuild() {}

  @override
  void onDispose() {}

  @override
  void onResume() {}

  @override
  void onPause() {}

  @override
  void onInactive() {}

  @override
  void onDetach() {}

  Widget loading() {
    return Container();
  }
}

class _ContextHolder {
  BuildContext? context;
}
