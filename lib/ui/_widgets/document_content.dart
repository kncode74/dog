import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx_mvvm_boilerplate/ui/_theme/app_theme.dart';

class DocumentContent extends StatelessWidget {
  final String title;
  List<Widget> widgetList;
  bool isLast;

  DocumentContent({
    super.key,
    required this.title,
    required this.widgetList,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: ThemeData().mainColor(),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          ...widgetList,
          SizedBox(height: 10),
          isLast
              ? Container()
              : Divider(
                  height: 0,
                  thickness: 1.0,
                  color: ThemeData().secondColor(),
                )
        ],
      ),
    );
  }
}
