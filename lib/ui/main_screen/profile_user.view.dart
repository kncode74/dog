import 'package:flutter/material.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/main_app_bar.dart';
import 'package:getx_mvvm_boilerplate/ui/main_screen/profile_user.vm.dart';

class ProfileUserView extends BaseView<ProfileUserViewModel> {
  @override
  Widget render(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: 'Profile').defaultAppbar,
      body: Center(child: Text('profile')),
    );
  }
}
