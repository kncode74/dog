import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/ui/_theme/ui_space.dart';

class GeneralFormContent extends StatelessWidget {
  final String title;
  final Widget form;

  const GeneralFormContent(
    this.title,
    this.form, {
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
                flex: 1,
                child: Text(
                  '${title.tr} :',
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
              HSpacings.xxxSmall,
              Expanded(
                flex: 2,
                child: form,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
