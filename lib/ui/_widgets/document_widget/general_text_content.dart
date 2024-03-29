import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/commons/constants/i18n.dart';
import 'package:getx_mvvm_boilerplate/ui/_theme/app_theme.dart';
import 'package:getx_mvvm_boilerplate/ui/_theme/ui_space.dart';

class GeneralTextContent extends StatelessWidget {
  final String title;
  final String? detail;

  const GeneralTextContent(
    this.title,
    this.detail, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  '${title.tr} :',
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
              HSpacings.xxxSmall,
              Expanded(
                flex: 3,
                child: detail!.isEmpty ? const Text('-') : Text(detail ?? ''),
              ),
            ],
          ),
          Divider(
            height: 32,
            thickness: 1.0,
            color: ThemeData().divider(),
          ),
        ],
      ),
    );
  }
}
