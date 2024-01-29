import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/assets/r.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/cached_network_image_widget.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/diaLog.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/main_app_bar.dart';
import 'package:getx_mvvm_boilerplate/ui/add_data/add_data.view.dart';
import 'package:getx_mvvm_boilerplate/ui/add_data/add_data.vm.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/tabbar.view.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/tabbar.vm.dart';
import 'package:getx_mvvm_boilerplate/ui/main_screen/dog_card.vm.dart';

class DogCard extends BaseView<DogCardViewModel> {
  DogCard() {
    Get.put(DogCardViewModel());
    controller.init();
  }

  TextEditingController searchController = TextEditingController();

  Widget _listDog(
      String image, String? id, String? status, String? species, String? sex) {
    return ListTile(
      leading: CachedNetworkImageWidget(
        imageDefaultUrl: icon.placeHolder,
        imageUrl: image,
        imageWidgetBuilder: (context, imageProvider) => CircleAvatar(
          radius: 35,
          backgroundImage: imageProvider,
        ),
      ),
      title: Text('$id : $status'),
      subtitle: Text('$species , $sex'),
      trailing: InkWell(
        onTap: () {
          deleteDialog(context!, id ?? '');
        },
        child: SvgPicture.asset(icon.delete),
      ),
    );
  }

  void deleteDialog(BuildContext context, String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomConfirmDialog(
          title: 'Confirmation',
          content: 'Are you sure you want to proceed?',
          onConfirm: () async {
            await controller.delete(id!)?.then(
              (_) {
                controller.loadDogData();
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: 'Data dog', actions: [
        TextButton(
            onPressed: () {
              Get.to(
                AddDataDog(),
                binding: AddDataBinding(),
              )?.then(
                (_) => controller.loadDogData(),
              );
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ))
      ]).mainAppbar,
      body: Obx(() {
        return Column(
          children: [
            // Row(
            //   children: [
            //     SizedBox(
            //       width: 80,
            //       child: DropdownButtonFormField<String>(
            //         value: controller.selectedSearchType?.value,
            //         onChanged: (value) {
            //           controller.selectedSearchType?.value = value ?? '';
            //           searchController.clear();
            //         },
            //         items: const [
            //           DropdownMenuItem<String>(
            //             value: 'all',
            //             child: Text('ทั้งหมด'),
            //           ),
            //           DropdownMenuItem<String>(
            //             value: 'father',
            //             child: Text('ลูกพ่อ'),
            //           ),
            //           DropdownMenuItem<String>(
            //             value: 'mother',
            //             child: Text('ลูกแม่'),
            //           ),
            //         ],
            //         decoration: const InputDecoration(
            //           border: InputBorder.none,
            //         ),
            //       ),
            //     ),
            //     Expanded(
            //       child: Row(
            //         children: [
            //           Expanded(
            //             child: TextFormField(
            //               controller: searchController,
            //               decoration: InputDecoration(
            //                 border: InputBorder.none,
            //                 hintText: 'ค้นหาด้วยรหัสสุนัข',
            //                 prefixIcon: const Icon(Icons.search),
            //                 suffixIcon: GestureDetector(
            //                   onTap: () {
            //                     searchController.clear();
            //                     controller.debouncedSearch('');
            //                   },
            //                   child: const Icon(Icons.cancel),
            //                 ),
            //               ),
            //               onChanged: (val) {
            //                 EasyDebounce.debounce(
            //                   'searchDebounce', // debounce identifier
            //                   const Duration(
            //                       milliseconds: 500), // debounce duration
            //                   () => controller.debouncedSearch(
            //                       val), // function to be executed
            //                 );
            //               },
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.dogList.length,
                itemBuilder: (context, index) {
                  var dog = controller.dogList[index];

                  return InkWell(
                    onTap: () async {
                      await Get.to(
                        () => TabBarDogView(),
                        binding: TabBarDogBinding(),
                        arguments: {"dogId": dog.docId},
                      )!
                          .then(
                        (value) => controller.init(),
                      );
                    },
                    child: _listDog(
                      dog.profileImage ?? '',
                      dog.id,
                      dog.status,
                      dog.species,
                      dog.sex,
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
