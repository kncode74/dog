import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/assets/r.dart';
import 'package:getx_mvvm_boilerplate/commons/constants/i18n.dart';
import 'package:getx_mvvm_boilerplate/ui/_theme/app_theme.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/cached_network_image_widget.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/change_language/change_language.view.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/change_language/change_language.vm.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/document_card.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/document_content.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/document_widget/general_text_content.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/main_app_bar.dart';
import 'package:getx_mvvm_boilerplate/ui/main_screen/user/profile_user.vm.dart';
import 'package:getx_mvvm_boilerplate/ui/splash_screen/splash_screen.view.dart';
import 'package:getx_mvvm_boilerplate/ui/splash_screen/splash_screen.vm.dart';

class ProfileUserView extends BaseView<ProfileUserViewModel> {
  ProfileUserView() {
    Get.put(ProfileUserViewModel());
    controller.init();
  }

  Widget _leading(
    String image,
    String email,
    String name,
  ) {
    return DocumentCard(
      widget: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CachedNetworkImageWidget(
                  imageUrl: image,
                  imageDefaultUrl: icon.placeHolder,
                  imageWidgetBuilder: (context, imageProvider) {
                    return CircleAvatar(
                      radius: 50,
                      backgroundImage: imageProvider,
                    );
                  },
                ),
              ],
            ),
          ),
          Text(name),
          Text(email),
          _button()
        ],
      ),
    );
  }

  Widget _button() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            Get.to(
              SplashScreenView(),
              binding: SplashScreenBinding(),
            );
          },
          child: Text(
            i18n.logout.tr,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(width: 10),
        OutlinedButton(
          onPressed: () {},
          child: Text(i18n.edit.tr),
        )
      ],
    );
  }

  @override
  Widget render(BuildContext context) {
    return Obx(
      () {
        var farm = controller.farmDetail.value;
        return Scaffold(
          backgroundColor: ThemeData().background1(),
          appBar: MainAppBar(title: 'Profile', actions: [
            TextButton(
              onPressed: () {
                Get.to(
                  LanguageView(),
                  binding: LanguageBinding(),
                );
              },
              child: const Icon(
                Icons.language,
                color: Colors.white,
              ),
            )
          ]).mainAppbar,
          body: SingleChildScrollView(
            child: Column(
              children: [
                _leading(
                  farm?.image ?? '',
                  farm?.name ?? '',
                  farm?.email ?? '',
                ),
                DocumentCard(
                  widget: Column(
                    children: [
                      DocumentContent(
                        title: i18n.information.tr,
                        widgetList: [
                          Text(farm?.etc ?? ''),
                        ],
                      ),
                      DocumentContent(
                        title: i18n.information.tr,
                        widgetList: [
                          GeneralTextContent(
                            i18n.farmName.tr,
                            farm?.farmName ?? '',
                          ),
                          GeneralTextContent(
                            i18n.address.tr,
                            farm?.address ?? '',
                          ),
                          GeneralTextContent(
                            i18n.address.tr,
                            farm?.phoneNumber ?? '',
                          ),
                          GeneralTextContent(
                            i18n.contact.tr,
                            farm?.phoneNumber ?? '',
                          ),
                          GeneralTextContent(
                            i18n.openingTime.tr,
                            farm?.timeOpen ?? '',
                          ),
                          GeneralTextContent(
                            i18n.closingTime.tr,
                            farm?.timeClose ?? '',
                          ),
                          GeneralTextContent(
                            i18n.lineId.tr,
                            farm?.line ?? '',
                          ),
                          GeneralTextContent(
                            i18n.facebook.tr,
                            farm?.facebook ?? '',
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
