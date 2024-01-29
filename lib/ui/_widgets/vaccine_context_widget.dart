import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/assets/image.dart';
import 'package:getx_mvvm_boilerplate/ui/_theme/app_theme.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/cached_network_image_widget.dart';

class VaccineContentWidget extends StatelessWidget {
  // final String title;
  final String vaccine;
  final String date;
  final String image;
  final int index;

  const VaccineContentWidget({
    super.key,
    // required this.title,
    required this.vaccine,
    required this.date,
    required this.image,
    required this.index,
  });

  Widget _listContent() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                icon.calendar,
                height: 30,
              ),
              SizedBox(
                width: 20,
              ),
              Text(date),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SvgPicture.asset(
                icon.vaccine,
                height: 30,
              ),
              SizedBox(
                width: 20,
              ),
              Text(vaccine),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Row(
            children: [
              Text(
                'ครั้งที่ ${index.toString()}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: ThemeData().mainColor(), // Adjust as needed
                ),
              ),
            ],
          ),
        ),
        _listContent(),
        CachedNetworkImageWidget(
          imageUrl: image,
          imageDefaultUrl: icon.placeHolder,
          height: 220,
        ),
      ],
    );
  }
}
