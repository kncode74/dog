import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/commons/constants/i18n.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/change_language/change_language.view.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/change_language/change_language.vm.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/document_card.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/main_app_bar.dart';
import 'package:getx_mvvm_boilerplate/ui/main_screen/profile_user.vm.dart';
import 'package:getx_mvvm_boilerplate/ui/splash_screen/splash_screen.view.dart';
import 'package:getx_mvvm_boilerplate/ui/splash_screen/splash_screen.vm.dart';

class ProfileUserView extends BaseView<ProfileUserViewModel> {
  ProfileUserView() {
    Get.put(ProfileUserViewModel());
    controller.init();
  }

  @override
  Widget render(BuildContext context) {
    return Obx(() {
      var farm = controller.farmDetail.value;
      return Scaffold(
        backgroundColor: const Color.fromRGBO(248, 247, 247, 1),
        appBar: MainAppBar(title: 'Profile', actions: [
          TextButton(
            onPressed: () {
              Get.to(
                LanguageView(),
                binding: LanguageBinding(),
              );
            },
            child: Icon(
              Icons.language,
              color: Colors.white,
            ),
          )
        ]).defaultAppbar,
        body: SingleChildScrollView(
          child: Column(
            children: [
              DocumentCard(
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor:
                              const Color.fromRGBO(159, 203, 114, 1),
                          child: CircleAvatar(
                            radius: 46,
                            backgroundImage: NetworkImage(farm?.image ?? ''),
                          ),
                        ),
                      ],
                    ),
                    Text(farm?.name ?? ''),
                    Text(farm?.email ?? ''),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            i18n.edit.tr,
                          ),
                        ),
                        SizedBox(width: 20),
                        ElevatedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Get.off(
                              SplashScreenView(),
                              binding: SplashScreenBinding(),
                            );
                          },
                          child: const Text(
                            'Log out',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              DocumentCard(
                widget: Column(
                  children: [
                    Row(
                      children: [
                        Text('เกี่ยวกับเรา'),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: Text(farm?.etc ?? '')),
                      ],
                    ),
                  ],
                ),
              ),
              DocumentCard(
                  widget: Column(
                children: [
                  Row(
                    children: [
                      Text('รายละเอียด'),
                    ],
                  ),
                  Text(farm?.farmName ?? ''),
                  Text(farm?.address ?? ''),
                  Text(farm?.province ?? ''),
                  Text(farm?.city ?? ''),
                  Text(farm?.district ?? ''),
                  Text(farm?.phoneNumber ?? ''),
                  Text(farm?.facebook ?? ''),
                  Text(farm?.line ?? ''),
                  Text(farm?.timeOpen ?? ''),
                  Text(farm?.timeClose ?? ''),
                ],
              ))
            ],
          ),
        ),
      );
    });
  }
}
